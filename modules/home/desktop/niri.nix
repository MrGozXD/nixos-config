{ pkgs, colors, ... }:
{
  home.file.".config/niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "fr"
            }
        }

        touchpad {
            tap
            natural-scroll
        }

        mouse {}
    }

    output "eDP-1" {
        mode "1920x1080@144.003"
        scale 1
    }

    layout {
        gaps 16

        center-focused-column "never"

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }

        focus-ring {
            width 4
            active-color "#${colors.accent}"
            inactive-color "#${colors.fg-muted}"
        }

        border {
            off
        }
    }

    // Autostart
    spawn-at-startup "noctalia-shell"
    spawn-at-startup "wl-paste" "--type" "text" "--watch" "cliphist" "store"
    spawn-at-startup "wl-paste" "--type" "image" "--watch" "cliphist" "store"

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    animations {
        workspace-switch {
            spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
        }
        window-open {
            duration-ms 200
            curve "ease-out-expo"
        }
        window-close {
            duration-ms 150
            curve "ease-out-quad"
        }
        horizontal-view-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        window-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        window-resize {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        config-notification-open-close {
            spring damping-ratio=0.6 stiffness=1000 epsilon=0.001
        }
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return { spawn "kitty"; }
        Mod+D { spawn "wofi" "--show" "drun"; }
        Mod+V { spawn "bash" "-c" "cliphist list | wofi --dmenu | cliphist decode | wl-copy"; }
        Mod+E { spawn "nautilus"; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn "pamixer" "-i" "5"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "pamixer" "-d" "5"; }
        XF86AudioMute        allow-when-locked=true { spawn "pamixer" "-t"; }
        XF86AudioMicMute     allow-when-locked=true { spawn "pamixer" "--default-source" "-m"; }

        XF86MonBrightnessDown { spawn "brightnessctl" "set" "5%-"; }
        XF86MonBrightnessUp   { spawn "brightnessctl" "set" "+5%"; }

        Mod+Q { close-window; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }

        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Down  { move-window-down; }
        Mod+Ctrl+Up    { move-window-up; }
        Mod+Ctrl+Right { move-column-right; }

        Mod+Shift+Left  { focus-monitor-left; }
        Mod+Shift+Down  { focus-monitor-down; }
        Mod+Shift+Up    { focus-monitor-up; }
        Mod+Shift+Right { focus-monitor-right; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }

        Mod+Page_Down      { focus-workspace-down; }
        Mod+Page_Up        { focus-workspace-up; }
        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        Mod+Comma  { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+C { center-column; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Mod+WheelScrollDown      cooldown-ms=15 { focus-column-right; }
        Mod+WheelScrollUp        cooldown-ms=15 { focus-column-left; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=15 { focus-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=15 { focus-workspace-up; }

        Mod+L { spawn "loginctl" "lock-session"; }
        Mod+Shift+E { quit; }
        Mod+Shift+P { power-off-monitors; }
    }
  '';
}
