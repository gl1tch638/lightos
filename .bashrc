echo Logging in to Archlinux....
proot-distro login --user sammy archlinux

   read -p "Exit to termux? (y/n): " response
   if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
     echo "Exiting archlinux..."
     # Code to execute if the user enters 'yes'
   else
     echo "Closing shell..."
     exit
     # Code to execute if the user enters 'no' or any other input
   fi
