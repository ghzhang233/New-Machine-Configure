# Configure the aliases
if [ ! -f .bash_aliases ]; then
    cp ./.bash_aliases ~/.
else
    cat ./.bash_aliases >> ~/.bash_aliases
fi

if ( ! grep -q ./.bash_aliases ~/.bashrc ) 
then
    echo 'if [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi' >> ~/.bashrc
fi


# Configure the Vim
if [ ! -d ~/Vim-Zarth ]; then
    git clone https://github.com/ghzhang233/Vim-Zarth.git ~/Vim-Zarth
    cd ~/Vim-Zarth
    bash run.sh
fi


# Configure the Anaconda
if [ ! -d ~/anaconda3 ]; then
    cd ~
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
    bash Anaconda3-2021.05-Linux-x86_64.sh
    cd ~/anaconda3/bin
    ./conda init
    srrc
    conda update conda
    conda update anaconda
fi


# Configure the conda environment
conda create -n gh_torch python scikit-learn pandas tqdm nltk ipython pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
conda create -n gh_tf2 python scikit-learn pandas tqdm nltk tensorflow-gpu ipython
conda create -n gh_tf1 python scikit-learn pandas tqdm nltk tensorflow-gpu=1.15 ipython
