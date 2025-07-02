#!/usr/bin/env bash

mv .lightos ~
cd ~/.lightos

echo installing proot tools...
pkg update
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install proot-distro
pkg install openssh 

# echo installing termux user repo...
# pkg install tur-repo
# echo installing hardware acceleration packages...
# pkg install mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android

echo installing archlinux proot...
proot-distro install archlinux
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux prootdir
cp rootsetupbase.sh rootsetup.sh
mv rootsetup.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root
echo "chmod +x rootsetup.sh && ./rootsetup.sh" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/.profile

proot-distro login archlinux
