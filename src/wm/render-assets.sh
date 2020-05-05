#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

INDEX="assets.txt"

# Multiple Rendering Cycles.
# for wmbuttontype in '' '-win'; do
# for variant in '' '-light'; do

for i in `cat $INDEX`; do 

ASSETS_DIR="assets${wmtypebutton}${variant}"
SRC_FILE="assets${wmtypebutton}${variant}.svg"

if [ -d $ASSETS_DIR ]; then
    echo
    else
        echo $ASSETS_DIR directory has been created.
        echo
        mkdir $ASSETS_DIR
fi

if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
    else
        echo
        echo Rendering $ASSETS_DIR/$i.png
        $INKSCAPE --export-id=$i \
                  --export-id-only \
                  --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
        && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi

done

# done
# done
# Multiple Rendering Cycles End.

exit 0