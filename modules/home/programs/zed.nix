{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
{
  programs.zed-editor = {
    enable = true;

    # Use zed-editor from nixpkgs
    package = pkgs.zed-editor;

    # Install a few useful extensions by default
    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    # Install the remote server binary for remote connections
    installRemoteServer = true;

    # Provide common language tooling for LSPs inside the FHS sandbox if needed
    extraPackages = with pkgs; [
      rust-analyzer
      rustfmt
      nodejs
    ];

    # Override the default theme setting to avoid duplicate definition warnings
    userSettings = lib.mkForce {
      load_direnv = "shell_hook"; # allow direnv to provide project shells
      vim_mode = false;
      theme = {
        mode = "dark";
      };
    };
  };
}
