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
conda create -n gh_torch python=3.8 scikit-learn pandas tqdm nltk
source ~/anaconda3/etc/profile.d/conda.sh
conda activate gh_torch
conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
conda deactivate

conda create -n gh_tf2 python=3.8 scikit-learn pandas tqdm nltk
source ~/anaconda3/etc/profile.d/conda.sh
conda activate gh_tf2
conda install tensorflow-gpu
conda deactivate 

conda create -n gh_tf1 python=3.8 scikit-learn pandas tqdm nltk
source ~/anaconda3/etc/profile.d/conda.sh
conda activate gh_tf1
conda install tensorflow-gpu=1.15
conda deactivate 
