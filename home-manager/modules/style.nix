{config,pkgs,lib,...}:
{
    /* catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
        pointerCursor = {
            enable = true;   
        };
    }; */
    

    gtk = {
        enable = true;
        #cursorTheme.package = pkgs.bibata-cursors;
        #cursorTheme.name = "Bibata-Modern-Ice";

        /* catppuccin = {
            enable = true;
            flavor = "mocha";
            accent = "mauve";
            icon = {
                enable = true;
                accent = "mauve";
            };
            tweaks = [];
        }; */


    };

    qt = {
        enable = true;
        #style.name = "kvantum";
        #platformTheme.name = "kvantum";
        
    };
}