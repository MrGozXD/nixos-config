{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "fastfetch";

    shellAliases = let flakeDir = "${config.home.homeDirectory}/nixos/.#mrgozxd"; in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
      gc = "nix-collect-garbage -d";
      hms = "home-manager switch --flake ${flakeDir}";

      ll = "ls -l";
      la = "ls -la";
      # Git
      g = "git";
      gs = "git status";
      ga = "git add";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gco = "git checkout";
      gb = "git branch";
      gcl = "git clone";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" ];
      theme = "agnoster";
    };
  };
}
