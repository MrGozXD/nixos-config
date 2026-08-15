{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
    ../../pkgs
  ];
  networking.hostName = "asus";
}
