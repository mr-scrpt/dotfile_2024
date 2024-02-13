#!/bin/bash

sketchybar --add item swap_used right \
           --set swap_used  update_freq=2 \
                      icon=􁁀  \
                      script="$PLUGIN_DIR/swap_used.sh"

