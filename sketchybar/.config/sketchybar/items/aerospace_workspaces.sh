#!/bin/bash

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_windows_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left                                     \
             --subscribe space.$sid aerospace_workspace_change              \
             --set space.$sid                                               \
                          icon=$sid                                         \
                          label.font="sketchybar-app-font:Regular:16.0"     \
                          label.padding_right=20                            \
                          label.y_offset=-1                                 \
                          click_script="aerospace workspace $sid"           \
                          script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Invisible script holder that rebuilds the per-workspace app strips on both events.
# The problem it solves: every sketchybar item has exactly one script, and the
# space.$sid pills already use theirs for highlighting. So there was nothing
# subscribed to actually run the app-icons refresh when the events fire.
# This item fills that gap.
sketchybar --add item aerospace_workspace_apps left                        \
           --set aerospace_workspace_apps icon.drawing=off               \
                                 label.drawing=off                \
                                 background.drawing=off           \
                                 padding_left=0                   \
                                 padding_right=0                  \
                                 script="$PLUGIN_DIR/aerospace.sh" \
           --subscribe aerospace_workspace_apps aerospace_workspace_change \
                         aerospace_windows_change
