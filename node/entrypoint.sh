#!/bin/bash

set -e

if [ ! -f /run/secrets/massa_password ]; then
  echo "Mot de passe massa non trouvé" >&2
  exit 1
fi

massa_password=$(cat /run/secrets/massa_password)

cd massa/massa-node/
exec ./massa-node -a -p "$massa_password"