if [[ -z $GH_HOME ]] ; then 
    echo -n "Enter your home directory (e.g. /home/username) or leave it blank if use parent directory: "
    read GH_HOME
    if [[ -z $GH_HOME ]] ; then 
        GH_HOME=$(dirname $(pwd))
    fi
    echo "export GH_HOME=$GH_HOME" >> ~/.bashrc
fi
echo "Home Directory=$GH_HOME" 

# Configure ssh
echo -n "Do you want to configure ssh? (y/n) "
read response
if [ "$response" = "y" ]; then
    if [ ! -d "${HOME}/.ssh" ]; then
        mkdir ${HOME}/.ssh
    fi
    path_to_your_id_rsa="${HOME}/.ssh/id_rsa"
    echo -n "Enter your email (e.g. youremail@domain.com) "
    read your_email
    if [ ! -f ${path_to_your_id_rsa}.pub ]; then
        ssh-keygen -t rsa -C ${your_email} -f ${path_to_your_id_rsa}
        ssh-add ${path_to_your_id_rsa}
        cat ${path_to_your_id_rsa}.pub
    fi
    echo "Done!"
fi

# Configure git
echo -n "Do you want to configure git? (y/n) "
read response
if [ "$response" = "y" ]; then
    echo "Enter your git user.name: "
    read user_name
    git config --global user.name ${user_name}
    echo "Enter your git user.email: "
    read user_email
    git config --global user.email ${user_email}
    echo "Done!"
fi

# Configure the alias
echo -n "Do you want to configure alias? (y/n) "
read response
if [ "$response" = "y" ]; then
    # Configure the aliases
    if [ ! -f ${GH_HOME}/.gh_aliases ]; then
        cp ./.gh_aliases ${GH_HOME}/.
    else
        cat ./.gh_aliases >> ${GH_HOME}/.gh_aliases
    fi

    if ( ! grep -q ${GH_HOME}/.gh_aliases ~/.bashrc )
    then
        echo "if [ -f ${GH_HOME}/.gh_aliases ]; then . ${GH_HOME}/.gh_aliases ; fi" >> ~/.bashrc
    fi
    source ~/.bashrc

    cp ./.remove.sh ${GH_HOME}/.remove.sh
    echo "Done!"
fi

# Configure the Vim
echo -n "Do you want to configure Vim? (y/n) "
read response
if [ "$response" = "y" ]; then
    if [ ! -d ${GH_HOME}/Vim-Zarth ]; then
        git clone https://github.com/ghzhang233/Vim-Zarth.git ${GH_HOME}/Vim-Zarth
        cd ${GH_HOME}/Vim-Zarth
        bash run.sh
    fi
    echo "Done!"
fi

# Configure the Miniconda
echo -n "Do you want to configure Miniconda? (y/n) "
read response
if [ "$response" = "y" ]; then
    if [ ! -d ${GH_HOME}/miniforge3 ]; then
        cd ${GH_HOME}
        wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
        bash Miniforge3-$(uname)-$(uname -m).sh
        cd ${GH_HOME}/miniforge3/bin
        ./conda init
    fi
    echo "Done!"
fi


# Configure the conda environment
echo -n "Do you want to configure widely-used Python environments? (y/n) "
read response
if [ "$response" = "y" ]; then
    echo -n "Enter your path to conda (e.g. /home/username/miniforge3): "
    read path_to_conda
    cd ${path_to_conda}/bin
    ./conda install zip unzip
    ./conda create -n py3.10_torch2.5.1 python=3.10 scikit-learn pandas matplotlib tqdm nltk ipython gitpython pytorch=2.5.1 torchvision torchaudio torchtext transformers datasets jupyterlab tensorboard wandb -c pytorch
    echo "Done!"
fi
