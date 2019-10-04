#
# Forecefully shutdown the proxies and gracefully shutdown the agents
#
kill $(cat */proxy.pid) &&
consul leave -http-addr="127.0.0.3:8500" &&
consul leave -http-addr="127.0.0.2:8500"
