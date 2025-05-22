# Source: https://dschrempf.github.io/linux/2024-02-14-monitoring-a-home-server/

SMARTCTL_OUTPUT=$(smartctl --json=c --nocheck=standby -A "/dev/disk/by-id/$1")
if [[ $? == "2" ]]; then
  echo "STANDBY"
  exit 0
fi
TEMPERATURE=$(jq '.temperature.current' <<<"$SMARTCTL_OUTPUT")

echo "${TEMPERATURE} °C"
exit "$TEMPERATURE"
