if [ -n "$1" ]; then
  ip netns exec "$1" iptables -nvL
else
  iptables -nvL
fi
