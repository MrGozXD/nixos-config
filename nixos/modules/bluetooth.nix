{ pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot =true;
    package = pkgs.bluez5;
    settings.General = {
      Experimental = true;
      FastConnectable = true;
    };
  };
  services.blueman.enable = true;
}