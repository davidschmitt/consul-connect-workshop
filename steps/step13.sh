#
# Add intention to deny everything by default
#
consul intention create -http-addr=127.0.0.2:8500 -deny '*' '*'
