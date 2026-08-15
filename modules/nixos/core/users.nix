{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.mrgozxd = {
      isNormalUser = true;
      description = "Mr Goz XD";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
        "docker"
      ];
      packages = with pkgs; [ vivaldi ];
    };
  };
}
