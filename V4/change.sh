#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Stunnel4"
echo -e "     [2]  Change Port OpenVPN"
echo -e "     [3]  Change Port Vless"
echo -e "     [4]  Change Port Squid"
echo -e "     [0]  Exit to Menu"
echo -e "======================================"
echo -e "\e[1;31m"
read -p "     Select From Options [1-8 or x] :  " port
echo -e "\e[0m"
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-vless
;;
4)
port-squid
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
clear
change
;;
esac
