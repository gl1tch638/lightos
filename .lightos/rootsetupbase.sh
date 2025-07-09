#!/usr/bin/env bash

setupDE() {
chosendesktop=$(gum choose --limit 1 --header "Choose a desktop enviornment:" xfce4 lxde cinnamon kde-plasma-desktop gnome openbox nodesktop) #wayland: labwc hyprland

case $chosendesktop in 
nodesktop)
break
;;
gnome)
chosendesktop= "nano gnome gnome-shell gnome-terminal gnome-tweaks gnome-software nautilus gnome-shell-extension-manager gedit tigervnc-tools gnupg2"
;&
*)
pacman -S $chosendesktop dbus --noconfirm
# if de=gnome them "find /usr -type f -iname "*login1*" -exec rm -f {} \; && mkdir /run/dbus"
;;
esac
}

echo "updating and installing nescecarry packages... this may take a while"

pacman -Syu --noconfirm
pacman -S sudo fish gum --noconfirm

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
sed -i -e "s/replaceuserstr/$newuser/g" /root/termuxdir/to/.bashrc
useradd -m -G wheel $newuser
echo "Enter a password for $newuser (this can be changed later):"
passwd $newusername
echo "$newuser ALL=(ALL) ALL" >> /etc/sudoers
chsh -s /usr/bin/fish $newuser

gum confirm "setup desktop enviornment?" && setupDE || echo "failed setting up graphical enviornment!"

rm /root/.profile
