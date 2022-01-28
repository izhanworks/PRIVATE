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
echo -e  "  ═══════════════════════════════════════════════" 
echo -e  "                        TROJAN                   " 
echo -e  "  ═══════════════════════════════════════════════" 
echo -e  "  " 
echo -e  "    [ 1 ] Create Trojan Account"
echo -e  "    [ 2 ] Delete Trojan Account"
echo -e  "    [ 3 ] Extend Trojan Account Active Life"
echo -e  "    [ 4 ] Check User Login Trojan"
echo -e  "    [ 0 ] Exit to Menu" 
echo -e  "  ═══════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please select an option :  "  trojan
echo -e "\e[0m"
case $trojan in
      1)
      add-tr
      ;;
      2)
      del-tr
      ;;
      3)
      renew-tr
      ;;
      4)
      cek-tr
      ;;
      0)
      menu
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 1
      clear
      mtrojan
      ;;
  esac
