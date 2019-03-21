#!/bin/bash
set -e

SHARE_DIR=/share/nextcloud
if [ ! -d "${SHARE_DIR}" ]; then
    mkdir -p "${SHARE_DIR}" 
    chown -R www-data:root "${SHARE_DIR}"
    chmod -R g=u "${SHARE_DIR}"
fi

# if an empty volume is mounted to /data, pre-populate it
[[ $( ls -1A /data/database | wc -l ) -eq 0 ]] && { echo "Initializing database dir.."; cp -raT /data-ro/database /data/database; }
[[ $( ls -1A /data/nextcloud | wc -l ) -eq 0 ]] && { echo "Initializing nextcloud dir.."; cp -raT /data-ro/nextcloud /data/nextcloud; }

eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

/run-parts.sh
