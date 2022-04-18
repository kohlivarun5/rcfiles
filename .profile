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

alias ls='clear; \ls --color=auto -A -a -F -G -h -l -p '
#Go to Home
alias gitdiff='git difftool --no-prompt'
alias findcpp='find . -name "*.h" -o -name "*.cpp" -o -name "*.c"'
alias findpy='find . -name "*.h" -o -name "*.cpp" -o -name "*.c"'
alias grepcpp='findcpp | xargs grep '
alias greppy='findpy | xargs grep '

#Set WorkEnv
export EDITOR=vi

# history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export HISTCONTROL=ignoredups
export HISTFILESIZE=20000

set -o emacs
shopt -s extglob

alias truncdir='pwd | sed "s/\(\/[^\/]*\/[^\/]*\/[^\/]*\)\(\/[^\/]*\).*\(\/[^\/]*\/[^\/]*\)$/...\3/g"'

PS1='`truncdir`\$ '
function prompt {  
    local ORANGE="\[\033[0;33m\]"  
    local GREEN="\[\033[0;32m\]"  
    local RED="\[\033[0;31m\]"  
    local BLUEBOLD="\[\033[0;34m\]"
    local RESET="\[\033[00m\]"  
    local git_branch="(\$(git rev-parse --abbrev-ref HEAD 2>/dev/null))"
    local curr_dir='`truncdir`'

    #export PS1="\n$BLACKBOLD[\t]$GREEN@\h$RESET:$BLUEBOLD$RESET\n$RED$git_branch$RESET"'$'
    if [[ $platform == "Darwin" ]]; then 
        export PS1="\n$ORANGE[\@]$RESET$RED$git_branch$RESET:$BLUEBOLD$curr_dir$RESET\n"'$'
    else 
        export PS1="\n$ORANGE[\@]$RESET$GREEN[\h]$RESET$RED$git_branch$RESET:$BLUEBOLD$curr_dir$RESET\n"'$'
    fi;
}
prompt

#Colorization options
export PAGER=less
export TERM=xterm-color
export GREP_OPTIONS='--color=auto'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi 

if [ -f ~/.profile.local ]; then
    source ~/.profile.local    
fi 


settitle()
{
    printf \\033]0\;\%s\\007 "$@"
}

alias ls-size="du -sh * | sort -rh"
alias space="df -h ."