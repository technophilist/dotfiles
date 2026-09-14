#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Styles this pill as active (white bg, dark text) when $1 is the focused workspace,
# or muted otherwise, so the current space always stands out.
if [ -n "$1" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=$ACTIVE_COLOR \
                           label.color=$ACTIVE_TEXT_COLOR \
                           icon.color=$ACTIVE_TEXT_COLOR
  else
    sketchybar --set $NAME background.drawing=on \
                           background.color=$ITEM_BG_COLOR \
                           label.color=$TEXT_COLOR \
                           icon.color=$TEXT_COLOR
  fi
  exit 0
fi

# Refreshes every pill's label with the app icons currently on that workspace, so a
# window moved/opened/closed on any space is reflected even when that space isn't focused.
if [ "$SENDER" = "aerospace_workspace_change" ] || [ "$SENDER" = "aerospace_windows_change" ]; then
  for ws in $(aerospace list-workspaces --all); do
    apps="$(aerospace list-windows --workspace "$ws" --format '%{app-name}' | sort -u)"

    icon_strip=" "
    if [ -n "${apps}" ]; then
      while read -r app
      do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
      done <<< "${apps}"
    else
      icon_strip=" —"
    fi

    sketchybar --set space.$ws label="$icon_strip"
  done
fi
