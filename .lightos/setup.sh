#!/usr/bin/env bash

# add while true loop later
echo "please accept the storage permission"
termux-setup-storage

mv .lightos ~
cd ~/.lightos
mv .bashrc ~/.bashrc

echo installing proot tools...
pkg update
yes | pkg install x11-repo
yes | pkg install termux-x11-nightly
yes | pkg install pulseaudio
yes | pkg install proot-distro
yes | pkg install openssh 

# echo installing termux user repo...
# yes | pkg install tur-repo
# echo installing hardware acceleration packages...
# yes | pkg install mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android

echo installing archlinux proot...
proot-distro install archlinux

ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux prootdir
ln -s ~ /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/termuxdir/to

cp rootsetupbase.sh rootsetup.sh
mv rootsetup.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root
echo "chmod +x rootsetup.sh && ./rootsetup.sh" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/.profile

proot-distro login archlinux
