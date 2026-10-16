{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "${pkgs.bash}/bin/bash $HOME/.local/bin/pokefetch";

    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/nixos-config/nix-darwin#macbook";
      rb = "rebuild";
      upg = "sudo darwin-rebuild switch --upgrade --flake ~/nixos-config/nix-darwin#macbook";
      gc = "nix-collect-garbage -d";
      hm = "home-manager switch --flake ~/nixos-config/nix-darwin#macbook";
      hms = "hm";
      ll = "ls -l";
      la = "ls -la";
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
