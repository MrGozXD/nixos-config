{ pkgs, colors, ... }:
let
  style = {
    # Base colors
    background = "#${colors.bg}";
    "background.appearance" = "opaque";
    "surface.background" = "#${colors.bg-surface}";
    "panel.background" = "#${colors.bg-surface}";
    "elevated_surface.background" = "#${colors.bg-surface}";
    text = "#${colors.fg}";
    "text.muted" = "#${colors.fg-muted}";
    "text.placeholder" = "#${colors.fg-muted}88";
    "text.disabled" = "#${colors.fg}44";
    "text.accent" = "#${colors.accent}";
    border = "#${colors.fg-muted}";
    "border.variant" = "#${colors.fg-muted}88";
    "border.focused" = "#${colors.accent}";
    "border.transparent" = "#00000000";

    # Elements
    "element.background" = "#${colors.accent}cc";
    "element.hover" = "#${colors.bg-highlight}88";
    "element.active" = "#${colors.accent}44";
    "element.selected" = "#${colors.bg-highlight}";
    "ghost_element.background" = "#00000000";
    "ghost_element.hover" = "#${colors.bg-surface}";
    "ghost_element.active" = "#${colors.bg-highlight}cc";
    "ghost_element.selected" = "#${colors.bg-highlight}";
    "ghost_element.disabled" = "#${colors.fg-muted}44";

    # Editor
    "editor.background" = "#${colors.bg}";
    "editor.gutter.background" = "#${colors.bg}";
    "editor.foreground" = "#${colors.fg}";
    "editor.line_number" = "#${colors.fg-muted}";
    "editor.active_line_number" = "#${colors.fg-bright}";
    "editor.active_line.background" = "#${colors.bg-surface}";
    "editor.indent_guide" = "#${colors.bg-surface}";
    "editor.indent_guide_active" = "#${colors.fg-muted}";
    "editor.selection.background" = "#${colors.bg-highlight}CC";
    "editor.document_highlight.bracket_background" = "#${colors.bg-surface}";
    "editor.document_highlight.read_background" = "#${colors.bg-highlight}44";
    "editor.document_highlight.write_background" = "#${colors.bg-highlight}55";
    "editor.subheader.background" = "#${colors.bg-surface}";

    "link_text.hover" = "#${colors.accent}";

    # Terminal
    "terminal.background" = "#${colors.bg-surface}";
    "terminal.foreground" = "#${colors.fg-muted}";
    "terminal.bright_foreground" = "#${colors.fg-muted}";
    "terminal.dim_foreground" = "#${colors.fg-muted}88";
    "terminal.ansi.black" = "#${colors.bg-surface}";
    "terminal.ansi.red" = "#${colors.red}";
    "terminal.ansi.green" = "#${colors.green}";
    "terminal.ansi.yellow" = "#${colors.yellow}";
    "terminal.ansi.blue" = "#${colors.accent}";
    "terminal.ansi.magenta" = "#${colors.accent-soft}";
    "terminal.ansi.cyan" = "#${colors.cyan}";
    "terminal.ansi.white" = "#${colors.fg-muted}";
    "terminal.ansi.bright_black" = "#${colors.bg-surface}";
    "terminal.ansi.bright_red" = "#${colors.red}";
    "terminal.ansi.bright_green" = "#${colors.green}";
    "terminal.ansi.bright_yellow" = "#${colors.yellow}";
    "terminal.ansi.bright_blue" = "#${colors.accent}";
    "terminal.ansi.bright_magenta" = "#${colors.accent-soft}";
    "terminal.ansi.bright_cyan" = "#${colors.cyan}";
    "terminal.ansi.bright_white" = "#${colors.fg-bright}";
    "terminal.ansi.dim_black" = "#${colors.bg-surface}66";
    "terminal.ansi.dim_red" = "#${colors.red}66";
    "terminal.ansi.dim_green" = "#${colors.green}66";
    "terminal.ansi.dim_yellow" = "#${colors.yellow}66";
    "terminal.ansi.dim_blue" = "#${colors.accent}66";
    "terminal.ansi.dim_magenta" = "#${colors.accent-soft}66";
    "terminal.ansi.dim_cyan" = "#${colors.cyan}66";
    "terminal.ansi.dim_white" = "#${colors.fg-muted}66";

    # Diagnostics
    "error" = "#${colors.red}";
    "error.background" = "#${colors.bg}";
    "error.border" = "#${colors.fg-muted}";
    "warning" = "#${colors.orange}";
    "warning.background" = "#${colors.bg}";
    "warning.border" = "#${colors.orange}";
    "info" = "#${colors.cyan}";
    "info.background" = "#${colors.bg}";
    "info.border" = "#${colors.cyan}";
    "hint" = "#${colors.cyan}";
    "hint.background" = "#${colors.bg}";
    "hint.border" = "#${colors.cyan}";
    "success" = "#${colors.green}";
    "success.background" = "#${colors.bg}";
    "success.border" = "#${colors.green}";

    # Git
    "created" = "#${colors.green}";
    "created.background" = "#${colors.bg}";
    "created.border" = "#${colors.green}";
    "modified" = "#${colors.yellow}";
    "modified.border" = "#${colors.yellow}";
    "deleted" = "#${colors.red}";
    "deleted.background" = "#${colors.bg}";
    "deleted.border" = "#${colors.red}";
    "conflict" = "#${colors.orange}";
    "conflict.border" = "#${colors.orange}";
    "renamed" = "#${colors.cyan}";
    "renamed.border" = "#${colors.cyan}";
    "ignored" = "#${colors.fg-muted}";
    "ignored.border" = "#${colors.fg-muted}";

    # Panes and panels
    "pane.focused_border" = "#${colors.accent}";
    "pane_group.border" = "#${colors.fg-muted}";
    "panel.indent_guide" = "#${colors.bg-surface}";
    "panel.indent_guide_active" = "#${colors.fg-muted}";
    "status_bar.background" = "#${colors.bg-surface}";
    "title_bar.background" = "#${colors.bg-surface}";
    "toolbar.background" = "#${colors.bg}";
    
    # Search and tabs
    "search.match_background" = "#${colors.accent}44";
    "tab_bar.background" = "#${colors.bg-surface}";
    "tab.active_background" = "#${colors.bg}";
    "tab.inactive_background" = "#${colors.bg-surface}";
    "tab.active_border" = "#${colors.accent}";
    "drop_target.background" = "#${colors.bg-surface}";

    # Scrollbar
    "scrollbar.thumb.background" = "#${colors.fg-muted}22";
    "scrollbar.thumb.hover_background" = "#${colors.fg-muted}44";
    "scrollbar.thumb.active_background" = "#${colors.fg-muted}88";

    players = [
      {
        cursor = "#${colors.fg-bright}";
        selection = "#${colors.bg-highlight}CC";
        background = "#${colors.bg}";
      }
    ];

    syntax = {
      variable = {
        color = "#${colors.fg}";
      };
      "variable.builtin" = {
        color = "#${colors.fg}";
      };
      "variable.parameter" = {
        color = "#${colors.rose}";
      };
      constant = {
        color = "#${colors.orange}";
      };
      "constant.builtin" = {
        color = "#${colors.orange}";
      };
      string = {
        color = "#${colors.green}";
      };
      "string.documentation" = {
        color = "#${colors.green}";
      };
      "string.regexp" = {
        color = "#${colors.cyan}";
      };
      "string.regex" = {
        color = "#${colors.cyan}";
      };
      character = {
        color = "#${colors.green}";
      };
      "character.special" = {
        color = "#${colors.cyan}";
      };
      number = {
        color = "#${colors.orange}";
      };
      function = {
        color = "#${colors.cyan}";
      };
      "function.builtin" = {
        color = "#${colors.cyan}";
      };
      "function.call" = {
        color = "#${colors.cyan}";
      };
      type = {
        color = "#${colors.yellow}";
      };
      "type.builtin" = {
        color = "#${colors.yellow}";
      };
      operator = {
        color = "#${colors.cyan}";
      };
      namespace = {
        color = "#${colors.yellow}";
      };
      class = {
        color = "#${colors.yellow}";
      };
      property = {
        color = "#${colors.accent-soft}";
      };
      keyword = {
        color = "#${colors.accent}";
      };
      "keyword.type" = {
        color = "#${colors.accent}";
      };
      "keyword.function" = {
        color = "#${colors.accent}";
      };
      "keyword.operator" = {
        color = "#${colors.cyan}";
      };
      "keyword.import" = {
        color = "#${colors.accent}";
      };
      comment = {
        color = "#${colors.fg-muted}";
        font_style = "italic";
      };
      tag = {
        color = "#${colors.red}";
      };
      parameter = {
        color = "#${colors.rose}";
      };
    };
  };

  themeJSON = builtins.toJSON {
    "$schema" = "https://zed.dev/schema/themes/v0.2.0.json";
    name = "Night Purple";
    author = "mrgozxd";
    themes = [
      {
        name = "Night Purple";
        appearance = "dark";
        style = style;
      }
    ];
  };
in
{
  home.file.".config/zed/themes/night-purple.json".text = themeJSON;
}
