# Configure the aliases
if [ ! -f .bash_aliases ]; then
    cp ./.bash_aliases ~/.
else
    cat ./.bash_aliases >> ~/.bash_aliases
fi

# Configure the Vim
git clone https://github.com/ghzhang233/Vim-Zarth.git ~/Vim-Zarth
cd ~/Vim-Zarth
bash run.sh
