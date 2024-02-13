#!/bin/bash

sketchybar --add item ram_free right \
           --set ram_free  update_freq=2 \
                      icon=􀫦  \
                      script="$PLUGIN_DIR/ram_free.sh"
