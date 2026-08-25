{ colors, ... }:
{
  stylix = {
    enable = true;
    image = ./../../../assets/wallpapers/GigantamaxEctoplasma.png;
    polarity = "dark";
    opacity = {
      desktop = 0.5;
      terminal = 0.5;
      applications = 0.5;
    };
    base16Scheme = {
      inherit (colors)
        base00
        base01
        base02
        base03
        base04
        base05
        base06
        base07
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        base0F
        ;
    };
    targets.gtk.enable = true;
    targets.kitty.enable = true;
    autoEnable = true;
  };

  gtk.enable = true;
  qt.enable = true;
}
