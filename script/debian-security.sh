#!/bin/bash

export sync_path="/mirrors"
export upstream_path="debian-security"
export proxy_port="9983"
export sync_url="rsync://proxy.uestclug.org"
export sync_name="debian-security"
export sync_command="rsync -rltz6 --port=$proxy_port --progress --delete-after --delay-updates --safe-links --contimeout=60 --log-file=$sync_path/log/$sync_name.log $sync_url/$upstream_path $sync_path/data/$sync_name"
sh "$sync_path/sync/script/rsync_common.sh"
