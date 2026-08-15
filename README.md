# NixOS Configuration

Personal NixOS + Home Manager configuration managed as a Nix flake.

## Structure

```
nixos/
├── flake.nix                        # Flake entry point (inputs & outputs)
├── flake.lock
│
├── hosts/                           # Host-specific configurations
│   ├── common.nix                   # Shared settings (locale, timezone, docker, flakes)
│   ├── laptop/
│   │   ├── default.nix              # Laptop host (imports common + pkgs)
│   │   └── hardware-configuration.nix
│   └── desktop/
│       ├── default.nix              # Desktop host (placeholder)
│       └── hardware-configuration.nix
│
├── modules/
│   ├── nixos/                       # NixOS system modules
│   │   ├── default.nix              # Imports all NixOS modules
│   │   ├── core/
│   │   │   ├── bootloader.nix
│   │   │   ├── bluetooth.nix
│   │   │   ├── networking.nix
│   │   │   ├── sound.nix
│   │   │   └── users.nix
│   │   ├── desktop/
│   │   │   ├── hyprland.nix         # Hyprland compositor (NixOS-level)
│   │   │   ├── xserver.nix
│   │   │   └── display-manager.nix
│   │   └── programs/
│   │       └── neovim.nix           # NVF-based Neovim config
│   │
│   └── home/                        # Home Manager modules
│       ├── default.nix              # Imports all home modules
│       ├── core/
│       │   ├── git.nix
│       │   ├── style.nix            # Stylix theming
│       │   └── shell/
│       │       ├── zsh.nix
│       │       └── zoxide.nix
│       ├── desktop/
│       │   ├── hyprland.nix         # Hyprland keybinds & settings
│       │   ├── waybar.nix
│       │   ├── wofi.nix
│       │   ├── rofi.nix
│       │   └── spicetify.nix
│       └── terminals/
│           ├── kitty.nix
│           └── alacritty.nix
│
├── home/
│   └── mrgozxd/
│       └── home.nix                 # User-level Home Manager entry point
│
├── pkgs/
│   └── default.nix                  # System packages & fonts
│
├── overlays/
│   └── default.nix
│
├── lib/
│   ├── default.nix
│   └── colors.nix                  # Centralized color palette
│
└── secrets/                         # Secrets (agenix/sops)
```

## How It Works

The configuration is split into two independent outputs defined in `flake.nix`:

- **`nixosConfigurations.mrgozxd`** — System-level config built with `nixpkgs.lib.nixosSystem`. The entry point is `hosts/laptop/default.nix`, which imports `hosts/common.nix` (shared settings) and `pkgs/` (system packages). Common then pulls in all modules under `modules/nixos/`.

- **`homeConfigurations.mrgozxd`** — User-level config built with `home-manager.lib.homeManagerConfiguration` (standalone, not a NixOS module). The entry point is `home/mrgozxd/home.nix`, which imports all modules under `modules/home/`.

### Flake Inputs

| Input | Purpose |
|---|---|
| `nixpkgs` (unstable) | Main package set |
| `nixpkgs-stable` | Stable packages when needed |
| `home-manager` | Dotfile & user config management |
| `hyprland` | Wayland compositor |
| `stylix` | System-wide theming |
| `catppuccin` | Catppuccin color scheme |
| `spicetify-nix` | Spotify customization |
| `nvf` | Neovim configuration framework |
| `noctalia` | Noctalia shell |

## Usage

```bash
# Rebuild NixOS system
sudo nixos-rebuild switch --flake .#mrgozxd

# Rebuild Home Manager
home-manager switch --flake .#mrgozxd

# Update all flake inputs
nix flake update

# Add a new host
# 1. Create hosts/<name>/default.nix and hardware-configuration.nix
# 2. Add a new nixosConfigurations.<name> entry in flake.nix
```

## Adding a Module

1. Create the module file in the appropriate directory (`modules/nixos/` or `modules/home/`).
2. Add its path to the corresponding `default.nix` imports list.

## Color Palette — Night Purple

All colors are defined in a single file — [`lib/colors.nix`](lib/colors.nix) — and passed to every module via `specialArgs`. This means changing one value updates Stylix, Hyprland, Niri, Waybar, Wofi, Rofi, and VS Code at once.

### Palette

| Role | Hex | Preview |
|---|---|---|
| Background | `#0F1117` | ![#0F1117](https://placehold.co/40x20/0F1117/0F1117) |
| Surface | `#161822` | ![#161822](https://placehold.co/40x20/161822/161822) |
| Selection | `#1E2030` | ![#1E2030](https://placehold.co/40x20/1E2030/1E2030) |
| Comment | `#3B4261` | ![#3B4261](https://placehold.co/40x20/3B4261/3B4261) |
| Line numbers | `#7982A9` | ![#7982A9](https://placehold.co/40x20/7982A9/7982A9) |
| Foreground | `#A9B1D6` | ![#A9B1D6](https://placehold.co/40x20/A9B1D6/A9B1D6) |
| Bright fg | `#C0CAF5` | ![#C0CAF5](https://placehold.co/40x20/C0CAF5/C0CAF5) |
| Red | `#F7768E` | ![#F7768E](https://placehold.co/40x20/F7768E/F7768E) |
| Orange | `#FF9E64` | ![#FF9E64](https://placehold.co/40x20/FF9E64/FF9E64) |
| Yellow | `#E0AF68` | ![#E0AF68](https://placehold.co/40x20/E0AF68/E0AF68) |
| Green | `#9ECE6A` | ![#9ECE6A](https://placehold.co/40x20/9ECE6A/9ECE6A) |
| Cyan | `#7DCFFF` | ![#7DCFFF](https://placehold.co/40x20/7DCFFF/7DCFFF) |
| Accent (purple) | `#B24EFF` | ![#B24EFF](https://placehold.co/40x20/B24EFF/B24EFF) |
| Lavender | `#BB9AF7` | ![#BB9AF7](https://placehold.co/40x20/BB9AF7/BB9AF7) |
| Rose | `#DB7093` | ![#DB7093](https://placehold.co/40x20/DB7093/DB7093) |

### Using Colors in a Module

Every module receives `colors` via `specialArgs`. Reference any color with string interpolation:

```nix
{ colors, ... }:
{
  # Use semantic names
  "col.active_border" = "rgba(''${colors.accent}FF)";

  # Or base16 keys (for Stylix compatibility)
  base16Scheme = {
    inherit (colors) base00 base01 base02 base03 base04 base05
      base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
  };
}
```

To change the entire system's look, edit `lib/colors.nix` and rebuild.
