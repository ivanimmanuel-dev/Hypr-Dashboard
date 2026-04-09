#!/bin/bash
set -e
exec >/dev/null 2>&1

# ------------------------------------------------------------------------------------------------------------------------------
#                                                           Hyprland Dashboard Script
# ------------------------------------------------------------------------------------------------------------------------------


# --------------------------------------------------- Dependency Check ----------------------------------------------
for cmd in kitty glava fastfetch cmatrix hyprctl btop konsole; do
    command -v $cmd >/dev/null 2>&1 || { echo "$cmd is not installed. Exiting."; exit 1; }
done

# --------------------------------------------------------- WAIT Helper --------------------------------------------------
wait_for_window() {
    local title="$1"
    while ! hyprctl clients | grep -q "$title"; do
        sleep 0.1
    done
}

# ---------------------------------------- 1. Ensure we start on Workspace 1 -----------------------------------
hyprctl dispatch workspace 1
sleep 0.4

# -------------------------------------------- 2. Launch BTOP (Left Panel) -----------------------------------------
kitty --title btop -e btop &
wait_for_window "btop"
hyprctl dispatch focuswindow title:btop
sleep 0.4

# --------------------------------------- 3. Launch GLAVA (Bottom Visualizer) ---------------------------------
hyprctl dispatch layoutmsg preselect d
glava &
wait_for_window "GLava"
sleep 0.2

# --------------------------------------- 4. Squish GLAVA: shrink it to thin bar ---------------------------------
hyprctl dispatch focuswindow title:btop
hyprctl dispatch resizeactive 0 300
sleep 0.4

# ------------------------------------------- 5. Launch FASTFETCH (Top Right) -----------------------------------
kitty --title fetch \
  -o "shell_integration=disabled" \
  -o "cursor=#000000" \
  -o "cursor_text_color=#000000" \
  -o "cursor_blink_interval=0" \
  -o "enable_audio_bell=no" \
  -e sh -c "sleep 1.2; fastfetch; tail -f /dev/null" &
  sleep 0.2
wait_for_window "fetch"
hyprctl dispatch focuswindow title:fetch
hyprctl dispatch layoutmsg preselect d

# ------------------------------------------ 6. Launch KONSOLE (Bottom Right) ---------------------------------
konsole --title cmatrix -e sh -c "sleep 1.2; cmatrix" &
wait_for_window "konsole"
sleep 0.2
hyprctl dispatch focuswindow title:cmatrix
hyprctl dispatch resizeactive 0 90
sleep 0.2

# ------------------------------------------------------ 7. Final Alignment ----------------------------------------------
hyprctl dispatch focuswindow title:btop
sleep 0.2
hyprctl dispatch resizeactive -30 0
