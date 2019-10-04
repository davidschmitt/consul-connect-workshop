#
# Start the sidecar proxy in the background
#
consul connect proxy -sidecar-for ui-backend \
  -http-addr="127.0.0.2:8500" >server/proxy.log 2>&1 </dev/null &
echo "$!" >server/proxy.pid
