#
# Confirm that Consul Connect Intentions block our access
#
curl -s http://127.0.0.3:8700/ui/dc1/services
if [ "$?" "=" "0" ]
then
  echo "We expected an error, but cURL did not report one."
  exit 1
else
  echo "Access blocked as expected."
  exit 0
fi
