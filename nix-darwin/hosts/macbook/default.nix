{ pkgs, ... }:
{
  system.stateVersion = 7;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  fonts.packages = with pkgs; [ meslo-lgs-nf ];

  environment.systemPackages = with pkgs; [
    nodejs
    bun
    python3
    python3Packages.pip
    nil
    nixfmt
    fastfetch
    github-cli
    cowsay
    fortune
    unzip
    unar
    ffmpeg
    kitty
    zoxide
    yazi
    direnv
    nix-direnv
    pokeget-rs
    home-manager
  ];
}
