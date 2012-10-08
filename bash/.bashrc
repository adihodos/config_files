#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias yesman='pacman --noconfirm'
#
# bla bla
#
EDITOR=gvim; export EDITOR
export DISPLAY=:0
PAGER=most; export PAGER
PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

export PATH="/usr/local/texlive/2011/bin/x86_64-linux:$PATH"
export PATH="/usr/local/clang/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export WM5_PATH="$HOME/opt/dev/sdks/GeometricTools/WildMagic5"
export V8SDK_DIR="$HOME/opt/dev/sdks/v8sdk"

export LD_LIBRARY_PATH="/usr/local/clang/lib:$LD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/Trolltech/Qt-4.8.11/lib:$LD_LIBRARY_PATH"

export MANPATH="/usr/local/texlive/2011/texmf/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2011/texmf/doc/info:$INFOPATH"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc" 

#man() {
#    yelp "man:$@";
#}
