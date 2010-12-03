# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PAGER=most; export PAGER
EDITOR=gvim; export EDITOR
alias clang='$HOME/opt/bin/clang'
alias clang++='$HOME/opt/bin/clang++'
PATH=$PATH:/opt/eclipse; export PATH
PATH=$PATH:/opt/jdk1.6.0_22/bin; export PATH 
PATH=$PATH:$HOME/opt/depot_tools; export PATH

# User specific aliases and functions
if [ "$PS1" ] ; then  
   mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
   echo $$ > /dev/cgroup/cpu/user/$$/tasks
   echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
fi
