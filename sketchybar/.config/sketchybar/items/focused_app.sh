#!/bin/bash

sketchybar --add item focused_app right \
           --set focused_app    background.color=$ACTIVE_COLOR \
                                icon.color=$ACTIVE_TEXT_COLOR \
                                icon.font="sketchybar-app-font:Regular:16.0" \
                                label.color=$ACTIVE_TEXT_COLOR \
                                script="$PLUGIN_DIR/focused_app.sh"          \
           --subscribe focused_app front_app_switched
