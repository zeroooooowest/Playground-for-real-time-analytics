#!/bin/sh -e

cd /App
ext_ip=$(hostname -I | cut -d" " -f 1)
sed -i -e "s/localhost/$ext_ip/" index.html
python3 -m  http.server 7090