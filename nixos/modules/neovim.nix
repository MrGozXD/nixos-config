{pkgs, lib, ...}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {  
        
        telescope = {
          enable = true;
        };
        autocomplete.nvim-cmp = {
          enable = true;
        };
        languages = {
          enableLSP = true;
          nix.enable = true;
          ts.enable = true;
        };
      };
    };
  };
}