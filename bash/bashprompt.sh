set_prompt () {
    Last_Command=$? # Must come first!
    Reset='\[\e[0m\]'
    Blue='\[\e[0;34m\]'
    White='\[\e[0;37m\]'
    Red='\[\e[0;31m\]'
    Green='\[\e[0;32m\]'
    IGreen='\[\e[0;92m\]'
    Purple='\[\e[0;35m\]'
    Grey='\[\e[0;37m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    nfiles="\$(ls -1 | wc -l | sed 's: ::g') files"
    nsize="\$(ls -skh | head -n1 | sed 's/total //')b"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="verbose"
    GIT_PS1_SHOWCOLORHINTS=1

    if [[ -n $SSH_CONNECTION ]]; then
        PS1="\n$Red(ssh) "
        PS1+="$IGreen\u"
        PS1+="$Grey@"
        Ps1+="$Purple\h "
    else
        PS1="\n$IGreen\u "
    fi
    PS1+="($IGreen\j jobs$Grey) ($IGreen\@ \d$Grey)\n"
    PS1+="$Blue\w$Grey$Red\$(__git_ps1)$Grey\n"
    PS1+="$Grey("
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark"
    else
        PS1+="$Red$FancyX"
    fi
    PS1+="$Grey) "
    PS1+="$IGreen\$ $Reset"
    }
