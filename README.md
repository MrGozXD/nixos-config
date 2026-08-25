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
│   ├── asus/
│   │   ├── default.nix              # Asus host (imports common + pkgs)
│   │   └── hardware-configuration.nix
│   └── desktop/
│       ├── default.nix              # Desktop host (placeholder, not wired into flake)
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
│   │   │   ├── niri.nix             # Niri compositor (NixOS-level)
│   │   │   ├── xserver.nix
│   │   │   └── display-manager.nix  # GDM + autologin, boots straight into niri
│   │   └── programs/
│   │       └── neovim.nix           # NVF-based Neovim config
│   │
│   └── home/                        # Home Manager modules
│       ├── default.nix              # Imports all home modules
│       ├── core/
│       │   ├── git.nix
│       │   ├── style.nix            # Stylix theming
│       │   ├── vscode-theme.nix
│       │   └── shell/
│       │       ├── zsh.nix          # Zsh + pokefetch greeting
│       │       └── zoxide.nix
│       ├── desktop/
│       │   ├── niri.nix             # Niri keybinds & settings
│       │   ├── noctalia.nix         # Noctalia shell desktop
│       │   ├── wofi.nix
│       │   ├── spicetify.nix
│       │   ├── vencord-theme.nix
│       │   ├── obsidian-theme.nix
│       │   └── vivaldi-theme.nix
│       ├── programs/
│       │   ├── zed.nix
│       │   └── zed-theme.nix
│       └── terminals/
│           └── kitty.nix
│
├── home/
│   └── mrgozxd/
│       └── home.nix                 # User-level Home Manager entry point
│                                    # + ~/.local/bin scripts (pokefetch, new-rust-project)
│
├── pkgs/
│   └── default.nix                  # System packages & fonts
│
├── lib/
│   └── colors.nix                   # Centralized color palette
│
├── assets/
│   └── wallpapers/
│
└── dev/                             # Dev shells (cpp, java, rust templates)
```

## How It Works

The configuration is split into two independent sets of outputs defined in `flake.nix`, one per host (`laptop`, `asus`):

- **`nixosConfigurations.<host>`** — System-level config built with `nixpkgs.lib.nixosSystem`. Entry point: `hosts/<host>/default.nix` → imports `hosts/common.nix` (shared settings) and `pkgs/` (system packages). Common pulls in all modules under `modules/nixos/`. (A third host, `desktop`, exists under `hosts/` but is not yet wired into the flake.)

- **`homeConfigurations.<host>`** — User-level config built with `home-manager.lib.homeManagerConfiguration` (standalone, not a NixOS module). Entry point: `home/mrgozxd/home.nix`, which imports all modules under `modules/home/`.

Modules receive `{ inputs, system, colors }` via `specialArgs` (NixOS) and `{ inputs, system, colors, hostName }` via `extraSpecialArgs` (Home Manager).

### Flake Inputs

| Input | Purpose |
|---|---|
| `nixpkgs` (unstable) | Main package set |
| `home-manager` | Dotfile & user config management |
| `stylix` | System-wide theming |
| `catppuccin` | Catppuccin color scheme |
| `spicetify-nix` | Spotify customization |
| `nvf` | Neovim configuration framework |
| `noctalia` | Noctalia shell |
| `zed` | Zed editor (official flake) |

## Usage

```bash
# Rebuild NixOS system
sudo nixos-rebuild switch --flake ~/nixos#laptop
sudo nixos-rebuild switch --flake ~/nixos#asus

# Rebuild Home Manager
home-manager switch --flake ~/nixos#laptop
home-manager switch --flake ~/nixos#asus

# Or with the zsh aliases (from any directory, hostname auto-detected)
rebuild    # system
hm         # home manager
upg        # system + upgrade inputs
gc         # garbage collect

# Update all flake inputs
nix flake update
```

## Adding a Module

1. Create the module file in the appropriate directory (`modules/nixos/` or `modules/home/`).
2. Add its path to the corresponding `default.nix` imports list.

## Color Palette — Night Purple

All colors are defined in a single file — [`lib/colors.nix`](lib/colors.nix) — and passed to every module via `specialArgs`. This means changing one value updates Stylix, Niri, Wofi, VS Code, and Zed at once.

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
  active-color = "#${colors.accent}";

  # Or base16 keys (for Stylix compatibility)
  base16Scheme = {
    inherit (colors) base00 base01 base02 base03 base04 base05
      base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
  };
}
```

To change the entire system's look, edit `lib/colors.nix` and rebuild.
