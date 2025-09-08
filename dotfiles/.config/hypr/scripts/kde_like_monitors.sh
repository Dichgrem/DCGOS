#!/bin/bash

STATE_FILE="/tmp/hypr_monitor_mode"
INTERNAL="eDP-1"
EXTERNAL="DP-1"

# 预设模式参数
INT_RES="2560x1600@165,0x0,1.25"
EXT_RES="2560x1440@144,2560x0,1.25"
MIRROR_RES="2560x1440@144,0x0,1.25"

# 模式顺序：内屏 → 外屏 → 扩展
MODES=("internal_only" "external_only" "extended")

# 读取上次模式
if [[ -f "$STATE_FILE" ]]; then
  LAST_MODE=$(cat "$STATE_FILE")
else
  LAST_MODE="extended"
fi

# 找出下一个模式
NEXT_INDEX=0
for i in "${!MODES[@]}"; do
  if [[ "${MODES[$i]}" == "$LAST_MODE" ]]; then
    NEXT_INDEX=$(((i + 1) % ${#MODES[@]}))
    break
  fi
done
NEXT_MODE="${MODES[$NEXT_INDEX]}"

# 应用新模式
case "$NEXT_MODE" in
internal_only)
  hyprctl keyword monitor "$EXTERNAL,disable"
  hyprctl keyword monitor "$INTERNAL,$INT_RES"
  notify-send "显示模式" "仅内屏"
  ;;
external_only)
  hyprctl keyword monitor "$INTERNAL,disable"
  hyprctl keyword monitor "$EXTERNAL,$EXT_RES"
  notify-send "显示模式" "仅外屏"
  ;;
extended)
  hyprctl keyword monitor "$INTERNAL,$INT_RES"
  hyprctl keyword monitor "$EXTERNAL,$EXT_RES"
  notify-send "显示模式" "扩展模式"
  ;;
esac

# 保存新模式
echo "$NEXT_MODE" >"$STATE_FILE"
