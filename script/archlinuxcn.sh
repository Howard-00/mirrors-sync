#!/bin/bash

export sync_path="/mirrors"
export upstream_path="repo"
export proxy_port="9981"
export sync_url="rsync://uestclug@proxy.uestclug.org"
export sync_name="archlinuxcn"
export RSYNC_PASSWORD="p1JUGdcc4osUz8B"
export sync_command="rsync -rltz6 --port=$proxy_port --progress --delete-after --delay-updates --safe-links --contimeout=60 --log-file=$sync_path/log/$sync_name.log $sync_url/$upstream_path $sync_path/data/$sync_name"
bash "$sync_path/sync/script/rsync_common.sh"
