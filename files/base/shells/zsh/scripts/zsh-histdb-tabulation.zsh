#!/usr/bin/env zsh
# This is a custom tabulation command implemented fully in zsh that
# produces simple output suitable for zsh-histdb.
#
# The `column` command on macOS has a silly limitation max 2048 line
# length, it's unsuitable for tabulating long paths and commands. It
# also produces somewhat unexpected results with regards to column
# length and placement.
#
# Features:
# - Right indent for number columns
# - Give at least 2/3 of terminal width to command output unless all
#   lines fit within $COLUMNS of the terminal
#
# Potential future improvements:
# - Colorize output
#
# Author: Mathias Fredriksson (github.com/mafredri)
# License: MIT
_histdb_tabulate_cmd() {
	local -a col cols collen header
	local line
	integer len

	read -r line
	col=("${(@ps.\x1f.)line}")
	for (( i=1; i <= ${#col}; i++ )); do
		len=${#${col[$i]}}
		collen[$i]=$len
	done
	header=("${(@)col}")
	cols=("${(@)header}")

	while read -r line; do
		col=("${(@ps.\x1f.)line}")
		for (( i = 1; i <= $#col; i++ )); do
			len=${#${col[$i]}}
			if (( len > collen[$i] )); then
				collen[$i]=$len
			fi
		done
		cols+=("${(@)col}")
	done

	local pattern
	integer i colsize_precmd empty_colsize
	for ((i = 1; i < $#header; i++)); do
		if [[ $header[i] != cmds ]]; then
			colsize_precmd+=$(( $collen[$i] + 1 ))
		fi
		if ((i <= $#header - 2)); then
			empty_colsize+=$(($collen[$i] + 1))
		fi
	done
	local split_cmd=0
	if ((colsize_precmd + $collen[-1] > COLUMNS)) && ((colsize_precmd > COLUMNS / 3)); then
		split_cmd=1
	fi

	for ((i = 1; i < $#header; i++)); do
		case "$header[$i]" in
			ses|\?|secs)
				# Right aligned column.
				pattern+="%${collen[$i]}s "
				;;
			*)
				# Left aligned column, avoid padding the
				# last column before line split.
				if ((split_cmd)) && ((i == $#header-1)); then
					pattern+="%-s"
				else
					pattern+="%-${collen[$i]}s "
				fi
				;;
		esac
	done

	# Always give at least half the terminal to commands by
	# splitting the column on two lines and aligning to the
	# middle.
	if ((split_cmd)); then
		pattern+="\n$(printf ' %.0s' {1..$((COLUMNS / 3))})%s\n\n"
	else
		pattern+=" %s\n"
	fi

	# Print and remove empty lines in case cmds
	# was moved to new line.
	printf "$pattern" "${(@)cols}" \
		| grep -v "^$" \
		| grep -v "^$(printf ' %.0s' {1..$empty_colsize})\$" \
		| grep -v "^$(printf ' %.0s' {1..$colsize_precmd})\$"
}
HISTDB_TABULATE_CMD=(_histdb_tabulate_cmd)
