{
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "oss_nodeadkeys";

    displayManager = {
      #autoLogin.enable = true;
      #autoLogin.user = "mrgozxd";
      # Enable the GNOME Desktop Environment.
      gdm.enable = true;

    };

    desktopManager = {
      # Enable the GNOME Desktop Environment.
      gnome.enable = true;

    };
  };
}
