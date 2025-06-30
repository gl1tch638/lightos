  GNU nano 8.4              .bashrc
#!/usr/bin/env bash
declare -i autostartval=5
pdusername="sammy"
pdosname="archlinux"
echo -e "welcome to lightos!\nchoose boot type\n[1] lighto>
read -p "==> " -t $autostartval selectedboot
while [[ $selectedboot =~ ^[+-]?[0-9]+$ ]]; do
case $selectedboot in
1)
clear
echo "graphical session not installed, falling back to ter>
;&
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
