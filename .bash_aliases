
########################################################################
# This is the aliases created by ghzhang (ghzhang233@outlook.com)
########################################################################

alias clr="clear ; echo $STY ; ls"
alias clrr="clear ; echo $STY ; ls -ralt"
alias srrc="source ~/.bashrc"

openScreen(){
    if ( screen -ls | grep -i $1 )
    then
        screen -r $1
    else
        screen -S $1
    fi
}

alias gh0="openScreen gh0"
alias gh1="openScreen gh1"
alias gh2="openScreen gh2"
alias gh3="openScreen gh3"
alias gh4="openScreen gh4"
alias gh5="openScreen gh4"
alias gh6="openScreen gh0"
alias gh7="openScreen gh0"
alias gh8="openScreen gh0"
alias gh9="openScreen gh0"

########################################################################
# End of aliases by ghzhang
########################################################################

