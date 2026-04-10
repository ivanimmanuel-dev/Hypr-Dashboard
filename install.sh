#!/bin/bash
set -e
#-----------------------------------------------------------------------------------------------------------------------------------------------
#                                                                   INSTALLER SCRIPT
#-----------------------------------------------------------------------------------------------------------------------------------------------

# Installs the necessary dependencies for the dashboard
echo "Installing dependencies..."

sudo pacman -Syu --needed kitty fastfetch tty-clock btop

if command -v yay >/dev/null 2>&1; then
    yay -S glava
else
    echo "yay not found. Please install glava manually: https://github.com/jarcode-foss/glava"
fi

# Checks if dashboard script exists
if [[ ! -f dashboard.sh ]]; then
    echo "dashboard.sh not found in this folder. Please run this from the folder containing the script."
    exit 1
fi

# Copies script and makes it an exectuable
echo "Copying dashboard.sh to /usr/local/bin as 'hypr-dashboard'..."
sudo cp dashboard.sh /usr/local/bin/hypr-dashboard
sudo chmod +x /usr/local/bin/hypr-dashboard

echo "Done! Run 'hypr-dashboard' to launch."
