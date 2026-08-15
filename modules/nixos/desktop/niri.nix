{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.niri ];
  services.displayManager.sessionPackages = [ pkgs.niri ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
