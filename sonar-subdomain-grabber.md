# Sonar Omnisint Subdomain Grabber
```
curl -s https://sonar.omnisint.io/subdomains/paypal.com | grep -oP '"\K[^",]*' | sort -u
```
