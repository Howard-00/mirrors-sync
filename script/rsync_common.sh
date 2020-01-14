#!/bin/bash

touch $sync_path/status/$sync_name
if [ `cat "$sync_path/status/$sync_name"` == "syncing" ] ; then
	sync_logtail=`tail -1 "$sync_path/log/$sync_name.log"`;
	sleep 10m;
	if [ `tail -1 "$sync_path/log/$sync_name.log"` == $sync_logtail ] ; then
		ps -ef | grep "$sync_command" | grep -v grep | awk '{print $2}' | xargs kill -TERM;
		echo "kill & sync"
		echo "failed" > "$sync_path/status/$sync_name";
	fi
fi


if [ `cat "$sync_path/status/$sync_name"` == "syncing" ] ; then
	echo "[$sync_name] Disabled, skipping...";
else
	echo "[$sync_name] Syncing...";
	echo "syncing" > "$sync_path/status/$sync_name";
	$sync_command;
	sync_exit=$?;
	if [ $sync_exit -eq 0 ] ; then
		echo "[$sync_name] Sync completed.";
		echo "normal" > "$sync_path/status/$sync_name";
	elif [ $sync_exit -eq 124 ] ; then
		echo "[$sync_name] Timeout";
		echo "timeout" > "$sync_path/status/$sync_name";
	else
		echo "[$sync_name] Sync failed.";
		echo "failed" > "$sync_path/status/$sync_name";
	fi
fi

