# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=/usr/local/bin:$PATH

export PATH=$PATH:/usr/local/share/python

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# load & run compinit
autoload -U compinit
compinit -i

zstyle ':completion:*' hosts off

# colors
autoload -U colors
colors

export PROMPT="%{$fg[white]%}%~%# %{$reset_color%}"
#export RPROMPT="%*"

# grep
export GREP_OPTIONS='--color=auto'

# ls
alias ls='ls -GF'

# history
export HISTFILE=$HOME/.zhistory
export HIST_REDUCE_BLANKS=1
export HISTSIZE=10000
export SAVEHIST=10000

# brew install coreutils
# for cmd in cat date echo readlink sed basename sort;
# do
#   mkdir -p ~/.bin
#   (test -e ~/.bin/$cmd) || (ln -s $(which g$cmd) ~/.bin/$cmd)
# done
export PATH=~/.bin:$PATH

PROJECTS_DIR=~/Documents/projects

# enable git-boots
export PATH=$PROJECTS_DIR/git-boots:$PROJECTS_DIR/git-boots/sandbox:$PATH
export PATH=$PROJECTS_DIR/git-imerge:$PATH

# enagle git-nucleo
export PATH=$PROJECTS_DIR/git-nucleo:$PATH
export PATH=$PROJECTS_DIR/git-nucleo/sandbox:$PATH

# jumps
alias j='cd'
alias jj='cd -'
alias ju='cd ..'

# emacs
alias em='emacs -nw'
export GIT_EDITOR="emacs -nw"
alias ema='emacs -nw $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --name-only HEAD^..HEAD); do echo $cdup$f; done)'
alias emd='emacs -nw $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --name-only); do echo $cdup$f; done)'
alias emdc='emacs -nw $(cdup=$(git rev-parse --show-cdup); for f in $(git diff --cached --name-only); do echo $cdup$f; done)'

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

# branch
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'

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

# stash
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'

# cd
alias gcd='cd $(git rev-parse --show-toplevel || echo ".")'

# fetch
alias gfa='git fetch --all'
alias gf='git fetch o'
alias gff='git fetch --prune --tags o; git remote prune o'
alias gsync='git submodule update --init --recursive; git fetch o; git fetch --prune --tags o; git remote prune o'

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

# boots
alias gsed='git-sed'
alias gt='git-table'
alias gfix='git-fix'

# gerrit
alias git-review-it="rev=$1; gco master && gq @{u} && git pull && git cherry-pick $rev && git push master-rev && gq @{u} && git checkout $rev"

cd $PROJECTS_DIR

function open_chrome() { open /Applications/Google\ Chrome.app/ "$@"; }
function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }
function wiki() { open /Applications/Google\ Chrome.app/ "http://en.wikipedia.org/wiki/Special:Search?search= $1"; }
function jira() {
  local arg="$1"
  if test "$arg" = "${arg/-/}"; then
    arg="CORE-$arg"
  fi
  open /Applications/Google\ Chrome.app/ "https://jira.spotify.net/browse/$arg";
}

alias spm="npm -reg http://npm-registry.spotify.net -userconfig ~/.spmrc --always-auth=true"

export PATH=$PROJECTS_DIR/client-daemon/build:$PATH

export USE_CCACHE=1
export CCACHE_CPP2=1
export PATH=/usr/local/Cellar/ccache/3.1.9/libexec:$PATH

# make go happy
export GOPATH=$PROJECTS_DIR/go

# automatically use these tools
export PATH=$GOPATH/bin:$PATH

#
export PATH=$PROJECTS_DIR/git-extras/bin:$PATH

alias review="git review -vvv"



