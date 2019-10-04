#
# Validate the Consul configuration files
#
consul validate server/config.hcl &&
consul validate client/config.hcl
