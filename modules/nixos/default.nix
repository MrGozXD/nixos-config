{
  imports = [
    ./core/bootloader.nix
    ./core/bluetooth.nix
    ./core/sound.nix
    ./core/users.nix
    ./core/networking.nix
    ./desktop/niri.nix
    ./desktop/xserver.nix
    ./desktop/display-manager.nix
    ./programs/neovim.nix
  ];
}
