{ colors, ... }:
{
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "0";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/language"
          "keyboard-state"
          "hyprland/submap"
        ];
        modules-center = [
          "clock"
          "custom/weather"
        ];
        modules-right = [
          "pulseaudio"
          "custom/mem"
          "cpu"
          "backlight"
          "battery"
          "bluetooth"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        "hyprland/language" = {
          format-fr = "FR";
          min-length = 5;
          tooltip = false;
        };

        "bluetooth" = {
          format = "{icon} ";
          format-connected = "{icon} ";
        };

        "keyboard-state" = {
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
          };
        };

        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format = "{:%a %d %b, %I:%M %p}";
        };

        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 1800;
          exec = "$HOME/.config/waybar/scripts/wttr.py";
          return-type = "json";
        };

        "pulseaudio" = {
          scroll-step = 5; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "temperature" = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [ "" ];
          min-length = 7;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        "tray" = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: JetBrains Mono;
          font-weight: bold;
          min-height: 20px;
      }

      window#waybar {
          background: transparent;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      #workspaces {
          margin-right: 8px;
          border-radius: 10px;
          transition: none;
          background: #${colors.bg-surface};
      }

      #workspaces button {
          transition: none;
          color: #${colors.fg-muted};
          background: transparent;
          padding: 5px;
          font-size: 18px;
      }

      #workspaces button.persistent {
          color: #${colors.fg-muted};
          font-size: 12px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: #${colors.bg-surface};
          background: #${colors.fg-muted};
      }

      #workspaces button.active {
          background: #${colors.bg-highlight};
          color: white;
          border-radius: inherit;
      }

      #language {
          padding-left: 16px;
          padding-right: 8px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #keyboard-state {
          margin-right: 8px;
          padding-right: 16px;
          border-radius: 0px 10px 10px 0px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #custom-pacman {
          padding-left: 16px;
          padding-right: 8px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #custom-mail {
          margin-right: 8px;
          padding-right: 16px;
          border-radius: 0px 10px 10px 0px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #submap {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #clock {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #custom-weather {
          padding-right: 16px;
          border-radius: 0px 10px 10px 0px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #pulseaudio {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #pulseaudio.muted {
          background-color: #${colors.fg-muted};
          color: #${colors.bg};
      }

      #custom-mem {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #cpu {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #temperature {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #temperature.critical {
          background-color: #${colors.red};
      }

      #backlight {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #battery {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      #battery.charging {
          color: #${colors.fg-bright};
          background-color: #${colors.green};
      }

      #battery.warning:not(.charging) {
          background-color: #${colors.yellow};
          color: #${colors.bg};
      }

      #battery.critical:not(.charging) {
          background-color: #${colors.red};
          color: #${colors.fg-bright};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #tray {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #${colors.fg-bright};
          background: #${colors.bg-surface};
      }

      @keyframes blink {
          to {
              background-color: #${colors.fg-bright};
              color: #${colors.bg};
          }
      }
    '';
  };
}
