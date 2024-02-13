#!/bin/bash

sketchybar --add item ram_ava right \
           --set ram_ava  update_freq=2 \
                      icon=􀧖  \
                      script="$PLUGIN_DIR/ram_available.sh"
