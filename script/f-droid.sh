
#!/bin/bash

export sync_path="/mirrors"
export upstream_path="fdroid"
export proxy_port="9982"
export sync_url="rsync://proxy.uestclug.org"
export sync_name="f-droid"
export sync_command="rsync -rltz6 --port=$proxy_port --progress --delete-after --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r --delay-updates --safe-links --contimeout=60-after --delay-updates --safe-links --contimeout=60 --log-file=$sync_path/log/$sync_name.log $sync_url/$upstream_path $sync_path/data/$sync_name"
bash "$sync_path/sync/script/rsync_common.sh"
