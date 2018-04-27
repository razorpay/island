#!/usr/bin/dumb-init /bin/sh
set -euo pipefail
IFS=$'\n\t'

echo "casting alohomora - vault"
$ALOHOMORA_BIN cast --region ap-south-1 --env prod --app ops "/app/conf/atlantis.cfg.j2" "/app/conf/google.json.j2"

#Starting oauth2proxy
oauth2_proxy --config=/app/conf/atlantis.cfg &

#Starting nginx
mkdir /run/nginx
nginx -g 'daemon off;'
