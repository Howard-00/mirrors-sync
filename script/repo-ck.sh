#!/bin/bash

export sync_path="/mirrors"
export sync_url="rsync://mirrors.tuna.tsinghua.edu.cn"
export sync_name="repo-ck"
export sync_command="rsync -rltz6 --progress --delete-after --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r --delay-updates --safe-links --contimeout=60 --log-file=$sync_path/log/$sync_name.log $sync_url/$sync_name $sync_path/data/$sync_name"
bash "$sync_path/sync/script/rsync_common.sh"
