#!/bin/bash
#  Script.sh
#
#  Created by Marc Levine on 4/2/12.
#  Copyright (c) 2012 Marc Levine. All rights reserved.
#
#

if [ -z "$1" ] 
then
opt=0
else
opt=$1
fi

for f in * 
do
#test if directory
    if [ -d "$f" ]
    then
    echo "Processing $f "
    cd "$f"

    ct=0
    y="false"


       for x in *
            do
        #add option to traverse another directory if opt2=1

        

        extension=${x##*.}
        filename=${x%.*}
        e2=${x##*.}
       if [ "$extension" == "JPG" ] || [ "$extension" == "jpeg" ]
        then
        extension="jpg"

       fi
		if [ $ct -eq $opt ] && [ "$extension" == "jpg" ] 
                then
            if [ ! -f ../"$f.jpg" ]; then
               cp -fp -- "$x" ../"$f.jpg"
            fi
		y="true"
        
		fi
		 ((ct += + 1))

		done

    cd ..
    fi
done
