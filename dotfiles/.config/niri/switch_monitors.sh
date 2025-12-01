#!/usr/bin/env bash
# ~/.config/niri/switch_monitors.sh
# 切换 Niri 下显示模式：内屏 → 外屏 → 扩展

STATE_FILE="/tmp/niri_monitor_mode"
INTERNAL="eDP-1"
EXTERNAL="DP-1"

MODES=("internal_only" "external_only" "extended")

# 读取上次模式
if [[ -f "$STATE_FILE" ]]; then
  LAST_MODE=$(cat "$STATE_FILE")
else
  LAST_MODE="extended"
fi

# 下一个模式
NEXT_INDEX=0
for i in "${!MODES[@]}"; do
  if [[ "${MODES[$i]}" == "$LAST_MODE" ]]; then
    NEXT_INDEX=$(((i + 1) % ${#MODES[@]}))
    break
  fi
done
NEXT_MODE="${MODES[$NEXT_INDEX]}"

# 应用模式
case "$NEXT_MODE" in
internal_only)
  wlr-randr --output "$EXTERNAL" --off
  wlr-randr --output "$INTERNAL" --on --mode 2560x1600 --pos 0,0 --scale 1.25
  notify-send "显示模式" "仅内屏"
  ;;
external_only)
  wlr-randr --output "$EXTERNAL" --on --mode 2560x1440@144 --pos 0,0 --scale 1.25
  wlr-randr --output "$INTERNAL" --off
  notify-send "显示模式" "仅外屏"
  ;;
extended)
  wlr-randr --output "$INTERNAL" --on
  notify-send "显示模式" "扩展模式"
  ;;
esac

echo "$NEXT_MODE" > "$STATE_FILE"

# 刷新 Niri 布局（防止残影）
sleep 0.5
niri msg reload-layout >/dev/null 2>&1 || true
pkill swayosd-server
(swayosd-server &>/dev/null &)
