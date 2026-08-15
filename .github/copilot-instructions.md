# Copilot Instructions

## Build Commands

```bash
# Rebuild NixOS system
sudo nixos-rebuild switch --flake .#mrgozxd

# Rebuild Home Manager (standalone, not a NixOS module)
home-manager switch --flake .#mrgozxd

# Update all flake inputs
nix flake update

# Check flake evaluates without errors
nix flake check
```

## Architecture

This is a NixOS + Home Manager flake with two independent outputs in `flake.nix`:

- **`nixosConfigurations.mrgozxd`** — System config. Entry point: `hosts/laptop/default.nix` → imports `hosts/common.nix` (shared settings) → imports `modules/nixos/` (all system modules) and `pkgs/` (system packages).
- **`homeConfigurations.mrgozxd`** — Standalone Home Manager config (not a NixOS module). Entry point: `home/mrgozxd/home.nix` → imports `modules/home/` (all home modules).

The NixOS config passes `specialArgs = { pkgs-stable, inputs, system }` and Home Manager passes `extraSpecialArgs = { inputs, system }`. Modules receive these as function parameters.

## Key Conventions

**Module pattern**: Modules are plain configuration — they set standard NixOS/Home Manager options directly (e.g., `programs.git.enable = true`). No custom module options are defined. Each module file is a function taking `{ pkgs, inputs, ... }` or similar and returning an attribute set of config.

**Adding a module**: Create the `.nix` file in the appropriate subdirectory under `modules/nixos/` or `modules/home/`, then add its path to the `imports` list in the corresponding `default.nix`.

**Adding a host**: Create `hosts/<name>/default.nix` and `hardware-configuration.nix`, then add a new `nixosConfigurations.<name>` entry in `flake.nix`.

**System packages**: All system-level packages and fonts are declared in `pkgs/default.nix`, not scattered across modules.

**Theming**: Stylix handles system-wide theming (home module), Catppuccin is applied at both NixOS and Home Manager levels via their respective module imports in `flake.nix`.

**Neovim**: Configured via NVF (Neovim Flake framework) in `modules/nixos/programs/neovim.nix`, not through Home Manager's `programs.neovim`.
