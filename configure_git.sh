# Configure the git
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -C ghzhang233@outlook.com
    cat ~/.ssh/id_rsa.pub
fi


