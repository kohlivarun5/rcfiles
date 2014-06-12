alias gvim='\mvim -O'
alias rm='\rm -i'
alias cat='\cat -n -s'
alias cl='\clear; pwd'
alias ls='cl; \ls -A -a -F -G -h -l -p'

#Set WorkEnv

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR=vi


# history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export HISTCONTROL=ignoredups
export HISTFILESIZE=20000

alias findcpp='find . -name "*.h" -o name "*.cpp" -o -name "*.c"'
alias grepcpp='findcpp | xargs grep '
set -o emacs
shopt -s extglob

eval `opam config env`
#Go to Home
#home
alias gitdiff='git difftool --no-prompt'

export PS1="\[\033[36m\]\w\[\033[m\]@\[\033[32m\] \[\033[33;1m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\033[m\]\n\$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi 
