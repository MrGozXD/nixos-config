{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
    allowUnsupportedSystem = true; # Microsoft Teams
  };

  fonts.packages = with pkgs; [
    # meslolgs https://github.com/NixOS/nixpkgs/tree/master/pkgs/data/fonts/meslo-lgs-nf
    meslo-lgs-nf
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "NotoColorEmoji" ];
    };
  };

  environment.systemPackages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # dev
    nodejs_20
    bun
    astro-language-server
    chuck
    miniaudicle
    php

    #lsp
    nil
    nixfmt-rfc-style

    # python
    python3
    # pip3,pip,pip3.11
    python311Packages.pip
    # jupyter
    python311Packages.ipykernel

    # misc
    cowsay
    fortune
    unzip
    unar
    ffmpeg-full
    swww

    # CLI utils
    neofetch
    #zsh-powerlevel10k
    base16-shell-preview
    base16-schemes

    # services
    spotify
    vlc
    zotero_7
    vesktop # Discord/BetterDiscord

    # editor
    vscode.fhs
    obsidian
    texmaker

    # Wayland stuff
    xwayland # provides compatibility for native X11 applications
    wl-clipboard
    cliphist

    #other
    home-manager
  ];
}
