#!/usr/bin/env bash

read -p "Type a name for the new user: " newuser

echo "updating and installing nescecarry packages... when it stops for input select the window and press enter"

pacman -Syu
pacman -S sudo fish

echo Creating new user $newuser...
useradd -m -G wheel $newuser
echo "Enter a password for $newuser (this can be changed later):"
passwd $newusername
echo enter password for root acct (recomended same as user
passwd
echo "$newuser ALL=(ALL) ALL" >> /etc/sudoers
chsh -s /usr/bin/fish $newuser

echo installing quality of life packages...
pacman -S man wget fastfetch tmux micro
echo "set -g mouse on" >> ~/.tmux.conf

# echo downloading paru...
sudo pacman -S git base-devel
cd /home/$newuser
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
echo to finish installation, switch to new user, find folder and run command: makepkg -sri

rm /root/.profile
