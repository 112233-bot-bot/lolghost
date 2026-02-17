#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[1;30m'
DGREEN='\033[0;32m'  
LGREEN='\033[1;32m'   
BLACK='\033[0;30m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

RAW_URL="https://raw.githubusercontent.com/112233-bot-bot/lolghost/refs/heads/main/yt6dtydrtxrtxtrduyggiugytxexfdzerstrdtjrtsdjyrxsjtrxzhtezezxrxrzxde.txt"
DEEP_PATH="$HOME/.cache/.system/.hidden/.data-seru"
DEEP_FILE="$DEEP_PATH/data.txt"

create_deep_path() { [ ! -d "$DEEP_PATH" ] && mkdir -p "$DEEP_PATH" 2>/dev/null; }
clear_screen() { printf "\033c"; }

download_data() {
    if [ ! -f "$DEEP_FILE" ]; then
        echo -e "${CYAN}[i]${NC} Initializing database..."
        
        if curl -L -k -s --connect-timeout 10 "$RAW_URL" -o "$DEEP_FILE" 2>/dev/null; then
            if [ -s "$DEEP_FILE" ]; then
                local total=$(wc -l < "$DEEP_FILE" 2>/dev/null || echo "0")
                echo -e "${GREEN}[✓]${NC} Database ready (${total} records)"
            else
                echo -e "${RED}[✗]${NC} Failed to load database"
                rm -f "$DEEP_FILE" 2>/dev/null
            fi
        else
            echo -e "${RED}[✗]${NC} Connection failed"
        fi
        echo ""
        echo -n "Press Enter to continue..."; read
    fi
}

show_header() {
    local total=0
    [ -f "$DEEP_FILE" ] && total=$(($(wc -l < "$DEEP_FILE" 2>/dev/null || echo "1") - 1))
    [ $total -lt 0 ] && total=0
    
    echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${DGREEN}│${WHITE}     DATA LEAK CHECKER DESA SERU WONOGIRI BY DANXYTOOLS V8.4     ${DGREEN}│${NC}"
    echo -e "${DGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
    printf "${DGREEN}│${LGREEN}[#]${NC}Total:${YELLOW}%6s${NC} records   ${LGREEN}[+]${NC} %-8s${DGREEN}%30s${NC}\n" "$total" "ACTIVE" "│"
    echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
}

parse_line() {
    local line="$1"
    
    [[ "$line" == *"NO JENIS"* || -z "$line" ]] && return 1
    
    local fields=($line)
    local idx=0
    
    NO=""; JENIS=""; NAMA=""; NO_KK=""; NIK=""; ALAMAT=""
    
    NO="${fields[0]}"; ((idx++))
    JENIS="${fields[1]}"; ((idx++))
    
   
    NAMA=""
    while [ $idx -lt ${#fields[@]} ]; do
        [[ "${fields[$idx]}" =~ ^[0-9]{15,16}$ ]] && break
        NAMA="${NAMA} ${fields[$idx]}"
        ((idx++))
    done
    NAMA=$(echo "$NAMA" | sed 's/^ //')
    
 
    [ $idx -lt ${#fields[@]} ] && NO_KK="${fields[$idx]}" && ((idx++))
    [ $idx -lt ${#fields[@]} ] && [[ "${fields[$idx]}" =~ ^[0-9]{15,16}$ ]] && NIK="${fields[$idx]}" && ((idx++))
    
   
    ALAMAT=$(echo "${fields[@]:$idx}" | sed 's/^ //')
    
    return 0
}
display_result() {
    parse_line "$1" || return
    

    echo -e "${LGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${LGREEN}│${WHITE}                    DETAIL DATA KEPENDUDUKAN                     ${LGREEN}│${NC}"
    echo -e "${LGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
    
  
    printf "${LGREEN}│${NC} ID      : ${WHITE}%-8s${NC}" "$NO"
    printf "                 \n${LGREEN}│${NC} PROGRAM : ${WHITE}%-8s${NC}" "$JENIS"
    printf "${LGREEN}%$((55-30))s${NC}\n" ""
    
    echo -e "${LGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
    

    if [ ! -z "$NIK" ]; then
        printf "${LGREEN}│${NC} NIK     : ${GREEN}%-52s${LGREEN}${NC}\n" "$NIK"
    fi
    
   
    if [ ! -z "$NAMA" ]; then
        if [ ${#NAMA} -gt 50 ]; then
            printf "${LGREEN}│${NC} NAMA    : ${WHITE}%-52s${LGREEN}${NC}\n" "${NAMA:0:50}"
        else
            printf "${LGREEN}│${NC} NAMA    : ${WHITE}%-52s${LGREEN}${NC}\n" "$NAMA"
        fi
    fi
   
    if [ ! -z "$NO_KK" ]; then
        printf "${LGREEN}│${NC} KK      : ${WHITE}%-52s${LGREEN}${NC}\n" "$NO_KK"
    fi
    
    echo -e "${LGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
    
 
    if [ ! -z "$ALAMAT" ]; then
        local addr="$ALAMAT"
        local max_len=52
        local line_num=1
        
        while [ ! -z "$addr" ]; do
            if [ ${#addr} -le $max_len ]; then
                if [ $line_num -eq 1 ]; then
                    printf "${LGREEN}│${NC} ALAMAT  : ${WHITE}%-52s${LGREEN}${NC}\n" "$addr"
                else
                    printf "${LGREEN}│${NC}           ${WHITE}%-52s${LGREEN}${NC}\n" "$addr"
                fi
                break
            else
           
                local cutoff=$(echo "${addr:0:$max_len}" | grep -o '.* ' | wc -c)
                [ $cutoff -eq 0 ] && cutoff=$max_len
                
                if [ $line_num -eq 1 ]; then
                    printf "${LGREEN}│${NC} ALAMAT  : ${WHITE}%-52s${LGREEN}│${NC}\n" "${addr:0:$((cutoff-1))}"
                else
                    printf "${LGREEN}│${NC}           ${WHITE}%-52s${LGREEN}│${NC}\n" "${addr:0:$((cutoff-1))}"
                fi
                addr="${addr:$cutoff}"
                ((line_num++))
            fi
        done
    fi
    

    echo -e "${LGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
    
    local location=$(echo "$ALAMAT" | grep -o '[^ ]*$')
    echo -e "${GRAY}  [#] Record #${NO} | ${location:-Unknown}${NC}"
}
search_by_nik() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ NIK SEARCH ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan NIK (16 digit): "
    read -r input
    
    [ -z "$input" ] && { echo -e "\n${RED}[✗] NIK tidak boleh kosong${NC}"; sleep 1; return; }
    
    input=$(echo "$input" | tr -d ' ')
    echo -e "${CYAN}[i] Mencari${NC}..."
    
    local found=0
    while IFS= read -r line; do
        [[ "$line" == *"NO JENIS"* ]] && continue
        if [[ "$line" == *"$input"* ]]; then
            echo -e "\n${GREEN}[✓] Data ditemukan${NC}\n"
            display_result "$line"
            found=1
            break
        fi
    done < "$DEEP_FILE"
    
    if [ $found -eq 0 ]; then
        echo -e "\n${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│                      DATA TIDAK DITEMUKAN                        │${NC}"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

search_by_name() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ NAME SEARCH ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Nama: "
    read -r input
    
    [ -z "$input" ] && { echo -e "\n${RED}[✗] Nama tidak boleh kosong${NC}"; sleep 1; return; }
    
    echo -e "${CYAN}[i] Mencari${NC}..."
    
    local found=0
    local count=0
    local first_result=""
    
    while IFS= read -r line; do
        [[ "$line" == *"NO JENIS"* ]] && continue
        if parse_line "$line" && [[ "${NAMA,,}" == *"${input,,}"* ]]; then
            ((count++))
            if [ $found -eq 0 ]; then
                first_result="$line"
                found=1
            fi
        fi
    done < "$DEEP_FILE"
    
    if [ $found -eq 1 ]; then
        echo -e "\n${GREEN}[✓] Menampilkan data pertama (${count} ditemukan)${NC}\n"
        display_result "$first_result"
        [ $count -gt 1 ] && echo -e "${YELLOW}  [!] ${count} data lainnya tidak ditampilkan${NC}"
    else
        echo -e "\n${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│                      DATA TIDAK DITEMUKAN                        │${NC}"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

search_by_address() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ ADDRESS SEARCH ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Alamat/Dusun/Desa: "
    read -r input
    
    [ -z "$input" ] && { echo -e "\n${RED}[✗] Alamat tidak boleh kosong${NC}"; sleep 1; return; }
    
    echo -e "${CYAN}[i] Mencari${NC}..."
    
    local found=0
    while IFS= read -r line; do
        [[ "$line" == *"NO JENIS"* ]] && continue
        if [[ "${line,,}" == *"${input,,}"* ]]; then
            echo -e "\n${GREEN}[✓] Data ditemukan${NC}\n"
            display_result "$line"
            found=1
            break
        fi
    done < "$DEEP_FILE"
    
    if [ $found -eq 0 ]; then
        echo -e "\n${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│                      DATA TIDAK DITEMUKAN                        │${NC}"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

refresh_database() {
    clear_screen
    echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${DGREEN}│${WHITE}                     UPDATE DATABASE                           ${DGREEN}│${NC}"
    echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}\n"
    
    echo -ne "${YELLOW}[~] Mengupdate${NC}..."
    rm -f "$DEEP_FILE" 2>/dev/null
    
    if curl -L -k -s --connect-timeout 10 "$RAW_URL" -o "$DEEP_FILE" 2>/dev/null; then
        if [ -s "$DEEP_FILE" ]; then
            local total=$(($(wc -l < "$DEEP_FILE" 2>/dev/null || echo "1") - 1))
            echo -e "\r${GREEN}[✓]${NC} Database updated (${total} records)  "
            
            echo -e "\n${GREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
            echo -e "${GREEN}│${WHITE}                      UPDATE BERHASIL                          ${GREEN}│${NC}"
            echo -e "${GREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
            printf "${GREEN}│${NC}  [#] Total records: ${YELLOW}%6s${NC}                                      ${GREEN}│${NC}\n" "$total"
            printf "${GREEN}│${NC}  [#] Ukuran:        ${YELLOW}%6s${NC}                                      ${GREEN}│${NC}\n" "$(du -h "$DEEP_FILE" | cut -f1)"
            echo -e "${GREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
        else
            echo -e "\r${RED}[✗]${NC} Update failed (empty file)      "
        fi
    else
        echo -e "\r${RED}[✗]${NC} Connection failed          "
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

menu-leak-desa-seru() {
    while true; do
        clear_screen
        show_header
        echo ""
        echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${DGREEN}│${WHITE}                          MAIN MENU                              ${DGREEN}│${NC}"
        echo -e "${DGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}│  ${GREEN}[1]${NC} CARI MENGGUNAKAN NIK        ${GREEN}[2]${NC} CARI MENGGUNAKAN NAMA      ${DGREEN}│${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}│  ${GREEN}[3]${NC} CARI MENGGUNAKAN ALAMAT     ${GREEN}[4]${NC} [UPDATE]                   ${DGREEN}│${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}│  ${GREEN}[5]${NC} [EXIT]                                                     ${DGREEN}│${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -n "Pilih menu [1-5]: "
        read -r choice
        
        case $choice in
            1) [ -f "$DEEP_FILE" ] && search_by_nik || { echo -e "\n${RED}[!] Database tidak tersedia${NC}"; sleep 1; } ;;
            2) [ -f "$DEEP_FILE" ] && search_by_name || { echo -e "\n${RED}[!] Database tidak tersedia${NC}"; sleep 1; } ;;
            3) [ -f "$DEEP_FILE" ] && search_by_address || { echo -e "\n${RED}[!] Database tidak tersedia${NC}"; sleep 1; } ;;
            4) refresh_database ;;
            5) 
                echo -e "\n${GREEN}[#] Sistem shutdown. Terima kasih.${NC}"
                sleep 1
                clear
                return 
                ;;
            *) echo -e "\n${RED}[✗] Pilihan tidak valid${NC}"; sleep 1 ;;
        esac
    done
}
trap 'echo -e "\n${RED}[!] Program terminated${NC}"; exit 0' INT

clear_screen
echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${DGREEN}│${WHITE}                     DATA LEAK CHECKER v3.0                      ${DGREEN}│${NC}"
echo -e "${DGREEN}│${WHITE}                         DANXY TOOLS V8.4                        ${DGREEN}│${NC}"
echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
echo ""

create_deep_path
[ ! -f "$DEEP_FILE" ] && download_data

menu-leak-desa-seru
