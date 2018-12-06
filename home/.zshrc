# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

######################################################################
# zshell configuration
######################################################################

# load & run compinit
autoload -U compinit
compinit -i

zstyle ':completion:*' hosts off
zstyle ':completion:*' menu select

# colors
autoload -U colors
colors

# ignore duplicates in the history
setopt HIST_IGNORE_DUPS

# prompt
autoload -U promptinit
promptinit
prompt adam2


DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

######################################################################
# other
######################################################################

# homebrew stuff first
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export PROMPT="%{$fg[white]%}%~%# %{$reset_color%}"
#export RPROMPT="%*"

# grep
alias grep='grep --color=auto'

# ls
alias ls='ls -G'
alias ll='ls -laG'

# history
export HISTFILE=$HOME/.zhistory
export HIST_REDUCE_BLANKS=1
export HISTSIZE=10000
export SAVEHIST=10000

PROJECTS_DIR=~/Documents/projects

# jumps
alias j='cd'
alias jj='cd -'
alias ju='cd ..'

# emacs
alias em='emacsclient -a "" -c'
export GIT_EDITOR='vim'
alias ema='emacsclient -a "" -c $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --name-only HEAD^..HEAD); do echo $cdup$f; done)'
alias emd='emacsclient -a "" -c $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --name-only); do echo $cdup$f; done)'
alias emdc='emacsclient -a "" -c $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --cached --name-only); do echo $cdup$f; done)'

# diff
alias diff='colordiff'

# git
alias g='git'

# add
alias ga='git add -up'
alias gaa='git add'

# commit
alias gc='git commit'
alias gcc='git commit -C'
alias gcm='git commit -m'
alias gam='git commit --amend'
alias gap='git commit --amend -C HEAD'
alias gfix='git commit --fixup'

# branch
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gup='git branch --set-upstream-to'

# checkout
alias gco='git checkout'

# diff
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --word-diff'

# log
alias gl='git log --oneline'
alias gll='git log'
alias glr='git ls-remote'
alias gls='git log --oneline --stat'
alias glf='git log --format='
alias gha="git log \$(git rev-parse --symbolic --branches | tr '\n' ' ') --graph --date=relative --topo-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset' --"

# show
alias gw='git show'
alias gww='git show --word-diff'
alias gss='git show --stat'

# status
alias gs='git status'
alias gsh='git status --short'

# stash
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'

# cd
alias gcd='cd $(git rev-parse --show-toplevel || echo ".")'

# fetch
alias gfa='git fetch --all'
alias gsync='git submodule update --init --recursive; git fetch --all --prune --tags'

# find
alias gfind='git ls-files | grep'

# grep
alias gg="git grep -n"
alias ggc="clear && git grep -n"

# merge
alias gm='git merge'

# reset
alias grt='git reset'
alias grh='git reset --hard'
alias grhu='git reset --hard @{u}'

# rebase
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i --autosquash'
alias griu='git rebase -i --autosquash @{u}'

cd $PROJECTS_DIR

# make go happy
export GOPATH=$PROJECTS_DIR/go

# automatically use these tools
export PATH="$GOPATH/bin:$PATH"

# diable packer/vagrant checks
export CHECKPOINT_DISABLE=1

# added by travis gem
[ -f /Users/malkolm/.travis/travis.sh ] && source /Users/malkolm/.travis/travis.sh

# docker
alias drun='function _run(){ docker run --rm -it -v $(pwd):/work --workdir /work $@ /bin/sh }; _run'

# kubectl
# alias k='function _k() { kubectl $@ }; _k'
# source <(kubectl completion zsh)
[ -f /Users/malkolm/.kubectl_completion ] && source ~/.kubectl_completion

# pip
# source <(pip completion --zsh)
source ~/.pip_completion

alias htop='sudo htop'
alias gup='git pull --rebase'

# week
alias week='echo Current week: $(date +%V)'

# launchtl-find

launchctl-find () {
  local paths=( \
    ~/Library/LaunchAgents
    /Library/LaunchAgents
    /Library/LaunchDaemons
    /System/Library/LaunchAgents
    /System/Library/LaunchDaemons
  )

  for p in "${paths[@]}"; do
    grep -r "${p}" -e "${1}"
  done
}
