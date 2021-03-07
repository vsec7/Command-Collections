# Simple Auto XSS

Crafted by : <a href="https://twitter.com/verry__d"><img src="https://img.shields.io/twitter/follow/verry__d.svg?logo=twitter"></a>

## Tools
- <a href="https://github.com/lc/gau"> gau </a>
- <a href="https://github.com/tomnomnom/gf"> gf </a>
- <a href="https://github.com/1ndianl33t/Gf-Patterns"> gf patterns </a>
- <a href="https://github.com/dwisiswant0/unew"> unew </a>
- <a href="https://github.com/hahwul/dalfox"> dalfox </a>
- <a href="https://github.com/vsec7/distee"> distee </a>

## Script

```bash
#!/usr/bin/env bash
# XSS
# Crafted by github.com/vsec7
# ./x domain.com

echo $1 \
    | gau -subs -b jpg,jpeg,gif,css,tif,tiff,png,ttf,woff,woff2,ico,pdf,svg,txt \
    | gf xss \
    | unew \
    | dalfox pipe \
        --multicast \
        --no-color \
        --found-action "echo @@query@@ | distee -c 8174070495026xxxxx -t '[ @@type@@ ]'"
```
