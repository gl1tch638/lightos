#!/usr/bin/env bash

read -p "Type a name for the new user: " newuser

echo "updating and installing nescecarry packages... when it stops for input select the window and press enter"

pacman -Syu
pacman -S sudo fish

echo Creating new user $newuser...
useradd -m -G wheel $newuser
echo "Enter a password for $newuser (this can be changed later):"
passwd $newusername
echo "$newuser ALL=(ALL) ALL" >> /etc/sudoers
chsh -s /usr/bin/fish $newuser

# move to user aince makepkg catpnnot be run as root
# echo Installing paru...
# sudo pacman -S git base-devel
# git clone https://aur.archlinux.org/paru-bin.git
# cd paru-bin
# makepkg -sri

echo installing quality of life packages...
pacman -S man wget fastfetch 

rm /root/.profile

