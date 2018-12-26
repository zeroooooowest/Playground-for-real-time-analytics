#!/bin/sh -e

cd /App
ext_ip=$(curl ipinfo.io/ip)
sed -i -e "s/localhost/$ext_ip/" index.html
python3 -m  http.server 7090