{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    font.name = "MesloLGS NF";
    settings.enable_audio_bell = false;
  };
}
