This is the configure script for new machines to adjust it to my working habit.
To use this, you should firstly run the following code and add the public key to GitHub. After that, run *run.sh* to finish remaining configurations.

```
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -C ghzhang233@outlook.com
    cat ~/.ssh/id_rsa.pub
fi
```