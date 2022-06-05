#!/bin/sh

SCRIPTS="$HOME/.local/bin/scripts/statusbar"

styleBattery() {
    CHARGE="$(sh $SCRIPTS/battery)"

    # Remove Battery Symbol for case
    case "${CHARGE#???}" in
        100%)
            echo "+@fg=1;$CHARGE+@fg=0;";
            ;;
        ?%)
            echo "+@fg=3;$CHARGE+@fg=0;";
            ;;
        *)
            echo $CHARGE;
            ;;
    esac
}

styleVolume() {
    STATUS="$(sh $SCRIPTS/volume)"

    case "$STATUS" in
        muted)
            echo "+@fg=3;$STATUS+@fg=0;";
            ;;
        *)
            echo "$STATUS";
            ;;
    esac
}

while true; do
    echo "+@fg=1;[+@fg=0;+@fn=1; $(styleBattery) +@fn=0;+@fg=1;] [+@fg=0; $(styleVolume) +@fg=1;] [+@fg=0; $(sh $SCRIPTS/network) +@fg=1;]+@fg=0;";
    sleep 0.25;
done;
