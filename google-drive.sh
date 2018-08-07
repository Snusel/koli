#!/bin/bash

# Google Drive Snusel Script

# Aus Welchen Verzeichnis Kopirt werden soll 

DIR1="/home/sdb/kolibri/Anime-BD"
DIR2="/home/sdb/kolibri/Anime-DVD"

# Wohin die datein Kopirt werden sollen 
 
DIR3="/home/sdb/kolibri/google-drive-snusel/Anime-BD"
DIR4="/home/sdb/kolibri/google-drive-snusel/Anime-DVD"

USER="snusel"
GRUPPE="snusel"

############### Script ####################

sudo chgrp -R $GRUPPE $DIR1/ && sudo chown -R $USER $DIR1/
sudo chgrp -R $GRUPPE $DIR2/ && sudo chown -R $USER $DIR2/

for file in $DIR1/*.rar; do
     mv "$file" "${file// /_}"
done

for file in $DIR2/*.rar; do
     mv "$file" "${file// /_}"
done

for file in $DIR1/*.rar; do
     chmod 0664 "$file"
done

for file in $DIR2/*.rar; do
     chmod 0664 "$file"
done

for file in $DIR1/*.rar; do
	filename_1="${file%.*}"
	filename="${filename_1##*/}"
	mkdir -m 0775 -p $DIR3/"$filename"
	cp -a "$file" $DIR3/"$filename"
	rm "$file"
done

for file in $DIR2/*.rar; do
	filename_1="${file%.*}"
	filename="${filename_1##*/}"
	mkdir -m 0775 -p $DIR4/"$filename"
	cp -a "$file" $DIR4/"$filename"
	rm "$file"
done
