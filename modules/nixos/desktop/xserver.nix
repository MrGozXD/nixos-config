{
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "oss_nodeadkeys";
  };
  services.desktopManager.gnome.enable = true;
}
