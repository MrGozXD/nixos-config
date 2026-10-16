{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    font.name = "MesloLGS NF";
    settings = {
      enable_audio_bell = false;
      initial_window_width = 120;
      initial_window_height = 35;
    };
  };
}
