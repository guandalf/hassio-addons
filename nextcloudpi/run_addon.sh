#!/bin/bash
set -e

SHARE_DIR=/share/nextcloud
if [ ! -d "${SHARE_DIR}" ]; then
    mkdir -p "${SHARE_DIR}" 
    chown -R www-data:root "${SHARE_DIR}"
    chmod -R g=u "${SHARE_DIR}"
fi

# if an empty volume is mounted to /data, pre-populate it
if [ ! -d /data/database ]; then
    echo "Initializing database dir..";
    cp -raT /data-ro/database /data/database;
fi
if [ ! -d /data/nextcloud ]; then
    echo "Initializing nextcloud dir..";
    cp -raT /data-ro/nextcloud /data/nextcloud;
fi

eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

/run-parts.sh
