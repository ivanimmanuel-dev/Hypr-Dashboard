#!/bin/bash
set -e

# Installs the necessary dependencies for the dashboard
echo "Installing dependencies..."
sudo pacman -Syu --needed kitty glava fastfetch cmatrix hyprctl btop konsole

# Checks if dashboard script exits
if [[ ! -f dashboard.sh ]]; then
    echo "dashboard.sh not found in this folder. Please run this from the folder containing the script."
    exit 1
fi

# Copies script and makes it an exectuable
echo "Copying dashboard.sh to /usr/local/bin as 'hypr-dashboard'..."
sudo cp dashboard.sh /usr/local/bin/hypr-dashboard
sudo chmod +x /usr/local/bin/hypr-dashboard

echo "Done! Run 'hypr-dashboard' to launch."
