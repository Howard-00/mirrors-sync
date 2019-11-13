
#!/bin/bash

export sync_path="/mirrors"
export sync_url="rsync://ftp.fau.de"
export sync_name="f-droid"
export sync_command="rsync -rltz --progress --delete --log-file=$sync_path/log/$sync_name.log $sync_url/$sync_name $sync_path/data/$sync_name"
sh "$sync_path/sync/script/rsync_common.sh"
