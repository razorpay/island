#!/usr/bin/env sh
set -e

#Alohomora
ALOHOMORA_BIN=$(which alohomora)

echo "casting alohomora - vault"
$ALOHOMORA_BIN cast --region ap-south-1 --env prod --app ops "/app/conf/atlantis.cfg.j2"
$ALOHOMORA_BIN cast --region ap-south-1 --env prod --app ops "/app/conf/google.json.j2"

#Copying files
cp /app/conf/atlantis.conf /etc/nginx/conf.d/atlantis.conf
cp /app/conf/atlantis.cfg /etc/oauth2proxy/atlantis.cfg
cp /app/conf/google.json /etc/oauth2proxy/google.json

#Starting oauth2proxy
oauth2_proxy --config=/etc/oauth2proxy/atlantis.cfg &

#Starting nginx
mkdir /run/nginx
nginx -g 'daemon off;'
