# TODO: Generate with nixos-generate-config for your desktop machine
{ lib, ... }:
{
  imports = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
