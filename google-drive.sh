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
LOGS="/home/sdb/kolibri/google-drive-log"

############### Script ####################

DATE="$(date +%y-%m-%d_%H:%M:%S)"

sudo chgrp -R $GRUPPE $DIR1/ && sudo chown -R $USER $DIR1/
sudo chgrp -R $GRUPPE $DIR2/ && sudo chown -R $USER $DIR2/

ls $DIR1/*.rar >> $LOGS/$DATE-datei-log-BD.txt
ls $DIR2/*.rar >> $LOGS/$DATE-datei-log-DVD.txt

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
	sudo -u $USER mkdir -m 0775 -p -v $DIR3/"$filename" >> $LOGS/$DATE-mkdir-log-BD.txt
	cp -a "$file" $DIR3/"$filename"
	rm -v "$file" >> $LOGS/$DATE-rm-log-BD.txt
done

for file in $DIR2/*.rar; do
	filename_1="${file%.*}"
	filename="${filename_1##*/}"
	sudo -u $USER mkdir -m 0775 -p -v $DIR4/"$filename" >> $LOGS/$DATE-mkdir-log-DVD.txt
	cp -a "$file" $DIR4/"$filename"
	rm -v "$file" >> $LOGS/$DATE-rm-log-DVD.txt
done
