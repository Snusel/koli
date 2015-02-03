#!/bin/sh
#

# script by Snusel

menu () {
    clear
    echo ""
    echo "1) Webmin Installieren oder Deinstallieren"
    echo "2) "
    echo "3) "
    echo "4) "
    echo "5) "
    echo "6) "
    echo "7) "
    echo "8) "
    echo "9) "
    echo "10) "
    echo "11) "
	echo "12) "
	echo "13) "
	echo "14) "
	echo "15) "
	echo "16) "
	echo "17) "
	echo "18) "
	echo "19) "
	echo "20) "
	echo "21) "
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
	wget https://github.com/Snusel/koli/blob/koli/skripte/webmin-menu.sh
	chmod 0755 webmin-menu.sh
	./webmin-menu.sh
	rm webmin-menu.sh
	    exit 0
	;;
	2)
	    exit 0
	;;
	3)
	    exit 0
	;;
	4)
	    exit 0
	;;
	5)
	    exit 0
	;;
	6)
	    exit 0
	;;
	7)
	    exit 0
	;;
	8)
	    exit 0
	;;
	9)
	    exit 0
	;;
	10)
	    exit 0
	;;
	11)
	    exit 0
	;;
	12)
	    exit 0
	;;
	13)
	    exit 0
	;;
	14)
	    exit 0
	;;
	15)
	    exit 0
	;;
	16)
	    exit 0
	;;
	17)
	    exit 0
	;;
	18)
	    exit 0
	;;
	19)
	    exit 0
	;;
	20)
	    exit 0
	;;
	21)
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