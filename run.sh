# Configure git
git config --global user.name ghzhang
git config --global user.email ghzhang233@outlook.com

# Configure the aliases
if [ ! -f ~/.gh_aliases ]; then
    cp ./.gh_aliases ~/.
else
    cat ./.gh_aliases >> ~/.gh_aliases
fi

if ( ! grep -q ~/.gh_aliases ~/.bashrc ) 
then
    echo 'if [ -f ~/.gh_aliases ]; then . ~/.gh_aliases ; fi' >> ~/.bashrc
fi
source ~/.bashrc


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
    ./conda update conda
    ./conda update anaconda
fi


# Configure the conda environment
cd ~/anaconda3/bin
./conda install zip unzip
./conda create -n gh_torch python scikit-learn pandas matplotlib tqdm nltk ipython gitpython pytorch torchvision torchaudio torchtext cudatoolkit=10.2 -c pytorch
./conda create -n gh_tf2 python scikit-learn pandas matplotlib tqdm nltk tensorflow-gpu ipython gitpython
./conda create -n gh_tf1 python scikit-learn pandas matplotlib tqdm nltk tensorflow-gpu=1.15 ipython gitpython
