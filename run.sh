# Configure the aliases
if [ ! -f .bash_aliases ]; then
    cp ./.bash_aliases ~/.
else
    cat ./.bash_aliases >> ~/.bash_aliases
fi

if ( ! grep ./.bash_aliases ~/.bashrc ) 
then
    cat 'if [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi' >> ~/.bashrc
fi

# Configure the Vim
git clone https://github.com/ghzhang233/Vim-Zarth.git ~/Vim-Zarth
cd ~/Vim-Zarth
bash run.sh

# Configure the Anaconda
cd ~
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh
cd ~/anaconda3/bin
./conda init
srrc
conda update conda
conda update anaconda
