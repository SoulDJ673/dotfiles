#!/bin/sh

SCRIPTS="$HOME/.local/bin/scripts/statusbar"
while true; do
    echo "[$(sh $SCRIPTS/battery)]  [$(sh $SCRIPTS/volume)]";
    sleep 0.1;
done;
