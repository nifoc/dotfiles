# Source: https://dschrempf.github.io/linux/2024-02-14-monitoring-a-home-server/

SMARTCTL_OUTPUT=$(smartctl --json=c --nocheck=standby -H "/dev/disk/by-id/$1")
if [[ $? == "2" ]]; then
  echo "STANDBY"
  exit 0
fi
PASSED=$(jq '.smart_status.passed' <<<"$SMARTCTL_OUTPUT")

if [ "$PASSED" = "true" ]; then
  echo "PASSED"
  exit 0
else
  echo "FAULTY"
  exit 1
fi
