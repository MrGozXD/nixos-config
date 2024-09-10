{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  /*
    catppuccin = {
    		enable = true;
    		flavor = "mocha";
    		accent = "mauve";
    		pointerCursor = {
    			enable = true;
    		};
    	};
  */
  stylix = {
    enable = true;
    image = /home/mrgozxd/Images/Wallpaper/GigantamaxEctoplasma.png;
    polarity = "dark";
    /*
      base16Scheme = {
        base00 = "16161E";
        base01 = "1A1B26";
        base02 = "2F3549";
        base03 = "444B6A";
        base04 = "b0b5cf";
        base05 = "b0b5cf";
        base06 = "CBCCD1";
        base07 = "D5D6DB";
        base08 = "F7768E";
        base09 = "FF9E64";
        base0A = "E0AF68";
        base0B = "41A6B5";
        base0C = "7DCFFF";
        base0D = "7AA2F7";
        base0E = "BB9AF7";
        base0F = "D18616";
      };
    */
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    base16Scheme = {
      base00 = "171D23";
      base01 = "1D252C";
      base02 = "28323A";
      base03 = "526270";
      base04 = "b0b5cf";
      base05 = "b0b5cf";
      base06 = "F6F6F8";
      base07 = "FBFBFD";
      base08 = "D95468";
      base09 = "FF9E64";
      base0A = "EBBF83";
      base0B = "8BD49C";
      base0C = "70E1E8";
      base0D = "539AFC";
      base0E = "B62D65";
      base0F = "DD9D82";
    };

    targets.hyprland.enable = false; # hyprpaper bug, wait for mix
    targets.gtk.enable = true;

    autoEnable = true;

  };

  gtk = {
    enable = true;
    #cursorTheme.package = pkgs.bibata-cursors;
    #cursorTheme.name = "Bibata-Modern-Ice";

    /*
      catppuccin = {
      			enable = true;
      			flavor = "mocha";
      			accent = "mauve";
      			icon = {
      				enable = true;
      				accent = "mauve";
      			};
      			tweaks = [];
      		};
    */

  };

  qt = {
    enable = true;
    #style.name = "kvantum";
    #platformTheme.name = "kvantum";

  };
}
