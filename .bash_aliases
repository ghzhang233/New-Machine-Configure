
########################################################################
# This is the aliases created by ghzhang (ghzhang233@outlook.com)
########################################################################

alias clr="clear ; echo $STY ; ls"
alias clrr="clear ; echo $STY ; ls -ralt"
alias srrc="source ~/.bashrc"
alias nvi="nvidia-smi"
alias edbrc="vim /mnt/cloud/guanhua/.bash_aliases"
alias ghdir="cd ~"

alias ghtf1="conda activate gh_tf1"
alias ghtf2="conda activate gh_tf2"
alias ghtc="conda activate gh_torch"
alias ghdc="conda deactivate"

killpython() {
    echo "ps | grep python | awk '{print \$1}' | xargs kill"
}
fn() {
    find ./* -name "*${1}*"
}
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
alias gh5="openScreen gh5"
alias gh6="openScreen gh6"
alias gh7="openScreen gh7"
alias gh8="openScreen gh8"
alias gh9="openScreen gh9"

########################################################################
# End of aliases by ghzhang
########################################################################

