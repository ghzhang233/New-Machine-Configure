TRASH_DIR="$HOME/.my_trash"
if [ ! -d $TRASH_DIR  ]; then    
    mkdir $TRASH_DIR
fi

for i in $*; do
    STAMP=`date +%s`
    fileName=`basename $i`
    mv $i $TRASH_DIR/$fileName.$STAMP
done
