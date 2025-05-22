avg_cpu_temp="$(sensors "$1" | awk '/^Core /{++r; gsub(/[^[:digit:]]+/, "", $3); s+=$3} END{print s/(10*r)}')"
echo "Avg. CPU: ${avg_cpu_temp}°C"

printf "\n==== SENSORS ====\n"

sensors

exit_code="$(printf "%.0f" "$avg_cpu_temp")"
exit "$exit_code"
