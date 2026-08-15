{ ... }:
{
  programs.nvf = {
    enable = true;
    settings.vim = {
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      languages = {
        enableLSP = true;
        nix = {
          enable = true;
          format = {
            enable = true;
            type = "nixfmt";
          };
        };
        ts.enable = true;
      };
    };
  };
}
