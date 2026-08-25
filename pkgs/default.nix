{ pkgs, pkgs-stable, ... }:
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
    chuck
    pkgs-stable.miniaudicle
    php
    docker-client
    opencode

    # LSP
    nil
    nixfmt-rfc-style

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
    swww
    pavucontrol

    # CLI
    fastfetch
    base16-shell-preview
    base16-schemes
    argyllcms

    # Apps
    spotify
    vlc
    zotero
    vesktop

    # Editors
    vscode.fhs
    obsidian
    texmaker

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
