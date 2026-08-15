{ ... }:
{
  imports = [
    ../../modules/home
  ];

  xsession.numlock.enable = true;

  home = {
    username = "mrgozxd";
    homeDirectory = "/home/mrgozxd";
    sessionPath = [
      "$HOME/.bun/bin"
    ];
    sessionVariables = {
      EDITOR = "code";
      BROWSER = "vivaldi";
      TERMINAL = "kitty";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };
    stateVersion = "23.11";
  };
}
