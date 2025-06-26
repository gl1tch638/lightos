#!/usr/bin/env bash

read -p "Type a name for the new user: " newuser

pkg update
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install proot-distro

# hardware accel
# echo installing termux user repo...
# pkg install tur-repo
# echo installing hardware acceleration packages...
# pkg install mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android

proot-distro install archlinux
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux prootdir
ln -s ~ /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/termuxroot

cp rootsetupbase.sh rootsetupfinal.sh
sed -i "s/newusername/$newusername/" rootsetupfinal.sh
mv rootsetupfinal.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root
echo "chmod +x rootsetupfinal.sh && ./rootsetupfinal.sh" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/.profile

proot-distro login archlinux



