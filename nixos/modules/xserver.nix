{
  # Configure keymap in X11
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    layout = "fr";
    xkbVariant = "oss_nodeadkeys";

    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "mrgozxd";
      # Enable the GNOME Desktop Environment.
      gdm.enable = true;
      gnome.enable = true;
    };
  };
}