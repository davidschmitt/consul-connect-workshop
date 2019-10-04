#
# Configure the client Consul agent
#
echo '
  bind_addr = "127.0.0.3"
  client_addr = "127.0.0.3"
  connect { enabled = true }
  data_dir = "'"$PWD"'/client/data"
  node_name = "client"
  retry_join = [ "127.0.0.2" ]
  services = { name = "ui-frontend" }
' >client/config.hcl
