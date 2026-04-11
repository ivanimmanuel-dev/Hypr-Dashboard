# Hypr-Dashboard

A Hyprland dashboard script that automatically arranges a set of terminal tools into a polished layout on your desktop — system monitor, audio visualizer, system info, and a clock.

<div align="center">

![Hypr-Dashboard](https://github.com/user-attachments/assets/279f2cb9-f749-4549-97cc-d2b4d2755318)


</div>

## Preview

The dashboard tiles the following tools across Workspace 1:

| Panel | Tool | Description |
|---|---|---|
| Left | [btop](https://github.com/aristocratos/btop) | Resource monitor |
| Bottom | [GLava](https://github.com/jarcode-foss/glava) | Audio visualizer bar |
| Top Right | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| Bottom Right | [tty-clock](https://github.com/xorg62/tty-clock) | Terminal clock |

## Requirements

> ⚠️ This script is designed for **Arch Linux** only.

- [Hyprland](https://hyprland.org/) Wayland compositor
- [yay](https://github.com/Jguer/yay) AUR helper (for glava and tty-clock)
- The following packages:
  - `kitty` — terminal emulator
  - `btop` — resource monitor
  - `fastfetch` — system info
  - `glava` — audio visualizer (AUR)
  - `tty-clock` — terminal clock (AUR)

## Installation


### AUR (Recommended)
```bash
yay -S hypr-dashboard
```

### Manual

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
5. Opens **tty-clock** in a Kitty terminal at the bottom right.
6. Resizes and repositions each window for a clean tiled appearance.

## License

MIT License — feel free to fork and customize it to fit your setup.
