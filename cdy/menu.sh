#!/bin/bash
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
COLOR1='\033[0;35m'
COLOR2='\033[0;39m'
clear
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;36m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;35m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR \e[0m]"
export INFO="[${YELLOW} INFO \e[0m]"
export OKEY="[${GREEN} OKEY \e[0m]"
export PENDING="[${YELLOW} PENDING \e[0m]"
export SEND="[${YELLOW} SEND \e[0m]"
export RECEIVE="[${YELLOW} RECEIVE \e[0m]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"
# Getting
echo "sedang memverifkasi"
MYIP=$(wget -qO- ipinfo.io/ip);
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/LunaticBackend/regip/mytich/ipreg | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
echo -e "verifikasi IP di terima"
    else
echo -e "\e[31m di tolak!\e[0m"
    exit 
fi
}

if [ ! -e /tmp/trojan ]; then
  mkdir -p /tmp/trojan
fi

if [ ! -e /tmp/vmess ]; then
  mkdir -p /tmp/vmess
fi

if [ ! -e /tmp/vless ]; then
  mkdir -p /tmp/vless
fi

IZIN=$(curl -sS https://raw.githubusercontent.com/LunaticBackend/regip/mytich/ipreg | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "status akun masih aktif" 
CEKEXPIRED 
else
echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m"
exit 0
fi
# status
rm -rf /root/status
wget -q -O /root/status "https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/statushariini" 

today=`date -d "0 days" +"%Y-%m-%d"`
Exp2=$(curl -sS https://raw.githubusercontent.com/LunaticBackend/regip/mytich/ipreg | grep $MYIP | awk '{print $3}')
if [ "$Exp2" == "lifetime" ]; then
    Exp2="2099-12-09"
fi
# CERTIFICATE STATUS
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
left=$(((d1 - d2) / 86400))


 
rm cybervpn.zip
rm -rf cybervpn.zip

datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}

systemctl restart fail2ban

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"

#update
wget -q -O updatsc.sh "https://raw.githubusercontent.com/LunaticBackend/vpnscript/mytich/cdy/updateyes.sh" && chmod +x updatsc.sh && ./updatsc.sh 

# // Exporting IP Address
export MYIP=$( curl -s https://ipinfo.io/ip/ )
Name=$(curl -sS https://raw.githubusercontent.com/LunaticBackend/regip/mytich/ipreg | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/LunaticBackend/regip/mytich/ipreg | grep $MYIP | awk '{print $3}')

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="✅ ok"
else
    status_nginx="❌ died"
fi
# // 
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="✅ ok"
else
    status_xray="❌ died"
fi

# // SSH Websocket Proxy
ssh=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_ssh="✅ ok"
else
    status_ssh="❌ died"
fi

## // ddos
dos=$( systemctl status ddos | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $dos == "running" ]]; then
    status_dos="[${GREEN} running\e[0m ]"
else
    status_dos="❌ died"
fi


## // fail2ban
fail2ban=$( systemctl status fail2ban | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $fail2ban == "running" ]]; then
    status_fail2ban="✅ ok"
else
    status_fail2ban="❌ died"
fi


## // net
netfilter=$( systemctl status netfilter-persistent | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $netfilter == "exited" ]]; then
    status_net="✅ ok"
else
    status_net="❌ died"
fi





ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
#bot
clear


#echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\e[0m"
#echo -e "$GREEN┌──────────────────────────────────────────────────┐\e[0m"
#echo -e " ${YELLOW}• Today\e[0m  : [$ttoday] ${YELLOW}• Monthly\e[0m: [$tmon]"
#echo -e "$GREEN└──────────────────────────────────────────────────┘\e[0m"
#echo -e ""
#echo -e "• Status Hari ini    = $(cat /root/status)\e[0m"

function Banner_Script() {
clear
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[32;1m                LUNATIC TUNNELING                   \e[33;1m│\e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
}

function System_Script() {
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "• Server Uptime      = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "• Current Time       = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "• Current Domain     = $( cat /etc/xray/domain )"
echo -e "• Server IP          = $MYIP"
echo -e "• ISP                = $(curl -s ipinfo.io/org | cut -d " " -f 2-10 )\e[0m"
echo -e "• Client             = $Name                           \e[0m"
echo -e "• Expired            = $Exp                           \e[0m"
echo -e "• Remaining          = ${YELLOW}$left Days                          \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
}

function Running_Status() {
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "             🌏${YELLOW} SSH WebSocket\e[0m: ${status_ssh}"
echo -e "             🌏${YELLOW} XRAY\e[0m         : ${status_xray}"
echo -e "             🌏${YELLOW} NGINX \e[0m       : ${status_nginx}"
echo -e "             🌏${YELLOW} Firewall \e[0m    : ${status_net}"
echo -e "             🌏${YELLOW} Fail2ban \e[0m    : ${status_fail2ban}"
echo -e "             🌏${YELLOW} iptables \e[0m    : ${status_net}"
echo -e "             🌏${YELLOW} Anti DDoS \e[0m   : ${status_dos}"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
}

function List_Account() {
echo -e "${GREEN}┌──────────────────────────────────────────────────┐\e[0m"
echo -e "${GREEN}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS     VLESS   TROJAN   SHADOWSOCKS$NC  $COLOR1"
echo -e "${GREEN}│  \033[0m ${Blue} $ssh1        $vma         $vla       $tra           $ssa   $NC"
echo -e "${GREEN}└──────────────────────────────────────────────────┘\e[0m"
}

function Display_Menu() {
echo -e "${GREEN}┌──────────────────────────────────────────────────┐\e[0m"
echo -e " ${CYAN}[${BIWhite}01${BICyan}]${RED} •\e[0m ${CYAN}SSH/CLOUDFRONT  $NC  ${CYAN}[${BIWhite}06${BICyan}]${RED} • \e[0m${CYAN}TROJAN MENU$NC"
echo -e " ${CYAN}[${BIWhite}02${BICyan}]${RED} •\e[0m ${CYAN}SSH UDP MENU    $NC  ${CYAN}[${BIWhite}07${BICyan}]${RED} • \e[0m${CYAN}L2TP & PPTP MENU $NC"
echo -e " ${CYAN}[${BIWhite}03${BICyan}]${RED} •\e[0m ${CYAN}VMESS MENU      $NC  ${CYAN}[${BIWhite}08${BICyan}]${RED} • \e[0m${CYAN}NOOBZVPNS MENU $NC"
echo -e " ${CYAN}[${BIWhite}04${BICyan}]${RED} •\e[0m ${CYAN}VLESS MENU      $NC  ${CYAN}[${BIWhite}09${BICyan}]${RED} • \e[0m${CYAN}BOT TELEGRAM $NC"
echo -e " ${CYAN}[${BIWhite}05${BICyan}]${RED} •\e[0m ${CYAN}S-SOCK MENU     $NC  ${CYAN}[${BIWhite}10${BICyan}]${RED} • \e[0m${CYAN}FEATURES MENU $NC" 
echo -e "${GREEN}└──────────────────────────────────────────────────┘\e[0m"
}

function Select_Display() {
read -p "Select From Menu 1 - 10 : " lunatic
case $lunatic in
1) clear ; menu-ssh ;; 
2) clear ; udp ;;
3) clear ; menu-vmess ;;
4) clear ; menu-vless ;;
5) clear ; menu-ss ;;
6) clear ; menu-trojan ;;
7) clear ; menu-ipsec ;;
8) clear ; menu-noobzvpns ;;
9) clear ; panelbot ;;
10) clear ; menu-features ;;
*) exit ;;
esac
}

# // Call
Banner_Script
System_Script
Running_Status
List_Account
Display_Menu
Select_Display


