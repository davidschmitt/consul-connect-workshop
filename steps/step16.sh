#
# Confirm that Consul Connect Intentions now allow our access
#
# You can also test access by opening the following URL from
# a browser running on the same machine as this demo:
#
#   http://127.0.0.3:8700/ui/dc1/services
#
curl -s http://127.0.0.3:8700/ui/dc1/services >/dev/null
if [ "$?" "=" "0" ]
then
  echo "Access permitted as expected"
  exit 0
else
  echo "Access blocked unexpectedly"
  exit 1
fi
