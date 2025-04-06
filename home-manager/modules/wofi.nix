{ config, pkgs, ... }: {
  # Enable Wofi as a launcher for applications and a menu for window management.
  # Use this and not Rofi, as Wofi is more integrated with Wayland.
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 300;
      always_parse_args = true;
      show_all = false;
      print_command = true;
      insensitive = true;
      allow-images = true;
    };
    style = {
    "
     * {
        background-color: #201A41;
        border-radius: 15px;
        font-family: JetBrains Mono;
        font-weight: bold;
        min-height: 20px;
      }
    "
    };
  };
}
