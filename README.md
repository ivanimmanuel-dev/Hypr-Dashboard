# Hypr-Dashboard

A Hyprland dashboard script that automatically arranges a set of terminal tools into a polished layout on your desktop — system monitor, audio visualizer, system info, and a Matrix rain effect.

## Preview

The dashboard tiles the following tools across Workspace 1:

| Panel | Tool | Description |
|---|---|---|
| Left | [btop](https://github.com/aristocratos/btop) | Resource monitor |
| Bottom | [GLava](https://github.com/jarcode-foss/glava) | Audio visualizer bar |
| Top Right | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| Bottom Right | [cmatrix](https://github.com/abishekvashok/cmatrix) | Matrix rain effect |

## Requirements

- [Hyprland](https://hyprland.org/) Wayland compositor
- The following packages (all available via `pacman`):
  - `kitty`
  - `glava`
  - `fastfetch`
  - `cmatrix`
  - `btop`
  - `konsole`

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/ivanimmanuel-dev/Hypr-Dashboard.git
   cd Hypr-Dashboard
   ```

2. Run the install script (installs dependencies and adds `hypr-dashboard` to your PATH):
   ```bash
   bash install.sh
   ```

## Usage

After installation, launch the dashboard from anywhere:

```bash
hypr-dashboard
```

Or run it directly without installing:

```bash
bash dashboard.sh
```

The script will switch to Workspace 1 and automatically open and arrange all panels.

## How It Works

`dashboard.sh` uses `hyprctl` to orchestrate the layout:

1. Switches to Workspace 1.
2. Opens **btop** in a Kitty terminal on the left.
3. Opens **GLava** as a thin audio visualizer bar at the bottom.
4. Opens **fastfetch** in a Kitty terminal at the top right.
5. Opens **cmatrix** in a Konsole terminal at the bottom right.
6. Resizes and repositions each window for a clean tiled appearance.

## License

This project is open source. Feel free to fork and customize it to fit your setup.
