{ pkgs, colors, ... }:
let
  themeJSON = builtins.toJSON {
    name = "Night Purple";
    appearance = "dark";
    background = {
      base = "#${colors.bg}";
      surface = "#${colors.bg-surface}";
      elevated = "#${colors.bg}";
    };
    foreground = {
      default = "#${colors.fg}";
      muted = "#${colors.fg-muted}";
      faded = "#${colors.fg-muted}";
      inverted = "#${colors.bg}";
      accent = "#${colors.accent}";
    };
    editor = {
      background = {
        default = "#${colors.bg}";
        gutter = "#${colors.bg}";
      };
      foreground = {
        default = "#${colors.fg}";
        line_number = "#${colors.fg-muted}";
        line_number_active = "#${colors.fg-bright}";
      };
      line_highlight = "#${colors.bg-surface}";
      line_number_background = "#${colors.bg}";
      text_highlight = {
        occurrence = {
          background = "#${colors.bg-highlight}88";
        };
      };
      search = {
        match_background = "#${colors.accent}44";
      };
      whitespace = "#${colors.fg-muted}44";
      code_folding_decoration = "#${colors.fg-muted}";
      diff = {
        inserted_background = "#${colors.green}22";
        deleted_background = "#${colors.red}22";
        modified_background = "#${colors.orange}22";
      };
    };
    syntax = {
      comment = {
        color = "#${colors.fg-muted}";
        font_style = "italic";
      };
      string = {
        color = "#${colors.green}";
      };
      number = {
        color = "#${colors.orange}";
      };
      built_in_constant = {
        color = "#${colors.orange}";
      };
      constant = {
        color = "#${colors.orange}";
      };
      variable = {
        color = "#${colors.fg}";
      };
      keyword = {
        color = "#${colors.accent}";
      };
      type = {
        color = "#${colors.yellow}";
      };
      function = {
        color = "#${colors.cyan}";
      };
      operator = {
        color = "#${colors.cyan}";
      };
      tag = {
        color = "#${colors.red}";
      };
      attribute = {
        color = "#${colors.accent-soft}";
      };
      punctuation = {
        color = "#${colors.fg}";
      };
    };
    status_bar_background = "#${colors.bg}";
    title_bar_background = "#${colors.bg}";
    toolbar_background = "#${colors.bg}";
    tab_bar_background = "#${colors.bg}";
    tab_active_background = "#${colors.bg}";
    tab_inactive_background = "#${colors.bg}";
    search_background = "#${colors.bg-surface}";
    panel_background = "#${colors.bg}";
    terminal_background = "#${colors.bg}";
    terminal_ansi = [
      "#${colors.bg-surface}"
      "#${colors.red}"
      "#${colors.green}"
      "#${colors.yellow}"
      "#${colors.accent}"
      "#${colors.accent-soft}"
      "#${colors.cyan}"
      "#${colors.fg}"
      "#${colors.fg-muted}"
      "#${colors.red}"
      "#${colors.green}"
      "#${colors.yellow}"
      "#${colors.accent}"
      "#${colors.accent-soft}"
      "#${colors.cyan}"
      "#${colors.fg-bright}"
    ];
    players = [
      {
        background = {
          selection = "#${colors.bg-highlight}CC";
        };
      }
    ];
    tokens = [
      {
        type = "comment";
        color = "#${colors.fg-muted}";
        font_style = "italic";
      }
      {
        type = "documentation";
        color = "#${colors.fg-muted}";
        font_style = "italic";
      }
      {
        type = "string";
        color = "#${colors.green}";
      }
      {
        type = "number";
        color = "#${colors.orange}";
      }
      {
        type = "boolean";
        color = "#${colors.orange}";
      }
      {
        type = "keyword";
        color = "#${colors.accent}";
      }
      {
        type = "function";
        color = "#${colors.cyan}";
      }
      {
        type = "type";
        color = "#${colors.yellow}";
      }
      {
        type = "variable";
        color = "#${colors.fg}";
      }
      {
        type = "property";
        color = "#${colors.accent-soft}";
      }
    ];
  };
in
{
  home.file.".config/zed/themes/night-purple.json".text = themeJSON;
}
