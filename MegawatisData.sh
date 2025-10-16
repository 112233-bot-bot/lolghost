#!/bin/bash

# ---------- WARNA ----------
NC="\033[0m"
GREEN='\033[1;92m'  RED='\033[1;91m'  YELLOW='\033[1;93m'
CYAN='\033[1;96m'   MAGENTA='\033[1;95m'
BG_GREEN='\033[1;42m' BG_RED='\033[1;41m' BG_YELLOW='\033[1;43m'

# DATABASE WHOAMIN
USER_MAP=(
    "6283816164817|u0_a389"
    "6283143726466|u0_a892"
    "@Razor|u0_a485"
    "Danxy|u0_a388"
                    # <-- masukkan nama|whoami baru di sini
)
# ---------- FUNGSI ----------
banner() {
#clear
#sl
#echo -e "                  ${BG_RED}DANXY TOOLS V8.4${NC}"
#sleep 2
clear
echo -e "${GREEN}
┏━━━━━━━━━━${RED}● ${GREEN}[${YELLOW}LICENSE${GREEN}]${RED} ●${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃                                                ┃
${GREEN}┃     ${YELLOW} ▄▀▀▀▄${NC}                                     ${GREEN}┃
${GREEN}┃     ${YELLOW} █   █${MC}                                     ${GREEN}┃
${GREEN}┃     ${YELLOW}███████${NC}         ▄▀▀▄  ${RED}|${NC}  ╦  ╔═╗╔═╗╦╔╗╔     ${GREEN}┃
${GREEN}┃     ${CYAN}██─▀─██${NC}  █▀█▀▀▀▀█  █  ${RED}|${NC}  ║  ║ ║║ ╦║║║║     ${GREEN}┃
${GREEN}┃     ${CYAN}███▄███${NC}  ▀ ▀     ▀▀   ${RED}|${NC}  ╩═╝╚═╝╚═╝╩╝╚╝     ${GREEN}┃
${GREEN}┃     ${RED}-------------------------${NC} ${YELLOW}2024${NC} ${RED}-${NC} ${YELLOW}2025${NC}      ${GREEN}┃
${GREEN}┃             ${GREEN}${BOLD}TOOLS BY DANXY OFFICIAL${GREEN}            ┃
┃              ${RED}___________${YELLOW}___________${GREEN}            ┃
┃                                                ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
${RED}┃          ${YELLOW}YT${RED}: ${GREEN}DanxyBot ${YELLOW}TT${RED}: ${GREEN}Qwela.38${RED}             ┃
${RED}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "    ${BG_RED}${YELLOW}WELCOME TO REGRISTRASI & LOGIN TOOLS DANXY${NC}"
  echo -e "${BOLD}${BLINK}${RED}"
  echo -e "${GREEN}"
}
echo -e "${NC}"
login_by_name() {
    banner
    echo -e "${BG_GREEN}${RED} LOGIN DENGAN NAMA${NC}\n"

    read -rp "[ ! ] MASUKAN NOMOR/NAMA ANDA UNTUK LOGIN : " nama

    # Cari whoami berdasarkan nama
    expected_who=""
    for pair in "${USER_MAP[@]}"; do
        IFS='|' read -r n w <<< "$pair"
        if [[ "$n" == "$nama" ]]; then
            expected_who="$w"
            break
        fi
    done

    if [[ -z "$expected_who" ]]; then
        echo -e "\n${RED}Nama \"$nama\" belum terdaftar!${NC}"
        sleep 2
        return
    fi

    current_who=$(whoami)
    if [[ "$expected_who" == "$current_who" ]]; then
        echo -e "\n${GREEN}[ ✓ ] LOGIN BERHASIL SELAMAT DATANG, $nama.${NC}"
        sleep 1
        bash <(curl -sL "https://raw.githubusercontent.com/112233-bot-bot/lolghost/refs/heads/main/DanxyAja.sh")
    else
        echo -e "\n${RED}[ ∅ ] PERANGKAT TIDAK COCOK UNTUK ID INI\"$nama\".${NC}"
        echo -e "${YELLOW}ID ANDA AYO BURUAN MINTA AKSES : $current_who${NC}"
        sleep 3
    fi
}

get_whoami() {
    banner
    echo -e "${BG_YELLOW}${RED}SALIN ID USER WARNA HIJAU DI BAWAH INI 
DAN KASI KE DANXY!!${NC}\n"
    echo -e "${GREEN}$(whoami)${NC}\n"
    echo -e "\n${BG_RED}${YELLOW}ID ANDA DI ATAS DI GUNAKAN UNTUK
MENDAFTARKAN ANDA KE DATABASE${NC}\n"
    read -rp "TEKAN ENTER UNTIK KEMBALI KE MENU LOGIN"
}

main_menu() {
    while true; do
        banner
        echo -e "${RED}           ┏━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
        echo -e "${RED}           ┃                         ┃${NC}"
        echo -e "${GREEN}┏━━━━━━━━━━┴━━━━━━━━━━┓${NC}    ${GREEN}┏━━━━━━━━━┴━━━━━━━━━━━┓${NC}"
        echo -e "${GREEN}┃${BG_RED}${YELLOW}MENU LOGIN TOOLS V8.4${NC}${GREEN}┃${NC}    ${GREEN}┃   ${BG_RED}${YELLOW}INFORMASI TOOLS${NC}${GREEN}   ┃${NC}"
        echo -e "${GREEN}┏━━━━━━━━━━━━━━━━━━━━━┓${NC}    ${GREEN}┏━━━━━━━━━━━━━━━━━━━━━┓${NC}"
        echo -e "${GREEN}┃${CYAN}1)${NC} ${GREEN}LOGIN             ${GREEN}┃${NC}    ${GREEN}┃${NC} ${GREEN}TRACKING            ${GREEN}┃${NC}"
        echo -e "${GREEN}┃${CYAN}2)${NC} ${YELLOW}DAPATKAN ID ANDA  ${GREEN}┃${NC}    ${GREEN}┃${NC} ${YELLOW}OSIN                ${GREEN}┃${NC}"
        echo -e "${GREEN}┃${CYAN}3)${NC} ${RED}Keluar            ${GREEN}┃${NC}    ${GREEN}┃${NC} ${RED}PHISING             ${GREEN}┃${NC}"
        echo -e "${GREEN}┗━━━━━━━━━━━━━━━━━━━━━┛${NC}    ${GREEN}┗━━━━━━━━━━━━━━━━━━━━━┛${NC}"
        echo -e "${GREEN}      ┃                                    ┃${NC}"
        echo -e "${GREEN}      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
        echo -e "${GREEN}● ${YELLOW}● ${RED}●${YELLOW}"
        read -rp "PILIH [1-3] : " pilih
        echo -e "${NC}"

        case $pilih in
            1) login_by_name ;;
            2) get_whoami ;;
            3) echo "Bye!"; exit 3 ;;
            *) echo -e "${RED}Pilihan salah!${NC}"; sleep 1 ;;
        esac
    done
}


main_menu
