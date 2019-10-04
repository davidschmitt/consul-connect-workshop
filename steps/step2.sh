#
# Configure the Consul server.
#
# cygPath is needed on Microsoft Windows to convert the Unix-style path
# into a mixed Windows path (it is ignored on Unix-based systems)
#
DATA_DIR="$PWD/server/data"
cygPath -V >/dev/null 2>&1 && DATA_DIR=$(cygPath -m "$DATA_DIR")
echo '
  bind_addr = "127.0.0.2"
  bootstrap_expect = 1
  client_addr = "127.0.0.2"
  connect { enabled = true }
  data_dir = "'"$DATA_DIR"'"
  node_name = "server"
  server = true
  ui = true
' >server/config.hcl
