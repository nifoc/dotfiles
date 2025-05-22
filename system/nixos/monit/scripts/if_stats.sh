if [ -n "$2" ]; then
  ip -n "$2" -s -s link show dev "$1"
else
  ip -s -s link show dev "$1"
fi
