#!/bin/sh
#

# script by Snusel

######################################################
# Bitte Anpassen

grupe=users

######################################################

echo "-------------------------------------"
echo "Von welchem User soll kopiert werden?"
echo "-------------------------------------"
echo ""
echo -n "User: "
read user1
echo "-------------------------------------"
echo "Zu welchem User soll kopiert werden?"
echo "-------------------------------------"
echo ""
echo -n "User: "
read user2

cp -R /home/$user1/.rtorrent-session/ /home/$user2/
chgrp $grupe /home/$user2/.rtorrent-session/
chmod 0775 /home/$user2/.rtorrent-session/
chown $user2 /home/$user2/.rtorrent-session/
#
cp /home/$user1/.rtorrent.rc /home/$user2/
chgrp $grupe /home/$user2/.rtorrent.rc
chown $user2 /home/$user2/.rtorrent.rc
#
cp -R /home/$user1/log/ /home/$user2/
#
cp -R /var/www/$user1/ /var/www/$user2/
chgrp -R www-data /var/www/$user2/
chmod -R 0775 /var/www/$user2/
chown -R www-data /var/www/$user2/
#
cp /etc/apache2/sites-available/$user1 /etc/apache2/sites-available/$user2
ln -s /etc/apache2/sites-available/$user2 /etc/apache2/sites-enabled/$user2
#
cp /etc/init.d/$user1-init /etc/init.d/$user2-init
#update-rc.d $user2-init defaults