#!/usr/bin/env bash
# Ve <3 Cath
# github.com/vsec7/Command-Collections/blob/master/reconn.sh

SubGrab(){
    subfinder -silent -d $1 -o scans/$1/subs/subfinder.txt
	assetfinder --subs-only $1 | tee scans/$1/subs/assetfinder.txt
	crobat -s $1 | tee scans/$1/subs/crobat.txt
	chaos -silent -d $1 -o scans/$1/subs/chaos.txt
	findomain -t $1 -q -u scans/$1/subs/findomain.txt
	# amass enum -d $1 -passive -noalts -norecursive | tee scans/$1/subs/amass.txt
	sort -u scans/$1/subs/*.txt > scans/$1/subs/allsubs.txt
	httpx -l scans/$1/subs/allsubs.txt -mc 200,302 -silent -o scans/$1/httpx.txt
}

NucleiScan(){
    nuclei -l scans/$1/httpx.txt -no-color -stats -silent \
        -t ~/nuclei-templates/cves/ \
        -t ~/nuclei-templates/default-logins/ \
        -t ~/nuclei-templates/dns/ \
        -t ~/nuclei-templates/exposed-panels/ \
        -t ~/nuclei-templates/exposed-tokens/ \
        -t ~/nuclei-templates/exposures/ \
        -t ~/nuclei-templates/misconfiguration/ \
        -t ~/nuclei-templates/takeovers/ \
        -t ~/nuclei-templates/technologies/ \
        -t ~/nuclei-templates/vulnerabilities/ \
        -t ~/nuclei-templates/workflows/ \
    | slacktee -c nuclei -a good \
    | tee -a scans/$1/nuclei.txt
}

GathAllUrls(){
	
	if [ ! -d scans/$1/urls ]; then 
		mkdir scans/$1/urls
	fi
	
	waybackurls < scans/$1/httpx.txt \
		| sed '/^$/d' \
		| grep -ivE ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt)" \
		| unew \
		| tee scans/$1/urls/waybackurls.txt

	gau -subs -b jpg,jpeg,gif,css,tif,tiff,png,ttf,woff,woff2,ico,pdf,svg,txt < scans/$1/httpx.txt \
		| unew \
		| tee scans/$1/urls/gau.txt

	hakrawler -plain -usewayback -wayback < scans/$1/httpx.txt \
		| grep -ivE ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt)" \
		| unew \
		| tee scans/$1/urls/hakrawler.txt

	gospider -q -S scans/$1/httpx.txt -d 3 -c 5 -t 100 -d 3 --blacklist jpg,jpeg,gif,css,tif,tiff,png,ttf,woff,woff2,ico,pdf,svg,txt \
		| unew \
		| tee scans/$1/urls/gospider.txt
		
	sort -u scans/$1/urls/*.txt > scans/$1/allurls.txt
}

SubGrab $1
NucleiScan $1
GathAllUrls $1
