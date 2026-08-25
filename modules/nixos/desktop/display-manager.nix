{
  services.displayManager = {
    gdm.enable = true;

    # Boot straight into the session; Noctalia's lock screen takes over on start
    autoLogin = {
      enable = true;
      user = "mrgozxd";
    };
    defaultSession = "niri";
  };
}
