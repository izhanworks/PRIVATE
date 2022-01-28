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
echo -e " ═════════════════════════════════════════"
echo -e "            ShadowsocksR     " 
echo -e " ═════════════════════════════════════════"
echo -e " " 
echo -e "   [ 1 ]  Create SSR Account"
echo -e "   [ 2 ]  Delete SSR Account"
echo -e "   [ 3 ]  Extend SSR Account Active Life"
echo -e "   [ 4 ]  Show Other SSR Menu"
echo -e "   [ 0 ]  Exit to Menu" 
echo -e " ═════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please Input Number  :  "  ssr
echo -e "\e[0m"
case $ssr in
1)
add-ssr
;;
2)
del-ssr
;;
3)
renew-ssr
;;
4)
ssr
;;
0)
menu
;;
*)
echo -e "Please enter an correct number"
sleep 1
clear
mssr
;;
esac
