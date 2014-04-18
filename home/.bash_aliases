alias ffind='find . -name'
alias fcode='grep --exclude-dir=build --exclude-dir=.svn --exclude-dir=.git --include=*.{c,h,cc,hh,cpp,hpp} -R -n -T -C 1'
alias fmakefile='grep --exclude-dir=build --exclude-dir=.svn --exclude-dir=.git --include=Makefile --include=*.mk -R -n -T -C 1'
alias fdoxygen='grep --exclude-dir=build --exclude-dir=.svn --exclude-dir=.git --include=*.dxg -R -n -T -C 1'

#git alias
alias gco='git checkout'
alias gp='git pull'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gco='git checkout'
alias gs='git status'
alias gsvn='git svn'
alias gd='git diff'
alias gds='git diff --ignore-all-space'
alias gdc='git diff --cached'
alias gdcs='git diff --cached --ignore-all-space'
alias gl='git log'
alias gll='git log --pretty=oneline --abbrev-commit'
alias gla='git log --pretty=format:"%C(green bold)%d%Creset %C(yellow)%h%Creset %s %C(cyan)[%an]"'
alias gappend='git commit --amend -C HEAD'
alias gri='git rebase -i --autosquash'

alias emq='emacsclient -t'
alias em2='emacsclient -n'

alias ..='cd ..'
alias ..2='.. && ..'
alias ..3='..2 && ..'
alias ..4='..3 && ..'

alias glog="git log --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'"

alias ght="git log --graph --date=relative --date-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'"
alias ghta="git log --graph --date=relative --all --date-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'"

alias gha="git log \$(git rev-parse --symbolic --branches | tr '\n' ' ') --graph --date=relative --topo-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset' --"
# alias gha="git log --graph --date=relative --all --topo-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'"
alias gh="git log --graph --date=relative --topo-order --pretty=format:'%C(cyan)[%an]%Creset %C(green bold)%d%Creset %C(yellow)%h%Creset : %s %C(cyan)[%ad]%Creset'"

alias gco="git checkout"
alias grebase="~/.grebase.sh"
alias gfilter.user="~/.gfilter.user.sh"
alias gfilter.svn='git filter-branch --msg-filter "sed -e \"/git-svn-id/d\""'
alias gbug="~/.gbug.sh"
alias gprefix-bug="~/.gprefix-bug.sh"
alias gbranch-point-svn="~/.gbranch-point-svn.sh"
alias gdcommit-dry-run="~/.gdcommit-dry-run.sh"
alias gc="git commit -m"
alias gstash="git stash"
alias gpop="git stash pop"

alias gstyle="git commit -m \"Code style fix\""
alias gcomment="git commit -m \"Updated comments\""
alias gtypo="git commit -m \"Fixed typo\""
alias gbuildfix="git commit -m \"Build fix\""

alias etrim="~/.etrim.sh"
alias edos2unix="~/.edos2unix.sh"
alias econvert="~/.econvert.sh"
