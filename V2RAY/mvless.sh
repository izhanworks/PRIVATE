#!/bin/bash

clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear

echo -e ""
echo ""
echo -e " ═════════════════════════════════════════════" 
echo -e "                     VLESS                    "   
echo -e " ═════════════════════════════════════════════" 
echo -e " " 
echo -e "   [ 1 ] Create Vless Account"
echo -e "   [ 2 ] Delete Vless Account"
echo -e "   [ 3 ] Extending Vless Account Active Life"
echo -e "   [ 4 ] Check Vless User Login"
echo -e "   [ 0 ] Exit to Menu"
echo -e " ═════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please select an option :  "  vless
echo -e "\e[0m"
case $vless in
      1)
      add-vless
      ;;
      2)
      del-vless
      ;;
      3)
      renew-vless
      ;;
      4)
      cek-vless
      ;;
      0)
      menu
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 1
      clear
      mvless
      ;;
      esac
