# qsrep
## Query String Replacer

** Simple Command Crafted By @viloid

You can pipe with list file, gau, hakrawler, or waybackurls .

## Add on your *.bash_profile* (bash) or *.zprofile* (zsh)

### Code :
```
qsrep(){	
	sed -e 's/[^=]*&/'"$1"'\&/g' -e 's/[^=]*$/'"$1"'/'
}
```

## Don't forget!

- bash
```
ve@cans ~$ source ~/.bash_profile
```
- zsh
```
ve@cans ~$ source ~/.zprofile
```

### How To Use :
```
ve@cans ~$ echo "https://rincans.io/?a=1&b=2&c=3" | qsrep FUZZ
https://rincans.io/?a=FUZZ&b=FUZZ&c=FUZZ

ve@cans ~$ cat url
https://rincans.io/?a=1&b=2
https://rincans.io/?a=1&b=2&c=3
https://rincans.io/?a=1&b=2&d=4

$ cat url | qsrep FUZZ
https://rincans.io/?a=FUZZ&b=FUZZ
https://rincans.io/?a=FUZZ&b=FUZZ&c=FUZZ
https://rincans.io/?a=FUZZ&b=FUZZ&d=FUZZ

ve@cans ~$ cat url | qsrep "'"
https://rincans.io/?a='&b='
https://rincans.io/?a='&b='&c='
https://rincans.io/?a='&b='&d='

ve@cans ~$ cat url | qsrep "r4nd0mstr1ng.burpcollaborator.net"
https://rincans.io/?a=r4nd0mstr1ng.burpcollaborator.net&b=r4nd0mstr1ng.burpcollaborator.net
https://rincans.io/?a=r4nd0mstr1ng.burpcollaborator.net&b=r4nd0mstr1ng.burpcollaborator.net&c=r4nd0mstr1ng.burpcollaborator.net
https://rincans.io/?a=r4nd0mstr1ng.burpcollaborator.net&b=r4nd0mstr1ng.burpcollaborator.net&d=r4nd0mstr1ng.burpcollaborator.net

ve@cans ~$ cat url | qsrep "\/etc\/passwd"
https://rincans.io/?a=/etc/passwd&b=/etc/passwd
https://rincans.io/?a=/etc/passwd&b=/etc/passwd&c=/etc/passwd
https://rincans.io/?a=/etc/passwd&b=/etc/passwd&d=/etc/passwd

ve@cans ~$ cat url | qsrep "\"><svg onload=alert(1)>"
https://rincans.io/?a="><svg onload=alert(1)>&b="><svg onload=alert(1)>
https://rincans.io/?a="><svg onload=alert(1)>&b="><svg onload=alert(1)>&c="><svg onload=alert(1)>
https://rincans.io/?a="><svg onload=alert(1)>&b="><svg onload=alert(1)>&d="><svg onload=alert(1)>
```
