#!/usr/bin/env bash
# https://www.youtube.com/watch?v=r2rbAvXMcXQ
COLUMNS=$(tput cols)
LINES=$(tput lines)
task=${1:-test}
max=9999

progressbar() {
	local current=$1
	local len=$2

	# local width=$(( COLUMNS - 2 ))
	local bar_char="|"
	local empty_char=" "

	local perc_done=$((current * 100 / len))
	local suffix=" $current/$len ($perc_done%)"

	local width=$((COLUMNS - ${#suffix} - 2))
	local num_bars=$((perc_done * width / 100))

	local i
	local s='['
	for ((i = 0; i < num_bars; i++)); do
		s+=$bar_char
	done
	for ((i = num_bars; i < width; i++)); do
		s+=$empty_char
	done
	s+=']'
	s+=$suffix

	printf '\e7' # save the cursor location
	printf '\e[%d;%dH' "$LINES" 0 # move cursor to the bottom line
	printf '\e[0K' # clear the line
	printf '%s' "$s" # print the progress bar
	printf '\e8' # restore the cursor location
}

init-term() {
	printf '\n' # ensure we have space for the scrollbar
	printf '\e7' # save the cursor location
	printf '\e[%d;%dr' 0 "$((LINES - 1))" # set the scrollable region (margin)
	printf '\e8' # restore the cursor location
	printf '\e[1A' # move cursor up
}
reset-term() {
	printf '\e7' # save the curosr location
	printf '\e[%d;%dr' 0 "$LINES" # reset the scrollable region (margin)
	printf '\e[%d;%dH' "$LINES" 0 # move cursor to the bottom line
	printf '\e[0K' # clear the line
	printf '\e8' # reset the cursor location
}
main() {
	trap reset-term exit
	trap init-term winch
	init-term

	i=1
	ant clean
	mkdir -p target/reports
	for n in $(seq -f "%05g" $max 1); do
		progressbar $i $max
		((i++))
		#echo "Running run $n"
		ant "$task" > target/reports/antout.txt
		if [ ! "$?" == "0" ]; then
			echo "-=-= Error: =-=-"
			cp target/reports/antout.txt target/reports/antOut$n.txt
			cat target/reports/antout.txt
			until $(~/Scripts/checkFileChanged.sh ./test/test.lua); do
				sleep 1
			done
		fi
	done
}

main