#!/usr/bin/env bash
# Awesome Tools Installer (Bundle)
# Ve <3 Cath
# github.com/vsec7

cat <<EOF
+------------------------------------------------------------------+
|           Awesome Tools Installer (Bundle)
|           By : Ve <3 Cath
|           Sec7or Team ~ Surabaya Hacker Link
+------------------------------------------------------------------+
EOF

cd /tmp

echo "[+] Installing Findomain (@Findomain)"
sudo wget https://github.com/Findomain/Findomain/releases/download/3.0.1/findomain-linux -qO /usr/bin/findomain
sudo chmod +x /usr/bin/findomain

echo "[+] Installing DalFox (@hahwul)"
GO111MODULE=on go get -u github.com/hahwul/dalfox/v2

echo "[+] Installing Assetfinder (@tomnomnom)"
go get -u github.com/tomnomnom/assetfinder

echo "[+] Installing Anew (@tomnomnom)"
go get -u github.com/tomnomnom/anew

echo "[+] Installing GF (@tomnomnom)"
go get -u github.com/tomnomnom/gf

echo "[+] Installing HttpProbe (@tomnomnom)"
go get -u github.com/tomnomnom/httprobe

echo "[+] Installing Gron (@tomnomnom)"
go get -u github.com/tomnomnom/gron

echo "[+] Installing Anti Broken Url (@tomnomnom)"
go get -u github.com/tomnomnom/hacks/anti-burl

echo "[+] Installing Comb (@tomnomnom)"
go get -u github.com/tomnomnom/hacks/comb

echo "[+] Installing QsReplace (@tomnomnom)"
go get -u github.com/tomnomnom/qsreplace

echo "[+] Installing Unfulr (@tomnomnom)"
go get -u github.com/tomnomnom/unfurl

echo "[+] Installing GoSpider (@jaeles-project)"
go get -u github.com/jaeles-project/gospider

echo "[+] Installing Hakrawler (@hakluke)"
go get -u github.com/hakluke/hakrawler

echo "[+] Installing Unew (@dwisiswant0)"
go get -u github.com/dwisiswant0/unew

echo "[+] Installing FFuF (@ffuf)"
go get -u github.com/ffuf/ffuf

echo "[+] Installing Confused (@visma-prodsec)"
go get -u github.com/visma-prodsec/confused

echo "[+] Installing Crobat (@cgboal)"
go get -u github.com/cgboal/sonarsearch/crobat

echo "[+] Installing GAU (@lc)"
GO111MODULE=on go get -u github.com/lc/gau

echo "[+] Installing Subfinder (@projectdiscovery)"
GO111MODULE=on go get -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder

echo "[+] Installing Chaos (@projectdiscovery)"
GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos

echo "[+] Installing Nuclei (@projectdiscovery)"
GO111MODULE=on go get -u github.com/projectdiscovery/nuclei/v2/cmd/nuclei

echo "[+] Installing Httpx (@projectdiscovery)"
GO111MODULE=on go get -u github.com/projectdiscovery/httpx/cmd/httpx

echo "[+] Installing Naabu (@projectdiscovery)"
GO111MODULE=on go get -u github.com/projectdiscovery/naabu/v2/cmd/naabu

echo "[+] Installing Chrome Browser (@linux)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "[+] Installing GoWitness (@sensepost)"
wget https://github.com/sensepost/gowitness/releases/download/2.3.1/gowitness-2.3.1-linux-amd64 -qO ~/go/bin/gowitness
chmod +x ~/go/bin/gowitness

echo "[+] Installing SlackTee (@course-hero)"
git clone https://github.com/course-hero/slacktee.git
sudo bash ./slacktee/install.sh /usr/bin
