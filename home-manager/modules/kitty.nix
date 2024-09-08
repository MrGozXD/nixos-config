{config,pkgs,lib,...}:
{
    programs.kitty = {
        enable = true;
        font.name = "MesloLGS NF";
        settings = {
            enable_audio_bell = false;
        };
        #catppuccin.enable = false;
    };
}