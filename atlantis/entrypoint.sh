#!/usr/bin/dumb-init /bin/sh
set -euo pipefail
IFS=$'\n\t'

echo "casting alohomora - vault"
alohomora cast --region ap-south-1 --env prod --app ops "/atlantis/config.yaml.j2"

# Starting atlantis server
atlantis server --config="/atlantis/config.yaml" --require-approval --repo-whitelist 'github.com/razorpay/vishnu'