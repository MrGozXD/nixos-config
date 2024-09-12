{
  config,
  lib,
  pkgs,
  spicetify-nix,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    customColorScheme = {
      text = "A9B1D6";
      subtext = "B62D65"; # -- Light Magenta
      nav-active-text = "2AC3DE"; # -- Light Cyan
      main = "171D23"; # -- Dark Charcoal
      sidebar = "1D252C"; # -- Dark Slate Grey
      player = "1D252C"; # -- Dark Slate Grey
      card = "1D252C"; # -- Dark Slate Grey
      shadow = "1D252C"; # -- Dark Slate Grey
      main-secondary = "1D252C"; # -- Dark Slate Grey
      button = "B62D65";
      button-secondary = "B62D65";
      button-active = "B62D65";
      button-disabled = "B62D65";
      nav-active = "27384E";
      play-button = "B62D65";
      tab-active = "27384E";
      notification = "414868";
      notification-error = "FF0000";
      playback-bar = "B62D65";
      misc = "000000";
    };
    #theme = "Material Theme";
  };

}
