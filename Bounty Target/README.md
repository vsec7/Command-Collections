# Bounty Target

## crafted by @vsec7

## One Liner to fetch target list from https://chaos-data.projectdiscovery.io
<img src="chaos.jpg">

```
mkdir chaos; cd $_; curl -s https://chaos-data.projectdiscovery.io/index.json | jq -r '.[] | select( .bounty == true ) | .URL' | xargs -I% wget -q --show-progress %; unzip '*.zip'; rm *.zip
```