#
# bla bla
#
alias ls='gnuls --color=always'
alias grep='egrep --color=always'
EDITOR=gvim; export EDITOR
PAGER=most; export PAGER
PACKAGEROOT="ftp://ftp2.hu.freebsd.org"; export PACKAGEROOT
PATH="$HOME/opt/bin:$PATH"; export PATH
#LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/opt/lib"; export LD_LIBRARY_PATH
MANPATH="$HOME/opt/share/man:/usr/local/man:/usr/share/man:$MANPATH"; export MANPATH
#PATH="$HOME/opt/archer/bin:$PATH"; export PATH
#PATH="$PATH:$HOME/opt/utils/git_mergetools"; export PATH
#PATH="$PATH:$HOME/opt/utils/depot_tools"; export PATH
PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

if [[ -f "/usr/local/etc/profile.d/infinality-settings.sh" ]]
then
    source "/usr/local/etc/profile.d/infinality-settings.sh"
fi

export GDK_USE_XFT=1
export QT_XFT=true
