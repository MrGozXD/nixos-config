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
      "$HOME/.local/bin"
      "$HOME/nixos/dev"
    ];
    sessionVariables = {
      EDITOR = "code";
      BROWSER = "vivaldi";
      TERMINAL = "kitty";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };
    stateVersion = "23.11";

    file.".local/bin/new-rust-project" = {
      text = ''
        #!/usr/bin/env bash
        set -euo pipefail
        exec /home/mrgozxd/nixos/dev/new-rust-project.sh "$@"
      '';
      executable = true;
    };
  };
}
