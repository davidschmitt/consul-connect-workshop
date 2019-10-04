#!/bin/bash

echo "Performing cleanup.  This may take a few seconds..."
consul leave -http-addr="127.0.0.3:8500" 2>/dev/null
consul leave -http-addr="127.0.0.2:8500" 2>/dev/null

ANY=NO
for PID_FILE in "$1"/*/*.pid
do
  if [ -f "$PID_FILE" ]
  then
    PID=$(cat "$PID_FILE")
    if [ "$PID" "!=" "" ]
    then
      ps -p "$PID" | grep consul >/dev/null 2>&1
      if [ "$?" = "0" ]
      then
        ANY=YES
        ps -p "$PID"
        echo kill "$PID"
        kill "$PID"
      fi
    fi
  fi
done

if [ "$ANY" = "YES" ]
then
  sleep 5
fi

rm -rf "$1"
