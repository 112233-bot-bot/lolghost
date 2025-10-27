#!/bin/bash

RED='\e[38;5;196m'  # merah neon
GREEN='\e[38;5;082m'  # hijau terang
YELLOW='\e[38;5;226m'  # kuning neon
BLUE='\e[38;5;051m'  # biru cyan
MAGENTA='\e[38;5;201m'  # magenta terang
CYAN='\e[38;5;051m'  # cyan
WHITE='\e[38;5;015m'  # putih tulang
GREY='\e[38;5;244m' # abu-abu tua
NC='\e[0m'
BG_GREEN='\033[1;42m' BG_RED='\033[1;41m' BG_YELLOW='\033[1;43m'

USER_MAP=(
    "6287737466209|u0_a31"
    "6282126821381|u0_a252"
    "6287835215185|u0_a368"
    "6285241061463|u0_a189"
    "6283141924147|u0_a437"
    "628983807869|u0_a541"
    "6285147026780|u0_a245"
    "6285697398584|u0_a579"
    "6289514964424|u0_a446"
    "62895419445933|u0_a384"
    "6285722013894|u0_a207"
    "6282257572221|u0_a294"
    "6281567905006|u0_a383"
    "yama|u0_a392"
    "6288245980269|u0_a87"
    "6283128671275|u0_a566"
    "6283150538967|u0_a221"
    "butz|u0_a340"
    "6285846465686|u0_a304"
    "6285702503094|u0_a232"
    "6282190080105|u0_a311"
    "62895328081275|u0_a533"
    "628895876624|u0_a525"
    "6285803156208|u0_a380"
    "6285881354290|u0_a477"
    "6285703455240|u0_a775"
    "62895706820010|u0_a299"
    "6288707081601|u0_a554"
    "62895424279134|u0_a337"
    "6281288962467|u0_a314"
    "6285253902283|u0_a330"
    "6281291606812|u0_a456"
    "6288235765242|u0_a292"
    "6285147052178|u0_a393"
    "6285943799686|u0_a322"
    "6287868300595|u0_a348"
    "62881080593445|u0_a413"
    "1|u0_a213"
    "62882005817504|u0_a488"
    "6287866715150|u0_a326"
    "6285647379391|u0_a209"
    "6285777740915|u0_a269"
    "6285298624517|u0_a928"
    "6282174007508|u0_a290"
    "62881026705887|u0_a565"
    "6283152408486|u0_a357"
    "628985719345|u0_a2817"
    "6287718005190|u0_a314"
    "6281253506500|u0_a452"
    "6281212723739|u0_a405"
    "6287810951618|u0_a238"
    "6283816164817|u0_a389"
    "6283143726466|u0_a892"
    "@Razor|u0_a485"
    "Danxy|u0_a388"
                    
)
# ---------- FUNGSI ----------
banner() {
clear
cmatrix
#echo -e "                  ${BG_RED}DANXY TOOLS V8.4${NC}"
clear
echo -e "
  ${GREEN}● ${YELLOW}● ${RED}●${YELLOW}${GREEN}
┏━━━━━━━━${RED}● ${GREEN}[${YELLOW}LICENSE${GREEN}]${RED} ●${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃${CYAN}●                                                                  ${CYAN}●┃
${GREEN}┃               ${WHITE} ▄▀▀▀▄${NC}                                               ${GREEN}┃
${GREEN}┃               ${WHITE} █   █${MC}                                               ${GREEN}┃
${GREEN}┃               ${WHITE}███████${BLUE}         ▄▀▀▄  ${RED}|${GREY}  ╦  ╔═╗╔═╗╦╔╗╔               ${GREEN}┃
${GREEN}┃               ${GREY}██─▀─██${BLUE}  █▀█▀▀▀▀█  █  ${RED}|${GREY}  ║  ║ ║║ ╦║║║║               ${GREEN}┃
${GREEN}┃               ${GREY}███▄███${BLUE}  ▀ ▀     ▀▀   ${RED}|${GREY}  ╩═╝╚═╝╚═╝╩╝╚╝               ${GREEN}┃
${GREEN}┃               ${RED}-------------------------${NC} ${YELLOW}2024${NC} ${RED}-${NC} ${YELLOW}2025${NC}                ${GREEN}┃
${GREEN}┃                      ${GREEN}${BOLD}TOOLS BY DANXY OFFICIAL${GREEN}                       ┃
┃               ${RED}___________________${CYAN}___________________${GREEN}               ┃
┃${CYAN}●                                                                  ${CYAN}●${GREEN}┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
${RED}┃                      ${YELLOW}YT${RED}: ${GREEN}DanxyBot ${YELLOW}TT${RED}: ${GREEN}Qwela.38${RED}                     ┃
${RED}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "             ${BG_RED}${YELLOW}WELCOME TO REGRISTRASI & LOGIN TOOLS DANXY${NC}"
echo -e "   ${CYAN} KETIK PANDUAN DENGAN HURUF KECIL UNTUK MELIHAT PANDUAN LOGIN${NC}"
echo ""
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
panduan() {
banner
echo -e "${CYAN}Jika kamu bingung, ikutin langkah langkah arahan saya ini,
${RED}1) ${CYAN}ketik 2 atau (dapatkan id anda) lalu setelah mengetik 2 lalu enter
${RED}2) ${CYAN}setelah selesai ketik nomor 2 di situ akan ada panduan untuk mengirim
id warna hijau ke Danxy, id itu di gunakan untuk menambahkan akses Anda ke
database tools v8.4 ini jadi ikutin langkah langkah nya!!
${WHITE}"
read -rp "TEKAN ENTER UNTUK KEMBALI KE MENU"
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
        echo -e "${RED}           ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
        echo -e "${RED}           ┃                                            ┃${NC}"
        echo -e "${GREEN}┏━━━━━━━━━━┴━━━━━━━━━━┓${NC}                       ${GREEN}┏━━━━━━━━━┴━━━━━━━━━━━┓${NC}"
        echo -e "${GREEN}┃${BG_RED}${YELLOW}MENU LOGIN TOOLS V8.4${NC}${GREEN}┃${NC}                       ${GREEN}┃   ${BG_RED}${YELLOW}INFORMASI TOOLS${NC}${GREEN}   ┃${NC}"
        echo -e "${GREEN}┏━━━━━━━━━━━━━━━━━━━━━┓${NC}                       ${GREEN}┏━━━━━━━━━━━━━━━━━━━━━┓${NC}"
        echo -e "${GREEN}┃${CYAN}1)${NC} ${GREEN}LOGIN             ${GREEN}┃${NC}                       ${GREEN}┃${NC} ${CYAN}● ${GREEN}TRACKING  ${CYAN}● ${GREEN}SPAMER${GREEN}┃${NC}"
        echo -e "${GREEN}┃${CYAN}2)${NC} ${YELLOW}DAPATKAN ID ANDA  ${GREEN}┃${NC}                       ${GREEN}┃${NC} ${CYAN}● ${YELLOW}OSIN      ${CYAN}● ${YELLOW}SUNTIK${GREEN}┃${NC}"
        echo -e "${GREEN}┃${CYAN}3)${NC} ${RED}Keluar            ${GREEN}┃${NC}                       ${GREEN}┃${NC} ${CYAN}● ${RED}PHISING   ${CYAN}● ${RED}HEFUN ${GREEN}┃${NC}"
        echo -e "${GREEN}┗━━━━━━━━━━━━━━━━━━━━━┛${NC}                       ${GREEN}┗━━━━━━━━━━━━━━━━━━━━━┛${NC}"
        echo -e "${GREEN}      ┃                                                       ┃${NC}"
        echo -e "${GREEN}      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
        echo -e "${GREEN}● ${YELLOW}● ${RED}●${YELLOW}"
      #  read -rp "PILIH [1-3] : " pilih
        printf "${GREEN}┏━[ ${RED}DANXY TOOLS V8.4${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}REGRISTRASI & LOGIN${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} " 
        read -r pilih
        
        echo -e "${NC}"

        case $pilih in
            1) login_by_name ;;
            2) get_whoami ;;
     panduan) panduan ;;
            3) echo "Bye!"; exit 3 ;;
            *) echo -e "${RED}Pilihan salah!${NC}"; sleep 1 ;;
        esac
    done
}


main_menu
