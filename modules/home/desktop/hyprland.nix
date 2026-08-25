{
  config,
  colors,
  hostName ? "laptop",
  ...
}:
let
  monitors =
    if hostName == "asus" then
      [
        ",preferred,auto,1"
        "HDMI-A-1,1920x1080@60,-1920x0,1"
      ]
    else
      [
        "eDP-1,1920x1080@144.00,0x0,1"
        "HDMI-A-1,1920x1080@60.00,-1920x0,1"
      ];
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = monitors;

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
        sensitivity = 0;
        numlock_by_default = true;
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = "rgba(${colors.accent}FF)";
        "col.inactive_border" = "rgba(${colors.fg-muted}00)";
        layout = "master";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = { };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
      ];

      exec-once = [
        "swww init"
        "swww img ${toString ./../../../assets/wallpapers/GigantamaxEctoplasma.png}"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        # ICC color profiles — laptop panel (eDP-1) and external monitor (HDMI-A-1)
        "dispwin -d 1 ${config.home.homeDirectory}/.local/share/icc/edid-b23a256e9e28a5b159458e39fe4346c5.icc"
        "dispwin -d 2 ${config.home.homeDirectory}/.local/share/icc/edid-b23a256e9e28a5b159458e39fe4346c5.icc"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

        # Focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Move windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Resize windows
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Workspaces
        "$mainMod, ampersand,    workspace, 1"
        "$mainMod, eacute,       workspace, 2"
        "$mainMod, quotedbl,     workspace, 3"
        "$mainMod, apostrophe,   workspace, 4"
        "$mainMod, parenleft,    workspace, 5"
        "$mainMod, minus,        workspace, 6"
        "$mainMod, egrave,       workspace, 7"
        "$mainMod, underscore,   workspace, 8"
        "$mainMod, ccedilla,     workspace, 9"
        "$mainMod, agrave,       workspace, 10"

        # Move to workspace
        "$mainMod SHIFT, ampersand,    movewindow, 1"
        "$mainMod SHIFT, eacute,       movewindow, 2"
        "$mainMod SHIFT, quotedbl,     movewindow, 3"
        "$mainMod SHIFT, apostrophe,   movewindow, 4"
        "$mainMod SHIFT, parenleft,    movewindow, 5"
        "$mainMod SHIFT, minus,        movewindow, 6"
        "$mainMod SHIFT, egrave,       movewindow, 7"
        "$mainMod SHIFT, underscore,   movewindow, 8"
        "$mainMod SHIFT, ccedilla,     movewindow, 9"
        "$mainMod SHIFT, agrave,       movewindow, 10"

        # Scroll workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up,   workspace, e-1"

        # Volume
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute,        exec, pamixer -t"
        ", XF86AudioMicMute,     exec, pamixer --default-source -m"

        # Brightness
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp,   exec, brightnessctl set +5%"

        # Shortcuts
        ''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
        ''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Gamemode
        "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
