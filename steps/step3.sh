#
# Append a service definition for the Consul UI so we can
# add a Consul Connect sidecar proxy later on.
#
# There is a shortcut way to include a sidecar service
# but currently Consul requires that the sidecar listen on
# 127.0.0.1 for the default health checks (and ours doesn't).
#
# The shortcut syntax looks like this:
#
#   service = {
#     name = "ui-backend"
#     connect = { sidecar_service = { } }
#     ...
#   }
#
DATA_DIR="$PWD/server/data"
cygPath -V >/dev/null 2>&1 && DATA_DIR=$(cygPath -m "$DATA_DIR")
echo '
  services = {
    name = "ui-backend"
    address = "127.0.0.2"
    port = 8500
    check = {
      http = "http://127.0.0.2:8500/"
      interval = "10s"
    }
  }
' >>server/config.hcl
