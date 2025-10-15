#!/data/data/com.termux/files/usr/bin/bash
# =========================================================
#  DANXY TOOLS v9.1 – CCTV SCRAPER (Termux-friendly)
# =========================================================
RED='\e[31m'; GREEN='\e[32m'; YELLOW='\e[33m'; CYAN='\e[36m'; RESET='\e[0m'

# ---------- CEK DEPENDENSI DULU ----------
for cmd in python3 curl; do
  command -v "$cmd" >/dev/null || {
    echo -e "${RED}Error: '$cmd' belum terinstall.${RESET}"
    echo "Pasan: pkg install -y python curl"
    exit 1
  }
done

# ---------- BANNER SEDERHANA ----------
banner(){
  clear
  echo -e "
⠀⠀⠀⣸⣏⠛⠻⠿⣿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ( CCTV ALL NEGARA )
⠀⠀⠀⣿⣿⣿⣷⣦⣤⣈⠙⠛⠿⣿⣷⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  /-----> CODE BY DANXY
⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣈⠙⠻⠿⣿⣷⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀ /-------> DANXY TOOLS V8.3
⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡉⠛⠻⢿⣿⣷⣶⣤⣀⠀⠀/---------> TOTAL 193 NEGARA CCTV PUBLIC
⠀⠀⠀⠉⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⢻⣍⡉⠉⣿⠇
⠀⠀⠀⠀⠀⠀⠀⢹⡏⢹⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣰⣿⣿⣾⠏⠀⠀██████╗  █████╗ ███╗  ██╗██╗  ██╗██╗   ██╗
⠀⠀⠀⠀⠀⠀⠀⠘⣿⠈⣿⠸⣯⠉⠛⠿⢿⣿⣿⣿⣿⡏⠀⠻⠿⣿⠇⠀⠀⠀██╔══██╗██╔══██╗████╗ ██║╚██╗██╔╝╚██╗ ██╔╝
⠀⠀⠀⠀⠀⠀⠀⠀⢿⡆⢻⡄⣿⡀⠀⠀⠀⠈⠙⠛⠿⠿⠿⠿⠛⠋⠀⠀⠀⠀██║  ██║███████║██╔██╗██║ ╚███╔╝  ╚████╔╝
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠘⣇⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██║  ██║██╔══██║██║╚████║ ██╔██╗   ╚██╔╝
⠀⠀⠀⠀⠀⠀⠀⣀⣀⣿⣴⣿⢾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██████╔╝██║  ██║██║ ╚███║██╔╝╚██╗   ██║
⠀⠀⣴⡶⠾⠟⠛⠋⢹⡏⠀⢹⡇⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀╚═════╝ ╚═╝  ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝   ╚═╝
⠀⢠⣿⠀⠀⠀⠀⢀⣈⣿⣶⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀      ⠀[ FITUR HACK CCTV 193 NEGARA DI DUNIA INI ]
⠀⢸⣿⣴⠶⠞⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠁⠀⠀⠀⠀⠀⠀
==========================================================================
      █████╗ ██╗     ██╗       █████╗  █████╗ ████████╗██╗   ██╗
     ██╔══██╗██║     ██║      ██╔══██╗██╔══██╗╚══██╔══╝██║   ██║
     ███████║██║     ██║      ██║  ╚═╝██║   ╚═╝  ██║   ╚██╗ ██╔╝
     ██╔══██║██║     ██║      ██║  ██╗██║  ██╗   ██║    ╚████╔╝
     ██║  ██║███████╗███████╗ ╚█████╔╝╚█████╔╝   ██║     ╚██╔╝
     ╚═╝  ╚═╝╚══════╝╚══════╝  ╚════╝  ╚════╝    ╚═╝      ╚═╝
          ██╗       ██╗ █████╗ ██████╗ ██╗     ██████╗ ██╗
          ██║  ██╗  ██║██╔══██╗██╔══██╗██║     ██╔══██╗██║
          ╚██╗████╗██╔╝██║  ██║██████╔╝██║     ██║  ██║██║
           ████╔═████║ ██║  ██║██╔══██╗██║     ██║  ██║╚═╝
           ╚██╔╝ ╚██╔╝ ╚█████╔╝██║  ██║███████╗██████╔╝██╗
            ╚═╝   ╚═╝   ╚════╝ ╚═╝   ╚╝ ╚═════╝╚═════╝ ╚═╝
==========================================================================
[AF] Afghanistan           [AL] Albania             [DZ] Algeria
[AD] Andorra               [AO] Angola              [AG] Antigua & Barbuda
[AR] Argentina             [AM] Armenia             [AU] Australia
[AT] Austria               [AZ] Azerbaijan          [BS] Bahamas
[BH] Bahrain               [BD] Bangladesh          [BB] Barbados
[BY] Belarus               [BE] Belgium             [BZ] Belize
[BJ] Benin                 [BT] Bhutan              [BO] Bolivia
[BA] Bosnia & Herzegovina  [BW] Botswana            [BR] Brazil
[BN] Brunei                [BG] Bulgaria            [BF] Burkina Faso
[BI] Burundi               [CV] Cabo Verde          [KH] Cambodia
[CM] Cameroon              [CA] Canada              [CF] Central African Rep.
[TD] Chad                  [CL] Chile               [CN] China
[CO] Colombia              [KM] Comoros             [CD] Congo - Kinshasa
[CG] Congo - Brazzaville   [CR] Costa Rica          [HR] Croatia
[CU] Cuba                  [CY] Cyprus              [CZ] Czechia
[DK] Denmark               [DJ] Djibouti            [DM] Dominica
[DO] Dominican Rep.        [EC] Ecuador             [EG] Egypt
[SV] El Salvador           [GQ] Equatorial Guinea   [ER] Eritrea
[EE] Estonia               [SZ] Eswatini            [ET] Ethiopia
[FJ] Fiji                  [FI] Finland             [FR] France
[GA] Gabon                 [GM] Gambia              [GE] Georgia
[DE] Germany               [GH] Ghana               [GR] Greece
[GD] Grenada               [GT] Guatemala           [GN] Guinea
[GW] Guinea-Bissau         [GY] Guyana              [HT] Haiti
[HN] Honduras              [HU] Hungary             [IS] Iceland
[IN] India                 [ID] Indonesia           [IR] Iran
[IQ] Iraq                  [IE] Ireland             [IL] Israel
[IT] Italy                 [JM] Jamaica             [JP] Japan
[JO] Jordan                [KZ] Kazakhstan          [KE] Kenya
[KI] Kiribati              [KW] Kuwait              [KG] Kyrgyzstan
[LA] Laos                  [LV] Latvia              [LB] Lebanon
[LS] Lesotho               [LR] Liberia             [LY] Libya
[LI] Liechtenstein         [LT] Lithuania           [LU] Luxembourg
[MG] Madagascar            [MW] Malawi              [MY] Malaysia
[MV] Maldives              [ML] Mali                [MT] Malta
[MH] Marshall Is.          [MR] Mauritania          [MU] Mauritius
[MX] Mexico                [FM] Micronesia          [MD] Moldova
[MC] Monaco                [MN] Mongolia            [ME] Montenegro
[MA] Morocco               [MZ] Mozambique          [MM] Myanmar
[NA] Namibia               [NR] Nauru               [NP] Nepal
[NL] Netherlands           [NZ] New Zealand         [NI] Nicaragua
[NE] Niger                 [NG] Nigeria             [KP] North Korea
[MK] North Macedonia       [NO] Norway              [OM] Oman
[PK] Pakistan              [PW] Palau               [PA] Panama
[PG] Papua New Guinea      [PY] Paraguay            [PE] Peru
[PH] Philippines           [PL] Poland              [PT] Portugal
[QA] Qatar                 [RO] Romania             [RU] Russia
[RW] Rwanda                [KN] Saint Kitts & Nevis [LC] Saint Lucia
[VC] Saint Vincent & the Grenadines                 [WS] Samoa
[SM] San Marino            [ST] Sao Tome & Principe [SA] Saudi Arabia
[SN] Senegal               [RS] Serbia              [SC] Seychelles
[SL] Sierra Leone          [SG] Singapore           [SK] Slovakia
[SI] Slovenia              [SB] Solomon Is.         [SO] Somalia
[ZA] South Africa          [KR] South Korea         [SS] South Sudan
[ES] Spain                 [LK] Sri Lanka           [SD] Sudan
[SR] Suriname              [SE] Sweden              [CH] Switzerland
[SY] Syria                 [TJ] Tajikistan          [TZ] Tanzania
[TH] Thailand              [TL] Timor-Leste         [TG] Togo
[TO] Tonga                 [TT] Trinidad & Tobago   [TN] Tunisia
[TR] Turkey                [TM] Turkmenistan        [TV] Tuvalu
[UG] Uganda                [UA] Ukraine             [AE] UAE
[GB] United Kingdom        [US] United States       [UY] Uruguay
[UZ] Uzbekistan            [VU] Vanuatu             [VA] Vatican City
[VE] Venezuela             [VN] Vietnam             [YE] Yemen
[ZM] Zambia                [ZW] Zimbabwe            [PS] Palestine
" | lolcat

  
}

declare -A NEGARA=(
  [AF]="Afghanistan"        [AL]="Albania"            [DZ]="Algeria"
  [AD]="Andorra"            [AO]="Angola"             [AG]="Antigua & Barbuda"
  [AR]="Argentina"          [AM]="Armenia"            [AU]="Australia"
  [AT]="Austria"            [AZ]="Azerbaijan"         [BS]="Bahamas"
  [BH]="Bahrain"            [BD]="Bangladesh"         [BB]="Barbados"
  [BY]="Belarus"            [BE]="Belgium"            [BZ]="Belize"
  [BJ]="Benin"              [BT]="Bhutan"             [BO]="Bolivia"
  [BA]="Bosnia & Herz."     [BW]="Botswana"           [BR]="Brazil"
  [BN]="Brunei"             [BG]="Bulgaria"           [BF]="Burkina Faso"
  [BI]="Burundi"            [CV]="Cabo Verde"         [KH]="Cambodia"
  [CM]="Cameroon"           [CA]="Canada"             [CF]="Central African Rep."
  [TD]="Chad"               [CL]="Chile"              [CN]="China"
  [CO]="Colombia"           [KM]="Comoros"            [CD]="Congo - Kinshasa"
  [CG]="Congo - Brazz."     [CR]="Costa Rica"         [HR]="Croatia"
  [CU]="Cuba"               [CY]="Cyprus"             [CZ]="Czechia"
  [DK]="Denmark"            [DJ]="Djibouti"           [DM]="Dominica"
  [DO]="Dominican Rep."     [EC]="Ecuador"            [EG]="Egypt"
  [SV]="El Salvador"        [GQ]="Eq. Guinea"         [ER]="Eritrea"
  [EE]="Estonia"            [SZ]="Eswatini"           [ET]="Ethiopia"
  [FJ]="Fiji"               [FI]="Finland"            [FR]="France"
  [GA]="Gabon"              [GM]="Gambia"             [GE]="Georgia"
  [DE]="Germany"            [GH]="Ghana"              [GR]="Greece"
  [GD]="Grenada"            [GT]="Guatemala"          [GN]="Guinea"
  [GW]="Guinea-Bissau"      [GY]="Guyana"             [HT]="Haiti"
  [HN]="Honduras"           [HU]="Hungary"            [IS]="Iceland"
  [IN]="India"              [ID]="Indonesia"          [IR]="Iran"
  [IQ]="Iraq"               [IE]="Ireland"            [IL]="Israel"
  [IT]="Italy"              [JM]="Jamaica"            [JP]="Japan"
  [JO]="Jordan"             [KZ]="Kazakhstan"         [KE]="Kenya"
  [KI]="Kiribati"           [KW]="Kuwait"             [KG]="Kyrgyzstan"
  [LA]="Laos"               [LV]="Latvia"             [LB]="Lebanon"
  [LS]="Lesotho"            [LR]="Liberia"            [LY]="Libya"
  [LI]="Liechtenstein"      [LT]="Lithuania"          [LU]="Luxembourg"
  [MG]="Madagascar"         [MW]="Malawi"             [MY]="Malaysia"
  [MV]="Maldives"           [ML]="Mali"               [MT]="Malta"
  [MH]="Marshall Is."       [MR]="Mauritania"         [MU]="Mauritius"
  [MX]="Mexico"             [FM]="Micronesia"         [MD]="Moldova"
  [MC]="Monaco"             [MN]="Mongolia"           [ME]="Montenegro"
  [MA]="Morocco"            [MZ]="Mozambique"         [MM]="Myanmar"
  [NA]="Namibia"            [NR]="Nauru"              [NP]="Nepal"
  [NL]="Netherlands"        [NZ]="New Zealand"        [NI]="Nicaragua"
  [NE]="Niger"              [NG]="Nigeria"            [KP]="North Korea"
  [MK]="N. Macedonia"       [NO]="Norway"             [OM]="Oman"
  [PK]="Pakistan"           [PW]="Palau"              [PA]="Panama"
  [PG]="Papua N.G."         [PY]="Paraguay"           [PE]="Peru"
  [PH]="Philippines"        [PL]="Poland"             [PT]="Portugal"
  [QA]="Qatar"              [RO]="Romania"            [RU]="Russia"
  [RW]="Rwanda"             [KN]="St Kitts & Nevis"   [LC]="Saint Lucia"
  [VC]="St Vincent & Gren." [WS]="Samoa"              [SM]="San Marino"
  [ST]="São Tomé & Príncipe"[SA]="Saudi Arabia"       [SN]="Senegal"
  [RS]="Serbia"             [SC]="Seychelles"         [SL]="Sierra Leone"
  [SG]="Singapore"          [SK]="Slovakia"           [SI]="Slovenia"
  [SB]="Solomon Is."        [SO]="Somalia"            [ZA]="South Africa"
  [KR]="South Korea"        [SS]="South Sudan"        [ES]="Spain"
  [LK]="Sri Lanka"          [SD]="Sudan"              [SR]="Suriname"
  [SE]="Sweden"             [CH]="Switzerland"        [SY]="Syria"
  [TJ]="Tajikistan"         [TZ]="Tanzania"           [TH]="Thailand"
  [TL]="Timor-Leste"        [TG]="Togo"               [TO]="Tonga"
  [TT]="Trinidad & Tobago"  [TN]="Tunisia"            [TR]="Turkey"
  [TM]="Turkmenistan"       [TV]="Tuvalu"             [UG]="Uganda"
  [UA]="Ukraine"            [AE]="UAE"                [GB]="United Kingdom"
  [US]="United States"      [UY]="Uruguay"            [UZ]="Uzbekistan"
  [VU]="Vanuatu"            [VA]="Vatican"            [VE]="Venezuela"
  [VN]="Vietnam"            [YE]="Yemen"              [ZM]="Zambia"
  [ZW]="Zimbabwe"           [PS]="Palestine"
)

# ---------- FUNGSI SCRAPE ----------
scrape(){
  local kode=$1
  local nama=${NEGARA[$kode]}
  local out="cctv_${kode}.txt"
  local url="http://www.insecam.org/en/bycountry/${kode}/"
  local ua="Mozilla/5.0 (Linux; Android 12) AppleWebKit/537.36 Chrome/123.0"

  echo -e "\n${YELLOW}[+] ${nama} (${kode})${RESET}\n"
 # echo -e "${BLUE}    URL → ${url}${RESET}\n"

  # progress titik


  # python core
  python3 - <<PY 2>&1
import requests, re, sys, random, time
url="$url"; headers={"User-Agent":"$ua"}; timeout=15; cams=[]
try:
    r=requests.get(url,headers=headers,timeout=timeout)
    cams=re.findall(r"http://\d{1,3}(?:\.\d{1,3}){3}:\d+/?",r.text)
    cams=list(set(cams))
except Exception as e:
    print(f"[x] {e}",file=sys.stderr)

if not cams:
    print("[∅] Tidak ada CCTV publik")
else:
    for cam in cams: print(cam)
    print(f"[!] Total {len(cams)} CCTV")
    with open("$out","w") as f: f.write("\n".join(cams))
    print(f"[✓] Tersimpan → $out")
PY
  wait   # matikan progress
  echo ""
}

# ---------- MENU ----------
menu(){
while :; do
  banner
  echo -e "
  [  1  ] PILIH NEGARA MEMASUKAN CODE NEGARA
  [  2  ] MODE MASAL ALL NEGARA
  [  0  ] EXIT / KELUAR\n"
  read -p "  PILIH [ 1 - 2 ] : " p
  case $p in
    0) echo -e "${GREEN}Sampai jumpa!${RESET}"; exit 0 ;;
    1) echo -e "\nContoh: JP  US  ID  DE"
       read -p "Kode negara (2 huruf): " kode
       kode=${kode^^}
       [[ -n "${NEGARA[$kode]:-}" ]] && scrape "$kode" || echo -e "${RED}Kode salah!${RESET}"
       read -p "Enter untuk kembali…" ;;
    2) echo -e "\n${MAGENTA}MODE MASAL 193 NEGARA SABAR YA${RESET}"
       for k in "${!NEGARA[@]}"; do scrape "$k"; done
       echo -e "${GREEN}[✓] Selesai semua!${RESET}"
       read -p "Enter untuk kembali…" ;;
    *) echo -e "${RED}Pilihan tidak valid${RESET}"; sleep 1 ;;
  esac
done
}

# ---------- ENTRY ----------
menu
