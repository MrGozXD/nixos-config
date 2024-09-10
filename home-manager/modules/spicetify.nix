{
  config,
  pkgs,
  lib,
  spicetify-nix,
  ...
}:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.mrgozxd;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
  };
}
