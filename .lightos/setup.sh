#!/usr/bin/env bash

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

mv ~/lightos/.lightos ~
cd ~/.lightos
mv .bashrc ~/.bashrc

#choose distro
echo "Only archlinux supported for now!"
chosendistroalias=$(gum choose --limit 1 --header "Please choose your preferred version" adeliealpine archlinux artix chimera debian deepin fedora manjaro opensuse pardus rockylinux ubuntu void)
sed -i -e "s/replaceosstr/$chosendistroalias/g" ~/.bashrc

setupTheme() {
cp theme/fonts/CaskaydiaCoveNerdFontMono-Regular.ttf ~/.termux/font.ttf
cp theme/colors/base16-3024-light.properties ~/.termux/colors.properties
}

installPROOT() {
echo installing proot tools...
pkg update
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y pulseaudio
pkg install -y proot-distro
proot-distro install $chosendistroalias
}

installTUR() {
echo installing termux user repo...
pkg install -y tur-repo
}

installHardwareAccel() {
echo installing hardware acceleration packages...
installTUR
pkg install -y mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android
}

setupUsefulSymlink() {
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$chosendistroalias prootdir
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$chosendistroalias/root/termuxdir
ln -s ~ /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$chosendistroalias/root/termuxdir/to
}

finishNativeSetup() {
cp rootsetupbase.sh rootsetup.sh
mv rootsetup.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$chosendistroalias/root
echo "chmod +x rootsetup.sh && ./rootsetup.sh" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$chosendistroalias/root/.profile
proot-distro login $chosendistroalias
}

setupTheme
gum confirm "setup hardware acceleration?" && installHardwareAccel || echo "not setting up hardware acceleration"
setupUsefulSymlink
installPROOT
finishNativeSetup
