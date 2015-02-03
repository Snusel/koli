#!/bin/sh
#

# script by Snusel

menu () {
    clear
    echo ""
    echo "1) Webmin Installiren"
    echo "2) Webmin Deinstallieren"
    echo ""
    echo "0) quit"
    echo ""
    echo -n "Enter a digit: "
}

menu

while read MOMO
clear
do

    if [ "$MOMO" == "0" ]
    then
        exit 0
    fi
    
    case "$MOMO" in
	1)
	wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
	cd /etc/apt/sources.list.d
	wget https://github.com/Snusel/koli/blob/koli/liste/webmin.list
	cd
	sudo apt-get update
	sudo apt-get install webmin
	    exit 0
	;;
	2)
	sudo apt-get remove webmin
	cd /etc/apt/sources.list.d
	rm webmin.list
	cd
	sudo apt-get update
	sudo apt-get autoremove
	    exit 0
	;;
	0)
	    exit 0
	;;
	*)
	    menu
	;;
    esac
done

exit 0
