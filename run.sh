echo -n "Enter your aka (e.g. zarth): "
read aka
echo -n "Enter your home directory (e.g. /home/username): "
read path_home

# Configure git
echo -n "Do you want to configure git? (y/n)"
read response
if [ "$response" = "y" ]; then
    echo "Enter your git user.name: "
    read user_name
    git config --global user.name ${user_name}
    echo "Enter your git user.email: "
    read user_email
    git config --global user.email ${user_email}
fi

# Configure the alias
echo -n "Do you want to configure alias? (y/n) "
read response
if [ "$response" = "y" ]; then

    # Configure the aliases
    if [ ! -f ${path_home}/.${aka}_aliases ]; then
        cp ./.${aka}_aliases ${path_home}/.
    else
        cat ./.${aka}_aliases >> ${path_home}/.${aka}_aliases
    fi

    if ( ! grep -q ${path_home}/.${aka}_aliases ~/.bashrc )
    then
        echo 'if [ -f ${path_home}/.${aka}_aliases ]; then . ${path_home}/.${aka}_aliases ; fi' >> ~/.bashrc
    fi
    source ~/.bashrc
fi


# Configure the Vim
echo -n "Do you want to configure Vim? (y/n) "
read response
if [ "$response" = "y" ]; then
    if [ ! -d ${path_home}/Vim-Zarth ]; then
        git clone https://github.com/${aka}zhang233/Vim-Zarth.git ${path_home}/Vim-Zarth
        cd ${path_home}/Vim-Zarth
        bash run.sh
    fi
fi


# Configure the Anaconda
echo -n "Do you want to configure Anaconda? (y/n) "
read response
if [ "$response" = "y" ]; then
    if [ ! -d ${path_home}/anaconda3 ]; then
        cd ${path_home}
        wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
        bash Anaconda3-2021.05-Linux-x86_64.sh
        cd ${path_home}/anaconda3/bin
        ./conda init
        ./conda update conda
        ./conda update anaconda
    fi
fi


# Configure the conda environment
echo -n "Do you want to configure widely-used Python environments? (y/n) "
read response
if [ "$response" = "y" ]; then
    echo -n "Enter your path to conda: "
    read path_to_conda
    cd ${path_to_conda}/bin
    ./conda install zip unzip
    ./conda create -n ${aka}_torch python scikit-learn pandas matplotlib tqdm nltk ipython gitpython pytorch torchvision torchaudio torchtext transformers cudatoolkit=10.2 -c pytorch
    ./conda create -n ${aka}_tf2 python scikit-learn pandas matplotlib tqdm nltk tensorflow-gpu ipython gitpython
    ./conda create -n ${aka}_tf1 python scikit-learn pandas matplotlib tqdm nltk tensorflow-gpu=1.15 ipython gitpython
fi
