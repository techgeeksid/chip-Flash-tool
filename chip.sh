#!/bin/bash
#:Title	: chip
#!Date	:27-1-16
#!Author:"k siddhartha varma"
#!version:0.26
while true
do
clear
echo 	 "   _____ _____ _____  ";
echo	 "  / ____|_   _|  __ \ ";
echo	 " | (___   | | | |  | |";
echo	 "  \___ \  | | | |  | |";
echo	 "  ____) |_| |_| |__| |";
echo	 " |_____/|_____|_____/ ";
echo	 "                      "; 
echo "Menu..."
echo "======================================="
echo ""
echo "Enter 1 to Setup Ubuntu For Flashing 1:"
echo ""
echo "Flash-Tool"
echo "Enter 2 to Flash With NTC Buildroot OS 2:"
echo "Enter 3 to Flash With Debian 3:"
echo "Enter 4 to Flash With CHIP Operating System 4:"
echo "Enter 5 to exit"
echo ""
echo "======================================="
echo "Enter option Number:"

read answer
case "$answer" in 

1) 	sudo apt-get update
	sudo apt-get install u-boot-tools android-tools-fastboot git build-essential libusb-1.0-0-dev libncurses5-dev libc6-i386 lib32stdc++6 lib32z1 android-tools-fsutils
   mkdir chip-files
   cd chip-files
git clone http://github.com/NextThingCo/sunxi-tools
		cd sunxi-tools
		make
	sudo rm -f /usr/local/bin/fel
	sudo ln -s $PWD/fel /usr/local/bin/fel
		cd .. 
		git clone http://github.com/NextThingCo/CHIP-tools 
		cd CHIP-tools;;


2) echo "Prepare CHIP with a jumper wire connecting Pin 7 and Pin 39 on header U14 (UBOOT pin and GND)."
  cd chip-files/CHIP-tools
  sudo ./chip-update-firmware.sh;;
3) echo "Prepare CHIP with a jumper wire connecting Pin 7 and Pin 39 on header U14 (UBOOT pin and GND)."
  cd chip-files/CHIP-tools
  sudo ./chip-update-firmware.sh -d ;;
4)echo "Prepare CHIP with a jumper wire connecting Pin 7 and Pin 39 on header U14 (UBOOT pin and GND)."
  cd chip-files/CHIP-tools
  sudo ./chip-update-firmware.sh -d -b stable-gui ;;  
5) exit;;
esac
echo -e "Enter new option"
done

