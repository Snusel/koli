#!/bin/sh
#

#Bitte anpassen:

MYSQLDIR=
MYSQLDB=
MYSQLDBFO=
WEBDIR=
WEBDIR2=
WEB=
BIT=
STORE=
BACKUPDIR=/mnt/storage/backup-skript

#lockal Sicherung:

BACKUP=/mnt/storage/backup-skript/Backup

#Externer Backup Server

IP=
USER=
DIR=/home/Backup

#########################################

ntpdate -u ntp.ubuntu.com

#MYSQL

clear
echo -------------------------------------------
echo In 15 Sekunden wirt das MYSQL Backup Erstelt
echo -------------------------------------------
sleep 15
cd $MYSQLDIR
echo -------------------------------------------
echo Tracker DB Packen
echo -------------------------------------------
tar czpf MYSQL-Backup-Tracker-$(date +%d.%m.%y-%H.%M.%S).tar.gz $MYSQLDB
echo -------------------------------------------
echo Forum DB Packen
echo -------------------------------------------
tar czpf MYSQL-Backup-Forum-$(date +%d.%m.%y-%H.%M.%S).tar.gz $MYSQLDBFO
clear
echo -------------------------------------------
echo MYSQL Backup Erstelt $(date)
echo -------------------------------------------
sleep 15

#WEB

clear
echo -------------------------------------------
echo In 15 Sekunden wirt das HTML Backup Erstelt
echo und Bitbucket Userstore
echo -------------------------------------------
sleep 15
cd $WEBDIR
echo -------------------------------------------
echo HTML Verzeichnis Packen $WEB
echo -------------------------------------------
tar czpf HTML-Backup-$(date +%d.%m.%y-%H.%M.%S).tar.gz $WEB
cd $WEBDIR2
echo -------------------------------------------
echo $BIT Packen
echo -------------------------------------------
tar czpf HTML-Backup-Bitbucket-$(date +%d.%m.%y-%H.%M.%S).tar.gz $BIT
echo -------------------------------------------
echo $STORE Packen
echo -------------------------------------------
tar czpf HTML-Backup-Userstore-$(date +%d.%m.%y-%H.%M.%S).tar.gz $STORE
clear
echo -------------------------------------------
echo HTML Backup Erstelt $(date)
echo -------------------------------------------
sleep 5
clear
echo -------------------------------------------
echo HTML und MYSQL Backup Zusamenfeugen
echo und sql werden Erstelt
echo $(date)
echo -------------------------------------------
cd $BACKUPDIR
rm *.tar.gz
cd $MYSQLDIR
mv *.tar.gz $BACKUPDIR
cd $WEBDIR
mv *.tar.gz $BACKUPDIR
cd $WEBDIR2
mv *.tar.gz $BACKUPDIR
cd $BACKUPDIR
echo -------------------------------------------
echo Mysqldump $MYSQLDB Ersteln
echo -------------------------------------------
mysqldump $MYSQLDB > MYSQL-Tracker-$(date +%d.%m.%y-%H.%M.%S).sql
sleep 15
echo -------------------------------------------
echo Mysqldump $MYSQLDBFO Ersteln
echo -------------------------------------------
mysqldump $MYSQLDBFO > MYSQL-Forum-$(date +%d.%m.%y-%H.%M.%S).sql
echo -------------------------------------------
echo Alle Datein Packen
echo -------------------------------------------
tar czpf HTML-MYSQL-Backup-$(date +%d.%m.%y-%H.%M.%S).tar.gz *.tar.gz *.sql
echo -------------------------------------------
echo Loeschung Aller Unoetigen Datein
echo Und kopy in das lockale Backup verzeichnis
echo -------------------------------------------
rm HTML-Backup-*.tar.gz
rm MYSQL-Backup-*.tar.gz
rm *.sql
cp HTML-MYSQL-Backup-*.tar.gz $BACKUP
cd $BACKUP
find *.tar.gz -mtime +7 -exec rm {} \;
cd ..
echo -------------------------------------------
echo Backup Erstelt und Ist in $BACKUPDIR
echo Datei *.tar.gz
echo -------------------------------------------
echo -------------------------------------------
echo Uebertragen Auf 2 Server
echo $IP
echo in das Verzeichnis $DIR
echo -------------------------------------------
scp HTML-MYSQL-Backup-*.tar.gz $USER@$IP:$DIR