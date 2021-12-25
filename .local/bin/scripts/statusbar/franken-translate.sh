#!/bin/bash

# franken-translate.sh [selected-color] [normal-color]

ff="/tmp/frankenwm.fifo"

# desktop names
ds=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")

# layout names
ms=("[T]" "[M]" "[B]" "[G]" "[F]" "[D]" "[E]")

while read -t 60 -r wmout || true; do
    if [[ $wmout =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]]; then
        read -ra desktops <<< "$wmout" && unset r
        for desktop in "${desktops[@]}"; do
		# FrankenWM outputs an extra value that seems to go unused "f"
            IFS=':' read -r d w m c u f <<< "$desktop"
            ((c)) && fg="%{F$1}%{U$1}" i="${ms[$m]}" aw="$w"\
            || fg="%{F$2}%{U-}"
            ((u)) && w+='%{F$2}%{U-}'
            # r+=" $fg${ds[$d]} [${w/#0/-}] "
            r+="$fg ${ds[$d]} %{U-}"
        done
        r="${r%::*}"
    fi
    printf "%s%s%s\n" "$r" "%{F$2}$i [$aw]"
done < "$ff"
