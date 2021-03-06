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


ccred=$(echo -e "\033[0;31m")
ccyellow=$(echo -e "\033[0;33m")
cccyan=$(echo -e "\033[0;36m")
ccend=$(echo -e "\033[0m")

alias make_cmd=`(which make)`

function make()
{
  pathpat="^.*"
  make_cmd "$@" 2>&1 | sed -E \
    -e "/^[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" \
    -e "/^[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g" \
    -e "/^[0-9]+ \|/ s%$pathpat%$cccyan&$ccend%g" \
    -e "/^File \"/ s%$pathpat%$cccyan&$ccend%g"
  return ${PIPESTATUS[0]}
}

complete -W "`grep -oE '^[a-zA-Z][a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/:.*$//'`" make

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
export TERM=xterm-color
export GREP_OPTIONS='--color=auto'
export LSCOLORS=ExFxCxDxBxegedabagacad
export CLICOLOR=1

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

