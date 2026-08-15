{ pkgs, colors, ... }:
let
  themeJSON = builtins.toJSON {
    accentFromPage = false;
    accentOnWindow = false;
    accentSaturationLimit = 1;
    alpha = 1;
    backgroundImage = "";
    backgroundPosition = "stretch";
    blur = 0;
    colorAccentBg = "#${colors.bg-surface}";
    colorBg = "#${colors.bg}";
    colorFg = "#${colors.fg}";
    colorHighlightBg = "#${colors.accent}";
    colorWindowBg = "#${colors.bg}";
    contrast = 0;
    dimBlurred = false;
    engineVersion = 1;
    id = "0825ba3e-3267-4a3c-8c53-c9386b9a29ac";
    name = "Night Purple";
    preferSystemAccent = false;
    radius = 0;
    simpleScrollbar = true;
    transparencyTabBar = false;
    transparencyTabs = false;
    url = "";
    version = 1;
  };

  themeZip = pkgs.runCommand "vivaldi-night-purple-theme" {
    nativeBuildInputs = [ pkgs.zip ];
  } ''
    mkdir -p tmp
    echo '${themeJSON}' > tmp/settings.json
    mkdir -p $out
    cd tmp && zip $out/night-purple.zip settings.json
  '';
in
{
  home.file.".config/vivaldi-themes/night-purple.zip".source = "${themeZip}/night-purple.zip";
}
