#
# Append the Consul Connect sidecar service configuration.
#
# Obviously we would prefer to use the shortcut syntax
# once Consul fixes the default health check.
#
echo '
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
' >>server/config.hcl
