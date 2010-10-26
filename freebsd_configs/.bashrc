#!/bin/bash
if [ -f "/etc/profile" ]; then
    source /etc/profile
fi

alias gdb="${HOME}/opt/bin/gdb"
alias gdbtui="${HOME}/opt/bin/gdbtui"
alias make="gmake"