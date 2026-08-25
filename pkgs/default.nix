{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
    allowUnsupportedSystem = true;
  };

  fonts.packages = with pkgs; [ meslo-lgs-nf ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts.emoji = [ "NotoColorEmoji" ];
  };

  environment.systemPackages = with pkgs; [
    # Dev
    nodejs_20
    bun
    astro-language-server
    php
    docker-client
    opencode

    # LSP
    nil
    nixfmt

    # Python
    python3
    python3Packages.pip
    python3Packages.ipykernel

    # Misc
    sqlite
    cowsay
    fortune
    unzip
    unar
    ffmpeg-full
    pavucontrol

    # CLI
    fastfetch

    # Apps
    spotify
    vlc
    zotero
    vesktop

    # Editors
    vscode.fhs
    obsidian

    # Wayland
    xwayland
    wl-clipboard
    cliphist

    # Audio / Brightness
    pamixer
    brightnessctl

    # Niri
    niri

    # Other
    home-manager
    direnv
    nix-direnv
  ];
}
