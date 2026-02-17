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
PURPLE='\033[0;35m'
NC='\033[0m'

API_BPJS="https://api-leak-bpjs-jancokfristel-danxy-f.vercel.app"
CACHE_DIR="$HOME/.cache/.system/.hidden/.api-cache"
mkdir -p "$CACHE_DIR" 2>/dev/null


clear_screen() { printf "\033c"; }

show_header() {
    echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${DGREEN}│${WHITE}              BPJS LEAK CHECKER OSINT BY DANXYTOOLS              ${DGREEN}│${NC}"
    echo -e "${DGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${DGREEN}│${LGREEN}[i]${NC} API BPJS - Real-time Data                                    ${DGREEN}│${NC}"
    echo -e "${DGREEN}│${YELLOW}[!]${NC} Maksimal 3 data ditampilkan                                  ${DGREEN}│${NC}"
    echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
}

display_single_data() {
    local data="$1"
    local index="$2"
    local color="$3"
    
    nik=$(echo "$data" | jq -r '.nik // "N/A"')
    nama=$(echo "$data" | jq -r '.nama // "N/A"')
    gender=$(echo "$data" | jq -r '.gender // "N/A"')
    birthdate=$(echo "$data" | jq -r '.birthdate // "N/A"')
    phone=$(echo "$data" | jq -r '.phone // "N/A"')
    address=$(echo "$data" | jq -r '.address // "N/A"')
    district=$(echo "$data" | jq -r '.district // "N/A"')
    subdistrict=$(echo "$data" | jq -r '.subdistrict // "N/A"')
    city=$(echo "$data" | jq -r '.city // "N/A"')
    
    if [ ! -z "$index" ]; then
        echo -e "${color}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${color}│${WHITE}                         DATA KE $index                               ${color}│${NC}"
        echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
    else
        echo -e "${color}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${color}│${WHITE}                      DATA DITEMUKAN                           ${color}│${NC}"
        echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
    fi
    
    echo -e "${color}│${NC} NIK        : ${WHITE}$nik${NC}"
    echo -e "${color}│${NC} NAMA       : ${WHITE}$nama${NC}"
    
    if [ "$gender" != "N/A" ] && [ ! -z "$gender" ]; then
        echo -e "${color}│${NC} GENDER     : ${WHITE}$gender${NC}"
    fi
    
    if [ "$birthdate" != "N/A" ] && [ ! -z "$birthdate" ]; then
        echo -e "${color}│${NC} TGL LAHIR  : ${WHITE}$birthdate${NC}"
    fi
    
    if [ "$phone" != "N/A" ] && [ ! -z "$phone" ]; then
        echo -e "${color}│${NC} NO HP      : ${YELLOW}$phone${NC}"
    fi
    
    if [ "$address" != "N/A" ] && [ ! -z "$address" ]; then
        echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${color}│${NC} ALAMAT     : ${WHITE}$address${NC}"
        
        if [ "$district" != "N/A" ] && [ ! -z "$district" ]; then
            echo -e "${color}│${NC} KECAMATAN  : ${WHITE}$district${NC}"
        fi
        
        if [ "$subdistrict" != "N/A" ] && [ ! -z "$subdistrict" ]; then
            echo -e "${color}│${NC} KELURAHAN  : ${WHITE}$subdistrict${NC}"
        fi
        
        if [ "$city" != "N/A" ] && [ ! -z "$city" ]; then
            echo -e "${color}│${NC} KOTA       : ${WHITE}$city${NC}"
        fi
    fi
    
    echo -e "${color}└─────────────────────────────────────────────────────────────────┘${NC}"
}

search_by_nik() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ SEARCH BY NIK ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan NIK (16 digit): "
    read -r nik
    
    nik=$(echo "$nik" | tr -d ' ' | tr -d '\n')
    
    if [ -z "$nik" ]; then
        echo -e "\n${RED}[✗] NIK tidak boleh kosong${NC}"
        sleep 1
        return
    fi
    
    if ! [[ "$nik" =~ ^[0-9]{16}$ ]]; then
        echo -e "\n${RED}[✗] NIK harus 16 digit angka${NC}"
        sleep 1
        return
    fi
    
    echo -e "${CYAN}[i] Mencari data untuk NIK: $nik${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    # Panggil API
    response=$(curl -s -w "\n%{http_code}" "$API_BPJS/nik/$nik")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            data=$(echo "$content" | jq -r '.data')
            display_single_data "$data" "" "${GREEN}"
        else
            echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
            echo -e "${RED}│${WHITE}                      DATA TIDAK DITEMUKAN                       ${RED}│${NC}"
            echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
        fi
    else
        echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│${WHITE}                      ERROR KONEKSI                              ${RED}│${NC}"
        echo -e "${RED}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${RED}│${NC} HTTP Code: $http_code"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

search_by_name() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ SEARCH BY NAME ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Nama: "
    read -r nama_input
    
    nama=$(echo "$nama_input" | tr -d '\n' | sed 's/ /%20/g')
    
    if [ -z "$nama" ]; then
        echo -e "\n${RED}[✗] Nama tidak boleh kosong${NC}"
        sleep 1
        return
    fi
    
    echo -e "${CYAN}[i] Mencari data untuk nama: $nama_input${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    # Panggil API
    response=$(curl -s -w "\n%{http_code}" "$API_BPJS/name/$nama")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            total=$(echo "$content" | jq -r '.total_found // 0')
            search_time=$(echo "$content" | jq -r '.search_time_ms // "N/A"')
            
            # Tentukan jumlah data yang akan ditampilkan (max 3)
            if [ $total -gt 3 ]; then
                display_total=3
                echo -e "${YELLOW}[!] Ditemukan $total data, menampilkan 3 data pertama${NC}\n"
            else
                display_total=$total
                echo -e "${GREEN}[✓] Ditemukan $total data dalam ${search_time}ms${NC}\n"
            fi
            
            # Loop melalui setiap data (max 3)
            for i in $(seq 0 $((display_total-1))); do
                data=$(echo "$content" | jq -r ".data[$i]")
                
                # Tentukan warna berdasarkan index
                if [ $i -eq 0 ]; then
                    color="${GREEN}"
                elif [ $i -eq 1 ]; then
                    color="${CYAN}"
                else
                    color="${PURPLE}"
                fi
                
                display_single_data "$data" "$((i+1))" "$color"
                
                if [ $i -lt $((display_total-1)) ]; then
                    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
                fi
            done
            
            # Tampilkan pesan jika ada data yang disembunyikan
            if [ $total -gt 3 ]; then
                echo -e "\n${YELLOW}┌─────────────────────────────────────────────────────────────────┐${NC}"
                echo -e "${YELLOW}│${WHITE}                   PERHATIAN - DATA DISEMBUNYIKAN                ${YELLOW}│${NC}"
                echo -e "${YELLOW}├─────────────────────────────────────────────────────────────────┤${NC}"
                echo -e "${YELLOW}│${NC} Masih ada $((total-3)) data lain yang tidak ditampilkan              ${YELLOW}│${NC}"
                echo -e "${YELLOW}│${NC} Gunakan pencarian dengan NIK untuk data yang lebih spesifik   ${YELLOW}│${NC}"
                echo -e "${YELLOW}└─────────────────────────────────────────────────────────────────┘${NC}"
            fi
            
        else
            echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
            echo -e "${RED}│${WHITE}                      DATA TIDAK DITEMUKAN                       ${RED}│${NC}"
            echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
        fi
    else
        echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│${WHITE}                      ERROR KONEKSI                              ${RED}│${NC}"
        echo -e "${RED}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${RED}│${NC} HTTP Code: $http_code"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

search_by_phone() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ SEARCH BY PHONE ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Nomor HP: "
    read -r phone_input
    
    phone=$(echo "$phone_input" | tr -d ' ' | tr -d '\n' | sed 's/+//g')
    
    if [ -z "$phone" ]; then
        echo -e "\n${RED}[✗] Nomor HP tidak boleh kosong${NC}"
        sleep 1
        return
    fi
    
    echo -e "${CYAN}[i] Mencari data untuk nomor: $phone_input${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    # Panggil API
    response=$(curl -s -w "\n%{http_code}" "$API_BPJS/phone/$phone")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            total=$(echo "$content" | jq -r '.total_found // 0')
            search_time=$(echo "$content" | jq -r '.search_time_ms // "N/A"')
            
            # Tentukan jumlah data yang akan ditampilkan (max 3)
            if [ $total -gt 3 ]; then
                display_total=3
                echo -e "${YELLOW}[!] Ditemukan $total data, menampilkan 3 data pertama${NC}\n"
            else
                display_total=$total
                echo -e "${GREEN}[✓] Ditemukan $total data dalam ${search_time}ms${NC}\n"
            fi
            
            # Loop melalui setiap data (max 3)
            for i in $(seq 0 $((display_total-1))); do
                data=$(echo "$content" | jq -r ".data[$i]")
                
                # Tentukan warna berdasarkan index
                if [ $i -eq 0 ]; then
                    color="${GREEN}"
                elif [ $i -eq 1 ]; then
                    color="${CYAN}"
                else
                    color="${PURPLE}"
                fi
                
                display_single_data "$data" "$((i+1))" "$color"
                
                if [ $i -lt $((display_total-1)) ]; then
                    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
                fi
            done
            
            # Tampilkan pesan jika ada data yang disembunyikan
            if [ $total -gt 3 ]; then
                echo -e "\n${YELLOW}┌─────────────────────────────────────────────────────────────────┐${NC}"
                echo -e "${YELLOW}│${WHITE}                   PERHATIAN - DATA DISEMBUNYIKAN                ${YELLOW}│${NC}"
                echo -e "${YELLOW}├─────────────────────────────────────────────────────────────────┤${NC}"
                echo -e "${YELLOW}│${NC} Masih ada $((total-3)) data lain yang tidak ditampilkan              ${YELLOW}│${NC}"
                echo -e "${YELLOW}└─────────────────────────────────────────────────────────────────┘${NC}"
            fi
            
        else
            echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
            echo -e "${RED}│${WHITE}                      DATA TIDAK DITEMUKAN                       ${RED}│${NC}"
            echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
        fi
    else
        echo -e "${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${RED}│${WHITE}                      ERROR KONEKSI                              ${RED}│${NC}"
        echo -e "${RED}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${RED}│${NC} HTTP Code: $http_code"
        echo -e "${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
    fi
    
    echo -e "\n${GRAY}─────────────────────────────────────────────────────────────────${NC}"
    echo -n "Tekan Enter untuk kembali..."; read
}

menu_leak_bpjs() {
    while true; do
        clear_screen
        show_header
        echo ""
        echo -e "${DGREEN}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${DGREEN}│${WHITE}                          MAIN MENU                              ${DGREEN}│${NC}"
        echo -e "${DGREEN}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}│  ${GREEN}[1]${NC} CARI BERDASARKAN NIK (Single Result)                       ${DGREEN}│${NC}"
        echo -e "${DGREEN}│  ${GREEN}[2]${NC} CARI BERDASARKAN NAMA (Max 3 Data)                         ${DGREEN}│${NC}"
        echo -e "${DGREEN}│  ${GREEN}[3]${NC} CARI BERDASARKAN NO HP (Max 3 Data)                        ${DGREEN}│${NC}"
        echo -e "${DGREEN}│  ${GREEN}[4]${NC} EXIT                                                       ${DGREEN}│${NC}"
        echo -e "${DGREEN}│                                                                 │${NC}"
        echo -e "${DGREEN}└─────────────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -n "Pilih menu [1-4]: "
        read -r choice
        
        case $choice in
            1) search_by_nik ;;
            2) search_by_name ;;
            3) search_by_phone ;;
            4) 
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

menu_leak_bpjs
