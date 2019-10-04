#
# Start the client agent in the background then wait a few seconds for it to stabilize
#
consul agent -config-dir=client >client/agent.log 2>&1 </dev/null &
sleep 5
