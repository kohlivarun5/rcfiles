alias gvim='\mvim -O'
alias rm='\rm -i'
alias cat='\cat -n -s'
alias cl='\clear; pwd'
alias ls='cl; \ls -A -a -F -G -h -l -P -p'

#Set WorkEnv

workenv='/Users/varunkohli/SkyDrive/GitHub/'
alias bde='cd $workenv/bde/ocaml/groups/bdl/bdldt; cl;'

alias home='cd $workenv; cl;'
PATH=$PATH:~/.bin:/Users/varunkohli/Applications/arcanist/arcanist/bin/
PATH=$PATH:~/.gem/ruby/2.0.0/bin
PATH=$PATH:/Library/Developer/mongo/bin
PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/

alias mongo_start='sudo mongod --dbpath /Volumes/Lion/DB_Data/mongo'

##
# Your previous /Users/varunkohli/.profile file was backed up as /Users/varunkohli/.profile.macports-saved_2012-09-01_at_19:30:37
##

# MacPorts Installer addition on 2012-09-01_at_19:30:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR=vi
# Finished adapting your PATH environment variable for use with MacPorts.

##
## Added by Varun Kohli on 9/1/2012

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
home
source /Users/varunkohli/.rvm/scripts/rvm 
alias gitdiff='git difftool'

export PS1="\[\033[36m\]\w\[\033[m\]@\[\033[32m\] \[\033[33;1m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\033[m\]  \$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi 

export PYTHONPATH=$PYTHONPATH:.:./lib/:/opt/local/Library/Frameworks/Python.framework/Versions
/2.7/lib/python2.7/site-packages/

