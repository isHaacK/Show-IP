#!/bin/bash
if [ -d '/sys/class/net/tun0/' ]
	then ifconfig tun0 | awk '/inet/{print $2;exit}'
elif [ `cat /sys/class/net/eth0/operstate` = "up" ]
	then ifconfig eth0 | awk '/inet/{print $2;exit}'
elif [ `cat /sys/class/net/wlan0/operstate` = "up" ]
	then ifconfig wlan0 | awk '/inet/{print $2;exit}'
elif [ -d '/sys/class/net/usb0/' ]
	then ifconfig usb0 | awk '/inet/{print $2;exit}'
else
	echo ""
fi
