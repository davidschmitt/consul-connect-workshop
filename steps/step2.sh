#
# Configure the Consul server.
#
# Normally there would be three servers for high availability but for
# simplicity of this workshop we will use only one.
#
# We use an alternate loopback IP 127.0.0.2 so that we can 
# run multiple Consul agents on the same machine.
#    connect = { 
#      sidecar_service = { 
#        address = "127.0.0.2"
#        checks = [ ]
#      }
#    }
#
echo '
  bind_addr = "127.0.0.2"
  bootstrap_expect = 1
  client_addr = "127.0.0.2"
  connect { enabled = true }
  data_dir = "'"$PWD"'/server/data"
  node_name = "server"
  server = true
  ui = true
  services = {
    name = "ui-backend"
    address = "127.0.0.2"
    port = 8500
    check = {
      http = "http://127.0.0.2:8500/"
      interval = "10s"
    }
  }
  services = {
    name = "ui-backend-sidecar-proxy"
    address = "127.0.0.2"
    port = 21000
    kind = "connect-proxy"
    checks = {
      Name = "Connect Sidecar Listening"
      TCP = "127.0.0.2:21000"
      Interval = "10s"
    }
    checks = {
      name = "Connect Sidecar Aliasing ui-backend"
      alias_service = "ui-backend"
    }
    proxy = {
      destination_service_name = "ui-backend"
      destination_service_id = "ui-backend"
      local_service_address = "127.0.0.2"
      local_service_port = 8500
    }
  }
' >server/config.hcl
