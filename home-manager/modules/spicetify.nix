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
  imports = [ spicetify-nix.homeManagerModules.default ];
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
      subtext = "C0CAF5";
      nav-active-text = "2AC3DE";
      main = "171D23";
      sidebar = "1D252C";
      player = "1D252C";
      card = "1D252C";
      shadow = "1D252C";
      main-secondary = "1D252C";
      button = "2AC3DE";
      button-secondary = "A9B1D6";
      button-active = "2AC3DE";
      button-disabled = "A9B1D6";
      nav-active = "27384E";
      play-button = "A9B1D6";
      tab-active = "27384E";
      notification = "414868";
      notification-error = "FF0000";
      playback-bar = "2AC3DE";
      misc = "000000";
    };
    #theme = "Material Theme";
  };

}
