printf "\n\n==== STATISTICS ====\n"
cpupower --cpu all frequency-info -s --human | sed 's/, /\n/g' | sed 's/)/)\n/g'
