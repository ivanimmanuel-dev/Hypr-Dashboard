#!/bin/bash
set -e

echo "Installing dependencies..."
sudo pacman -Syu --needed kitty glava fastfetch cmatrix hyprctl btop konsole

sudo cp dashboard.sh /usr/local/bin/hypr-dashboard
sudo chmod +x /usr/local/bin/hypr-dashboard

echo "Done! Run 'hypr-dashboard' to launch."
