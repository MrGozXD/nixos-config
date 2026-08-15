{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "fastfetch";

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#$(hostname)";
      rb = "rebuild";
      upg = "sudo nixos-rebuild switch --upgrade --flake ~/nixos#$(hostname)";
      gc = "nix-collect-garbage -d";
      hm = "home-manager switch --flake ~/nixos#$(hostname)";
      hms = "hm";

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
