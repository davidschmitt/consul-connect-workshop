#
# Start the upstream proxy in the background and store the process ID
# so we can clean-up later
#
consul connect proxy -service ui-frontend -upstream ui-backend:127.0.0.3:8700 \
  -http-addr="127.0.0.3:8500" >client/proxy.log 2>&1 </dev/null &
echo "$!" >client/proxy.pid
