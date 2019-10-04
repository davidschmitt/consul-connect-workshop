#
# Add allow rule specifically for ui-frontend to talk to ui-backend
#
consul intention create -http-addr=127.0.0.2:8500 -allow 'ui-frontend' 'ui-backend'
