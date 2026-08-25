# Copilot Instructions

## Build Commands

```bash
# Rebuild NixOS system (hosts: laptop, asus)
sudo nixos-rebuild switch --flake .#laptop
sudo nixos-rebuild switch --flake .#asus

# Rebuild Home Manager (standalone, not a NixOS module)
home-manager switch --flake .#laptop
home-manager switch --flake .#asus

# Zsh aliases handle hostname detection automatically (from ~/nixos)
rebuild    # system
hm         # home manager

# Update all flake inputs
nix flake update

# Check flake evaluates without errors
nix flake check
```

## Architecture

This is a NixOS + Home Manager flake with per-host outputs defined in `flake.nix`:

- **`nixosConfigurations.laptop`** and **`nixosConfigurations.asus`** — System configs. Entry point: `hosts/<host>/default.nix` → imports `hardware-configuration.nix`, `hosts/common.nix` (shared settings) and `pkgs/` (system packages). `common.nix` imports all of `modules/nixos/`.
  - A third host directory `hosts/desktop/` exists but is **not yet wired** into `flake.nix`.
- **`homeConfigurations.laptop`** and **`homeConfigurations.asus`** — Standalone Home Manager configs (not NixOS modules). Entry point: `home/mrgozxd/home.nix` → imports `modules/home/`.

The NixOS config passes `specialArgs = { inputs, system, colors }`. Home Manager passes `extraSpecialArgs = { inputs, system, colors, hostName }`. Modules receive these as function parameters.

## Key Conventions

**Module pattern**: Modules are plain configuration — they set standard NixOS/Home Manager options directly (e.g., `programs.git.enable = true`). No custom module options are defined. Each module file is a function taking `{ pkgs, inputs, colors, ... }` or similar and returning an attribute set of config.

**Adding a module**: Create the `.nix` file in the appropriate subdirectory under `modules/nixos/` or `modules/home/`, then add its path to the `imports` list in the corresponding `default.nix`. Check `default.nix` before assuming a file is active — unimported files are dead code.

**Adding a host**: Create `hosts/<name>/default.nix` and `hardware-configuration.nix`, then add a new `nixosConfigurations.<name>` (and matching `homeConfigurations.<name>`) entry in `flake.nix`.

**System packages**: All system-level packages and fonts are declared in `pkgs/default.nix`, not scattered across modules.

**Desktop stack**: Niri compositor + Noctalia shell + GDM (autologin, boots straight into niri). Hyprland was removed — don't reintroduce it without asking.

**Theming**: All colors live in `lib/colors.nix` ("Night Purple" palette) and are passed to every module via `specialArgs`/`extraSpecialArgs` as `colors`. Stylix handles system-wide theming (home module); Catppuccin is applied at both NixOS and Home Manager levels via their respective module imports in `flake.nix`.

**Host-specific config**: Use the `hostName` argument for per-host variations.

**Neovim**: Configured via NVF (Neovim Flake framework) in `modules/nixos/programs/neovim.nix`, not through Home Manager's `programs.neovim`.
