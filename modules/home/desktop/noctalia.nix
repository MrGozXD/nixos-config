{ lib, pkgs, config, inputs, ... }:
let
  colors = import ../../../lib/colors.nix;
in
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

    # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce {
      # configure noctalia here
      bar = {
        density = "compact";
        position = "top";
        floating = false;
        showCapsule = false;
        showOutline = true;
        backgroundOpacity = 1.0;
        capsuleOpacity = 1.0;
        outerCorners = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Launcher";
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              alwaysShowPercentage = false;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      general = {
        avatarImage = "${config.home.homeDirectory}/Images/Wallpaper/GigantamaxEctoplasma.png";
        radiusRatio = 0;
        boxRadiusRatio = 0;
        iRadiusRatio = 0;
        enableShadows = false;
        lockOnSuspend = true;
        compactLockScreen = false;
      };
      ui = {
        boxBorderEnabled = true;
        panelBackgroundOpacity = 1.0;
        panelsAttachedToBar = true;
      };
      wallpaper = {
        enabled = true;
        directory = "${config.home.homeDirectory}/Images/Wallpaper";
      };
      location = {
        monthBeforeDay = true;
        name = "Lyon, France";
      };

      # controlbar on top
    };

    colors = lib.mkForce {
      mPrimary = "#${colors.accent}";
      mOnPrimary = "#${colors.bg}";
      mSecondary = "#${colors.accent-soft}";
      mOnSecondary = "#${colors.bg}";
      mTertiary = "#${colors.cyan}";
      mOnTertiary = "#${colors.bg}";
      mError = "#${colors.red}";
      mOnError = "#${colors.bg}";
      mSurface = "#${colors.bg}";
      mOnSurface = "#${colors.fg}";
      mSurfaceVariant = "#${colors.bg-surface}";
      mOnSurfaceVariant = "#${colors.base04}";
      mOutline = "#${colors.bg-highlight}";
      mShadow = "#${colors.bg}";
      mHover = "#${colors.cyan}";
      mOnHover = "#${colors.bg}";
    };
  };
}
