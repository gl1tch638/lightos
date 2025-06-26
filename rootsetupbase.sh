#!/usr/bin/env bash

echo "updating and installing nescecarry packages... when it stops for input select the window and press enter"

pacman -Syu
pacman -S sudo fish

echo Creating new user newusername...
useradd -m -G wheel newusername
echo "Enter a password for newusername (this can be changed later):"
passwd newusername
echo "newusername ALL=(ALL) ALL" >> /etc/sudoers
chsh -s /usr/bin/fish newusername 

echo Installing paru,,,
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -sri

echo installing quality of life packages...
pacman -S man wget fastfetch 

rm /root/.profile
