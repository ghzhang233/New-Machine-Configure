This is the configure script for new machines to adjust it to my working habit.
To use this, you should firstly run the following code and add the public key to [GitHub](https://github.com/settings/ssh/new). After that, clone this repo to your machine and run *run.sh* to finish remaining configurations.

```
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -C youremail@domain.com
    cat ~/.ssh/id_rsa.pub
fi
```
Or you may use 
```
if [ ! -f path_to_your_id_rsa.pub ]; then
    ssh-keygen -t rsa -C youremail@domain.com -f path_to_your_id_rsa
    ssh-add path_to_your_id_rsa
    cat path_to_your_id_rsa
fi
```
