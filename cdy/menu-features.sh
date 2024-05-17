#!/bin/bash
clear
echo
echo
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[32;1m                🌏 FEATURES MANAGER 🌏                      \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "    \e[44;37;1m            SERVICE VPS SERVER          \e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[37;1m 01. Running Service \e[0m"
echo -e "\e[37;1m 02. Restart Service \e[0m"
echo -e "\e[37;1m 03. Change Domain \e[0m"
echo -e "\e[37;1m 04. Fixhap domain \e[0m"
echo -e "\e[37;1m 05. Fixcert domain \e[0m"
echo -e "\e[37;1m 06. Fix Udp Custom \e[0m"
echo -e "\e[37;1m 07. Themes Manager \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "    \e[44;37;1m           SYSTEMATIC VPS DATA          \e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[37;1m 08. Backup & Restore vps \e[0m"
echo -e "\e[37;1m 09. AutoBackup Vps \e[0m"
echo -e "\e[37;1m 10. Check Bandwith \e[0m"
echo -e "\e[37;1m 11. Check Vps Monitor \e[0m"
echo -e "\e[37;1m 12. Information System \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "    \e[44;37;1m                SYSTEMD IN ME             \e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[37;1m 13. ABOUTED SCRIPT \e[0m"
echo -e "\e[37;1m 14. UPDATE SCRIPT\e[0m"
echo -e "\e[37;1m 15. BACK TO MENU \e[0m"
echo -e "\e[37;1m 16. REBOOTED SCRIPT \e[0m"
echo -e "\e[37;1m  x. EXIT \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo
read -p "Select From 1 - 16 or x: " lunatic
case $lunatic in
1) clear ; running ;;
2) clear ; restart ;;
3) clear ; cftn ;;
4) clear ; fixhap ;;
5) clear ; fixcert ;;
6) clear ; UDEPE ;;
7) clear ; theme ;;
8) clear ; menu-backup ;;
9) clear ; autobackup ;;
10) clear ; bw ;;
11) clear ; gotop ;;
12) clear ; neo ;;
13) clear ; about ;;
14) clear ; updateyes ;;
15) clear ; menu ;;
16) reboot ;;
*) exit ;;
esac
