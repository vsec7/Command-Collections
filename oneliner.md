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
