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
ORANGE='\033[0;33m'
NC='\033[0m'

API_POLRI="https://api-leak-polri-982384729u390283udua.vercel.app"
CACHE_DIR="$HOME/.cache/.system/.hidden/.api-cache"
mkdir -p "$CACHE_DIR" 2>/dev/null


clear_screen() { printf "\033c"; }

show_header() {
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${WHITE}              POLRI LEAK CHECKER OSINT BY DANXYTOOLS             ${BLUE}│${NC}"
    echo -e "${BLUE}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${BLUE}│${LGREEN}[i]${NC} API POLRI - Data Anggota Kepolisian                          ${BLUE}│${NC}"
    echo -e "${BLUE}│${YELLOW}[!]${NC} Maksimal 3 data ditampilkan                                  ${BLUE}│${NC}"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────────────┘${NC}"
}

display_single_data() {
    local data="$1"
    local index="$2"
    local color="$3"
    
    pangkat=$(echo "$data" | jq -r '.PANGKAT // "N/A"')
    nama=$(echo "$data" | jq -r '.NAMA // "N/A"')
    tugas=$(echo "$data" | jq -r '.TUGAS // "N/A"')
    hp=$(echo "$data" | jq -r '.HP // "N/A"')
    email=$(echo "$data" | jq -r '.EMAIL // "N/A"')
    
    if [ ! -z "$index" ]; then
        echo -e "${color}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${color}│${WHITE}                         DATA KE $index                               ${color}│${NC}"
        echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
    else
        echo -e "${color}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${color}│${WHITE}                      DATA DITEMUKAN                           ${color}│${NC}"
        echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
    fi
    
    # Tampilkan pangkat dengan warna khusus
    case $pangkat in
        *"KOMBES"*|*"AKBP"*|*"KOMPOL"*)
            echo -e "${color}│${NC} PANGKAT    : ${RED}$pangkat${NC}"
            ;;
        *"AKP"*|*"IPTU"*|*"IPDA"*)
            echo -e "${color}│${NC} PANGKAT    : ${YELLOW}$pangkat${NC}"
            ;;
        *"BRIPKA"*|*"BRIGADIR"*|*"BRIPDA"*|*"BRIPTU"*)
            echo -e "${color}│${NC} PANGKAT    : ${GREEN}$pangkat${NC}"
            ;;
        *)
            echo -e "${color}│${NC} PANGKAT    : ${WHITE}$pangkat${NC}"
            ;;
    esac
    
    echo -e "${color}│${NC} NAMA       : ${WHITE}$nama${NC}"
    
    if [ "$hp" != "N/A" ] && [ ! -z "$hp" ] && [ "$hp" != " " ]; then
        echo -e "${color}│${NC} NO HP      : ${CYAN}$hp${NC}"
    fi
    
    if [ "$email" != "N/A" ] && [ ! -z "$email" ] && [ "$email" != " " ] && [ "$email" != "-" ]; then
        echo -e "${color}│${NC} EMAIL      : ${PURPLE}$email${NC}"
    fi
    
    echo -e "${color}├─────────────────────────────────────────────────────────────────┤${NC}"
    
    # Tampilkan tugas/penempatan
    if [ "$tugas" != "N/A" ] && [ ! -z "$tugas" ]; then
        # Split tugas jadi beberapa baris jika terlalu panjang
        local max_len=55
        local tugas_text="$tugas"
        local line_num=1
        
        while [ ! -z "$tugas_text" ]; do
            if [ ${#tugas_text} -le $max_len ]; then
                if [ $line_num -eq 1 ]; then
                    echo -e "${color}│${NC} TUGAS      : ${WHITE}$tugas_text${NC}"
                else
                    echo -e "${color}│${NC}             ${WHITE}$tugas_text${NC}"
                fi
                break
            else
                # Cari spasi terakhir dalam max_len
                local cutoff=$(echo "${tugas_text:0:$max_len}" | grep -o '.* ' | wc -c)
                [ $cutoff -eq 0 ] && cutoff=$max_len
                
                if [ $line_num -eq 1 ]; then
                    echo -e "${color}│${NC} TUGAS      : ${WHITE}${tugas_text:0:$((cutoff-1))}${NC}"
                else
                    echo -e "${color}│${NC}             ${WHITE}${tugas_text:0:$((cutoff-1))}${NC}"
                fi
                tugas_text="${tugas_text:$cutoff}"
                ((line_num++))
            fi
        done
    fi
    
    echo -e "${color}└─────────────────────────────────────────────────────────────────┘${NC}"
}

search_by_name() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ SEARCH BY NAME - ANGGOTA POLRI ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Nama Anggota: "
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
    response=$(curl -s -w "\n%{http_code}" "$API_POLRI/name/$nama")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            total=$(echo "$content" | jq -r '.total // 0')
            time_ms=$(echo "$content" | jq -r '.time_ms // "N/A"')
            
            # Tentukan jumlah data yang akan ditampilkan (max 3)
            if [ $total -gt 3 ]; then
                display_total=3
                echo -e "${YELLOW}[!] Ditemukan $total data, menampilkan 3 data pertama${NC}"
                echo -e "${YELLOW}[!] Waktu pencarian: ${time_ms}ms${NC}\n"
            else
                display_total=$total
                echo -e "${GREEN}[✓] Ditemukan $total data dalam ${time_ms}ms${NC}\n"
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
                echo -e "${YELLOW}│${NC} Gunakan pencarian dengan NIK/NRP untuk hasil lebih spesifik   ${YELLOW}│${NC}"
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

search_by_duty() {
    clear_screen
    show_header
    echo -e "\n${YELLOW}[ SEARCH BY DUTY/TUGAS ]${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    echo -n "Masukkan Unit Tugas (contoh: SATLANTAS, SATRESKRIM, SATSABHARA): "
    read -r duty_input
    
    duty=$(echo "$duty_input" | tr -d '\n' | sed 's/ /%20/g')
    
    if [ -z "$duty" ]; then
        echo -e "\n${RED}[✗] Tugas tidak boleh kosong${NC}"
        sleep 1
        return
    fi
    
    echo -e "${CYAN}[i] Mencari anggota dengan tugas: $duty_input${NC}"
    echo -e "${GRAY}─────────────────────────────────────────────────────────────────${NC}\n"
    
    # Panggil API
    response=$(curl -s -w "\n%{http_code}" "$API_POLRI/duty/$duty")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            total=$(echo "$content" | jq -r '.total // 0')
            time_ms=$(echo "$content" | jq -r '.time_ms // "N/A"')
            
            # Tentukan jumlah data yang akan ditampilkan (max 3)
            if [ $total -gt 3 ]; then
                display_total=3
                echo -e "${YELLOW}[!] Ditemukan $total anggota, menampilkan 3 data pertama${NC}"
                echo -e "${YELLOW}[!] Waktu pencarian: ${time_ms}ms${NC}\n"
            else
                display_total=$total
                echo -e "${GREEN}[✓] Ditemukan $total anggota dalam ${time_ms}ms${NC}\n"
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
                echo -e "${YELLOW}│${NC} Masih ada $((total-3)) anggota lain yang tidak ditampilkan           ${YELLOW}│${NC}"
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
    echo -e "\n${YELLOW}[ SEARCH BY PHONE - ANGGOTA POLRI ]${NC}"
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
    response=$(curl -s -w "\n%{http_code}" "$API_POLRI/phone/$phone")
    http_code=$(echo "$response" | tail -n1)
    content=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        success=$(echo "$content" | jq -r '.success')
        if [ "$success" = "true" ]; then
            total=$(echo "$content" | jq -r '.total // 0')
            time_ms=$(echo "$content" | jq -r '.time_ms // "N/A"')
            
            # Tentukan jumlah data yang akan ditampilkan (max 3)
            if [ $total -gt 3 ]; then
                display_total=3
                echo -e "${YELLOW}[!] Ditemukan $total data, menampilkan 3 data pertama${NC}"
                echo -e "${YELLOW}[!] Waktu pencarian: ${time_ms}ms${NC}\n"
            else
                display_total=$total
                echo -e "${GREEN}[✓] Ditemukan $total data dalam ${time_ms}ms${NC}\n"
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

menu_leak_polri() {
    while true; do
        clear_screen
        show_header
        echo ""
        echo -e "${BLUE}┌─────────────────────────────────────────────────────────────────┐${NC}"
        echo -e "${BLUE}│${WHITE}                          MAIN MENU                              ${BLUE}│${NC}"
        echo -e "${BLUE}├─────────────────────────────────────────────────────────────────┤${NC}"
        echo -e "${BLUE}│                                                                 │${NC}"
        echo -e "${BLUE}│  ${GREEN}[1]${NC} CARI BERDASARKAN NAMA (Max 3 Data)                         ${BLUE}│${NC}"
        echo -e "${BLUE}│  ${GREEN}[2]${NC} CARI BERDASARKAN TUGAS/UNIT (Max 3 Data)                   ${BLUE}│${NC}"
        echo -e "${BLUE}│  ${GREEN}[3]${NC} CARI BERDASARKAN NO HP (Max 3 Data)                        ${BLUE}│${NC}"
        echo -e "${BLUE}│  ${GREEN}[4]${NC} EXIT                                                       ${BLUE}│${NC}"
        echo -e "${BLUE}│                                                                 │${NC}"
        echo -e "${BLUE}└─────────────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -n "Pilih menu [1-4]: "
        read -r choice
        
        case $choice in
            1) search_by_name ;;
            2) search_by_duty ;;
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

# Trap CTRL+C
trap 'echo -e "\n${RED}[!] Program terminated${NC}"; exit 0' INT

menu_leak_polri
