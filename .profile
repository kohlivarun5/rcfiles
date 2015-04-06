if [ "$0"x = "-ksh"x ]; 
then  
    if [ -x /bin/bash ]; 
    then    
        SHELL=/bin/bash    
        export SHELL    
        exec /bin/bash  
    fi
fi



platform=`(uname -a | awk '{print $1}')`
if [[ $platform == "Darwin" ]]; then 
    alias gvim='\mvim -O'
else    
    alias gvim='\gvim -O'
fi;


alias rm='\rm -i'
alias cat='\cat -n -s'
alias cl='\clear; pwd'

alias ls='cl; \ls -A -a -F -G -h -l -p '
#Go to Home
alias gitdiff='git difftool --no-prompt'
alias gd='xterm -e "git difftool --no-prompt"'
alias findcpp='find . -name "*.h" -o -name "*.cpp" -o -name "*.c"'
alias findpy='find . -name "*.h" -o -name "*.cpp" -o -name "*.c"'
alias grepcpp='findcpp | xargs grep '
alias greppy='findpy | xargs grep '

#Set WorkEnv
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PYTHONPATH=$PYTHONPATH:.:./lib/:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/
export EDITOR=vi

# history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export HISTCONTROL=ignoredups
export HISTFILESIZE=20000

set -o emacs
shopt -s extglob

# if [[ $platform == "Darwin" ]]; then 
#     eval `opam config env`
# fi;    

if [[ $platform == "Darwin" ]]; then 
    export PS1="\[\033[36m\]\w\[\033[m\]@\[\033[32m\] \[\033[33;1m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\033[m\]  \$ "
else
    alias truncdir='pwd | sed "s/\(\/[^\/]*\/[^\/]*\/[^\/]*\)\(\/[^\/]*\).*\(\/[^\/]*\/[^\/]*\)$/...\3/g"'
    PS1='`truncdir`\$ '
    function prompt {  
        local BLACKBOLD="\[\033[0;32m\]"  
        local RED="\[\033[0;31m\]"  
        local BLUEBOLD="\[\033[0;34m\]"'`truncdir`'
        local RESET="\[\033[00m\]"  
        local git_branch="" #(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))"

        #export PS1="\n$BLACKBOLD[\t]$GREEN@\h$RESET:$BLUEBOLD$RESET\n$RED$git_branch$RESET"'$'
        export PS1="\n$RED$git_branch\n$BLACKBOLD$GREEN[\h]$RESET:$BLUEBOLD$RESET$RESET"'\n$'
    }
    prompt
fi;

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi 

if [ -f ~/.profile.local ]; then
    source ~/.profile.local    
fi 
