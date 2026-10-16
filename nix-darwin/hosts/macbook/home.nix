{ pkgs, ... }:

{
  home.username = "yannisp";
  home.homeDirectory = "/Users/yannisp";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [ github-cli pokeget-rs ];

  home.sessionVariables = {
    EDITOR = "code";
    BROWSER = "Safari";
    TERMINAL = "kitty";
  };

  home.sessionPath = [ "$HOME/.bun/bin" "$HOME/.local/bin" ];

  home.file.".local/bin/pokefetch" = {
    source = ../../pokefetch.sh;
    executable = true;
  };
}
