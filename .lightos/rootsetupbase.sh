#!/usr/bin/env bash

echo "updating and installing nescecarry packages... this may take a while"

pacman -Syu --noconfirm
pacman -S sudo fish --noconfirm

echo installing quality of life packages...
pacman -S man wget fastfetch micro --noconfirm

echo downloading paru...
sudo pacman -S git base-devel --noconfirm
cd /home/$newuser
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
echo to finish installation, switch to new user, find folder and run command: makepkg -sri
# cd paru-bin && makepkg -sri --noconfirm | su $newuser

read -p "Type a name for the new user: " newuser
echo Creating new user $newuser...
sed -i -e "s/replaceuserstr/$newuser/g" termuxdir/to/.bashrc
useradd -m -G wheel $newuser
echo "Enter a password for $newuser (this can be changed later):"
passwd $newusername
echo "$newuser ALL=(ALL) ALL" >> /etc/sudoers
chsh -s /usr/bin/fish $newuser

rm /root/.profile
