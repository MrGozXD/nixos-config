# Nix-darwin Configuration for MacBook (aarch64)

Terminal-only configuration using flakes.

## Structure

```
nix-darwin/
├── flake.nix              # Entry point (inputs/outputs)
├── lib/colors.nix        # Color palette
├── hosts/macbook/default.nix  # System packages
└── modules/home/          # Home Manager modules
    ├── core/
    │   ├── style.nix      # Stylix theming
    │   ├── git.nix        # Git config
    │   └── shell/
    │       ├── zsh.nix    # Zsh + aliases
    │       └── zoxide.nix # Zoxide
    ├── programs/
    │   └── yazi.nix       # Yazi file manager
    └── terminals/
        └── kitty.nix       # Kitty terminal
```

## What's Included

- **Kitty** terminal with MesloLGS NF font
- **Zsh** with Oh My Zsh (agnoster), autosuggestions, syntax highlighting
- **Zoxide** for smart directory jumping
- **Yazi** file manager with custom theme
- **Git** with your settings and GitHub integration
- **Pokefetch** greeting script
- CLI tools: nodejs_20, bun, python3, nil, nixfmt, fastfetch, github-cli, cowsay, fortune, unzip, unar, ffmpeg, direnv, nix-direnv, pokeget-rs
- **Stylix** theming with your color palette

## Installation

### 1. Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

### 2. Enable flakes

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### 3. Install nix-darwin

Use the official installer (detects aarch64 automatically):

```bash
curl -L https://darwin.nix.community/install | sh
```

Or if that doesn't work, use:

```bash
nix profile install github:LnL7/nix-darwin
```

### 4. Install home-manager

```bash
nix profile install github:nix-community/home-manager
```

### 5. Switch to your configuration

```bash
# System
sudo darwin-rebuild switch --flake ~/nixos-config/nix-darwin#macbook

# Home
/home-manager switch --flake ~/nixos-config/nix-darwin#macbook
```

### 6. Use your aliases

```bash
rebuild    # Rebuild system
rb         # Same as rebuild
upg        # Rebuild with upgrade
hm         # Rebuild home manager
gc         # Garbage collect
```

## Update

```bash
nix flake update
sudo darwin-rebuild switch --flake ~/nixos-config/nix-darwin#macbook
home-manager switch --flake ~/nixos-config/nix-darwin#macbook
```
