# Oneliner Collections
Simple script collections for chaining the awesome tools
- ## Subdomain TakeOver

```
#!/usr/bin/env bash

if [ ! -d result ]; then 
  mkdir result
fi

subfinder -d $1 -silent \
| dnsprobe -silent -f domain \
| httprobe -prefer-https \
| nuclei -nC -t /root/nuclei-templates/subdomain-takeover/detect-all-takeovers.yaml \
| tee -a result/$1.txt

```


- ## Mass Dirsearch

```
#!/usr/bin/env bash
if [ ! -d scans ]; then 
  mkdir scans
fi

if [ ! -d results ]; then 
  mkdir results
fi

subfinder -d $1 -silent \
| httprobe -prefer-https \
| tee -a scans/$1.txt

while read u; do \
  python dirsearch.py --plain-text-report=results/$1.txt \
-u $u -e *;
done < scans/$1.txt

```
