{ lib, pkgs, inputs, colors, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.text;
    colorScheme = lib.mkForce "custom";
    customColorScheme = {
      text = colors.fg-bright;
      subtext = colors.accent;
      main = colors.bg;
      sidebar = colors.bg;
      player = colors.bg;
      card = colors.bg;
      shadow = colors.bg;
      main-secondary = colors.bg;
      button = colors.accent;
      button-secondary = colors.accent-soft;
      button-active = colors.accent;
      button-disabled = colors.fg-muted;
      tab-active = colors.bg;
      notification = colors.fg-muted;
      notification-error = colors.red;
      playback-bar = colors.accent;
      misc = colors.bg;
      selected-row = colors.accent;
      accent = colors.accent;
      accent-active = colors.accent-soft;
      accent-inactive = colors.fg-muted;
      banner = colors.accent;
      border-active = colors.accent;
      border-inactive = colors.fg-muted;
      highlight = colors.bg-highlight;
      header = colors.fg-muted;
    };
    enabledCustomApps = [ ];
    enabledExtensions = [ ];
  };
}
