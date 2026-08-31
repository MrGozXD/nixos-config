{
  lib,
  pkgs,
  colors,
  ...
}:
{
  stylix.targets.yazi.enable = lib.mkForce false;

  programs.zsh.shellAliases.yazi = "kitty --class yazi -e yazi";

  xdg.desktopEntries.yazi = {
    type = "Application";
    name = "Yazi";
    genericName = "File Manager";
    exec = "kitty --class yazi -e yazi";
    icon = "system-file-manager";
    categories = [
      "System"
      "FileTools"
    ];
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    initLua = ''
      local function build_hints(pairs)
        local KEY = "#${colors.accent}"
        local DIM = "#${colors.fg-muted}"
        local spans = {}
        for _, h in ipairs(pairs) do
          spans[#spans + 1] = ui.Span(h[1]):fg(KEY):bold(true)
          spans[#spans + 1] = ui.Span(" " .. h[2] .. " "):fg(DIM)
        end
        return ui.Line(spans)
      end

      local HINTS = {
        {
          min_width = 155,
          left = {
            { "↑↓←→", "move" },
            { "⏎", "open" },
            { "spc", "sel" },
            { "y", "copy" },
            { "x", "cut" },
            { "p", "paste" },
          },
          right = {
            { "r", "rename" },
            { "d", "del" },
            { ".", "hide" },
            { "/", "find" },
            { "z", "jump" },
            { "q", "quit" },
          },
        },
        {
          min_width = 80,
          left = {
            { "⏎", "open" },
            { "y", "copy" },
          },
          right = {
            { "/", "find" },
            { "?", "all keys" },
          },
        },
      }

      Status:children_add(function(self)
        local w = self and self._area and self._area.w or 0
        for _, tier in ipairs(HINTS) do
          if w >= tier.min_width then
            return build_hints(tier.left)
          end
        end
        return ""
      end, 1000, Status.LEFT)

      Status:children_add(function(self)
        local w = self and self._area and self._area.w or 0
        for _, tier in ipairs(HINTS) do
          if w >= tier.min_width then
            return build_hints(tier.right)
          end
        end
        return ""
      end, 1000, Status.RIGHT)
    '';

    settings = {
      mgr = {
        ratio = [
          1
          2
          4
        ];
        sort_dir_first = true;
      };
      opener = {
        edit = [
          {
            run = "zed \"$@\"";
            block = false;
            orphan = true;
          }
        ];
      };
    };

    theme = {
      mgr = {
        cwd = {
          fg = "#${colors.accent}";
          bold = true;
        };
        hovered = {
          bg = "#${colors.bg-highlight}";
          bold = true;
        };
        preview_hovered.bg = "#${colors.bg-highlight}";
        find_keyword = {
          fg = "#${colors.yellow}";
          bold = true;
        };
        find_position.fg = "#${colors.accent}";
        marker_selected = {
          fg = "#${colors.green}";
          bg = "#${colors.bg-highlight}";
        };
        marker_copied = {
          fg = "#${colors.green}";
          bg = "#${colors.bg-highlight}";
        };
        marker_cut = {
          fg = "#${colors.red}";
          bg = "#${colors.bg-highlight}";
        };
        tab_active = {
          fg = "#${colors.bg}";
          bg = "#${colors.accent}";
        };
        tab_inactive = {
          fg = "#${colors.fg-muted}";
          bg = "#${colors.bg-surface}";
        };
        border_style.fg = "#${colors.bg-surface}";
      };

      status = {
        separator_open.fg = "#${colors.fg-muted}";
        separator_close.fg = "#${colors.fg-muted}";
        style_a = {
          fg = "#${colors.bg}";
          bg = "#${colors.accent}";
          bold = true;
        };
        style_b = {
          fg = "#${colors.fg}";
          bg = "#${colors.bg-surface}";
        };
        style_c = {
          fg = "#${colors.fg-muted}";
          bg = "#${colors.bg-surface}";
        };
        permissions_t.fg = "#${colors.green}";
        permissions_r.fg = "#${colors.yellow}";
        permissions_w.fg = "#${colors.red}";
        permissions_x.fg = "#${colors.cyan}";
        permissions_s.fg = "#${colors.fg-muted}";
        progress_label = {
          fg = "#${colors.fg}";
          bg = "#${colors.bg-surface}";
        };
        progress_normal = {
          fg = "#${colors.accent}";
          bg = "#${colors.bg-surface}";
        };
      };

      which = {
        mask.bg = "#${colors.bg}";
        cand.fg = "#${colors.cyan}";
        rest.fg = "#${colors.fg-muted}";
        desc.fg = "#${colors.fg}";
        separator_style.fg = "#${colors.fg-muted}";
      };

      filetype.rules = [
        {
          mime = "image/*";
          fg = "#${colors.cyan}";
        }
        {
          mime = "video/*";
          fg = "#${colors.yellow}";
        }
        {
          mime = "audio/*";
          fg = "#${colors.accent-soft}";
        }
        {
          mime = "application/zip";
          fg = "#${colors.orange}";
        }
        {
          mime = "application/gzip";
          fg = "#${colors.orange}";
        }
        {
          mime = "application/x-tar";
          fg = "#${colors.orange}";
        }
        {
          mime = "application/pdf";
          fg = "#${colors.red}";
        }
        {
          name = "*.nix";
          fg = "#${colors.accent-soft}";
        }
        {
          name = "*.{rs,toml}";
          fg = "#${colors.orange}";
        }
        {
          name = "*.{js,ts,jsx,tsx,json}";
          fg = "#${colors.yellow}";
        }
        {
          name = "*.{py,lua,sh,bash}";
          fg = "#${colors.green}";
        }
        {
          name = "*.{md,txt}";
          fg = "#${colors.fg}";
        }
        {
          name = "*.{cpp,c,h,hpp,java}";
          fg = "#${colors.cyan}";
        }
        {
          mime = "*";
          fg = "#${colors.fg-muted}";
        }
      ];
    };
  };
}
