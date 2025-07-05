#!/usr/bin/env bash

touch install.log
echo updating repos... please wait
pkg update &>> install.log
echo installing nescecarry packages...
pkg install -y gum openssh &>> install.log

# while true; do
# echo "please accept the storage permission"
# termux-setup-storage
# sleep 1
# echo "please accept the storage permission"
# if test -d ~/storage; then
# break
# else
# echo "storage denied, please try again"
# fi
# done

gum spin --show-error --title "initalizing proot directories" -- mv ~/lightos/.lightos ~ && cd ~/.lightos && mv .bashrc ~/.bashrc && cp theme/fonts/CaskaydiaCoveNerdFontMono-Regular.ttf ~/.termux/font.ttf && cp theme/colors/base16-3024-light.properties ~/.termux/colors.properties

gum spin --show-error --title "installing proot tools..." -- pkg install -y x11-repo &>> install.log && pkg install -y termux-x11-nightly &>> install.log && pkg install -y pulseaudio &>> install.log && pkg install -y proot-distro &>> install.log

gum spin --show-error --title "installing termux user repo..." -- pkg install -y tur-repo &>> install.log
gum spin --show-error --title "installing hardware acceleration packages..." -- pkg install -y mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android &>> install.log

gum spin --show-error --title "installing archlinux proot..." -- proot-distro install archlinux &>> install.log

gum spin --show-error --title "creating symlinks..." -- ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux prootdir &>> install.log && mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/termuxdir &>> install.log && ln -s ~ /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/termuxdir/to &>> install.log

gum spin --show-error --title "initalizing root setup step..." -- cp rootsetupbase.sh rootsetup.sh &>> install.log && mv rootsetup.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root &>> install.log && echo "chmod +x rootsetup.sh && ./rootsetup.sh" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root/.profile

proot-distro login archlinux
