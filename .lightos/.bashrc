#!/usr/bin/env bash
declare -i autostartval=5
pdusername="replaceuserstr" 
pdosname="replaceosstr"
echo -e "welcome to lightos!\nchoose boot type\n[1] lightos graphical\n[2] lightos terminal\n[3] fix mode"
read -p "==> " -t $autostartval selectedboot
while [[ $selectedboot =~ ^[+-]?[0-9]+$ ]]; do
case $selectedboot in
1)
clear

# 'borrowed' from termux-desktops
# Kill open X11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null

# Enable PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &

# Wait a bit until termux-x11 gets started.
sleep 3

# Launch Termux X11 main activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

# Login in PRoot Environment. Do some initialization for PulseAudio, /tmp directory
# and run XFCE4 as user droidmaster.
# See also: https://github.com/termux/proot-distro
# Argument -- acts as terminator of proot-distro login options processing.
# All arguments behind it would not be treated as options of PRoot Distro.
proot-distro login $pdosname --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - $pdusername -c "env DISPLAY=:0 startxfce4"'

exit 0

echo "graphical session not installed, falling back to termux"
;;
2)
clear
echo launching $pdosname...
pd login --user $pdusername $pdosname
exit
break
;;
3)
clear
echo launching fix mode...
break
;;
*)
echo "Invalid, try again"
;;
esac
read -p "==> " -t $autostartval selectedboot
done
