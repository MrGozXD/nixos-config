{ pkgs, colors, ... }:
let
  themeJSON = builtins.toJSON {
    name = "Mr Goz XD Night Purple";
    type = "dark";
    colors = {
      # Editor
      "editor.background" = "#${colors.bg}";
      "editor.foreground" = "#${colors.fg}";
      "editor.selectionBackground" = "#${colors.bg-highlight}CC";
      "editor.selectionHighlightBackground" = "#${colors.bg-highlight}88";
      "editor.lineHighlightBackground" = "#${colors.bg-surface}";
      "editor.wordHighlightBackground" = "#${colors.bg-highlight}88";
      "editor.findMatchBackground" = "#${colors.accent}44";
      "editor.findMatchHighlightBackground" = "#${colors.accent}22";
      "editorCursor.foreground" = "#${colors.accent}";
      "editorWhitespace.foreground" = "#${colors.fg-muted}44";
      "editorIndentGuide.background" = "#${colors.fg-muted}33";
      "editorIndentGuide.activeBackground" = "#${colors.fg-muted}88";
      "editorLineNumber.foreground" = "#${colors.fg-muted}";
      "editorLineNumber.activeForeground" = "#${colors.fg-bright}";
      "editorBracketMatch.background" = "#${colors.accent}33";
      "editorBracketMatch.border" = "#${colors.accent}";
      "editorGutter.addedBackground" = "#${colors.green}";
      "editorGutter.modifiedBackground" = "#${colors.orange}";
      "editorGutter.deletedBackground" = "#${colors.red}";
      "editorError.foreground" = "#${colors.red}";
      "editorWarning.foreground" = "#${colors.orange}";
      "editorInfo.foreground" = "#${colors.cyan}";

      # Editor widget
      "editorWidget.background" = "#${colors.bg-surface}";
      "editorWidget.border" = "#${colors.fg-muted}";
      "editorSuggestWidget.background" = "#${colors.bg-surface}";
      "editorSuggestWidget.border" = "#${colors.fg-muted}";
      "editorSuggestWidget.selectedBackground" = "#${colors.bg-highlight}";
      "editorSuggestWidget.highlightForeground" = "#${colors.accent}";

      # Title bar
      "titleBar.activeBackground" = "#${colors.bg}";
      "titleBar.activeForeground" = "#${colors.fg}";
      "titleBar.inactiveBackground" = "#${colors.bg}";
      "titleBar.inactiveForeground" = "#${colors.fg-muted}";

      # Activity bar
      "activityBar.background" = "#${colors.bg}";
      "activityBar.foreground" = "#${colors.fg-bright}";
      "activityBar.inactiveForeground" = "#${colors.fg-muted}";
      "activityBarBadge.background" = "#${colors.accent}";
      "activityBarBadge.foreground" = "#${colors.fg-bright}";

      # Side bar
      "sideBar.background" = "#${colors.bg}";
      "sideBar.foreground" = "#${colors.fg}";
      "sideBar.border" = "#${colors.bg-surface}";
      "sideBarTitle.foreground" = "#${colors.fg-bright}";
      "sideBarSectionHeader.background" = "#${colors.bg-surface}";
      "sideBarSectionHeader.foreground" = "#${colors.fg-bright}";

      # Lists
      "list.activeSelectionBackground" = "#${colors.bg-highlight}";
      "list.activeSelectionForeground" = "#${colors.fg-bright}";
      "list.inactiveSelectionBackground" = "#${colors.bg-surface}";
      "list.hoverBackground" = "#${colors.bg-surface}";
      "list.highlightForeground" = "#${colors.accent}";
      "list.focusOutline" = "#${colors.accent}88";

      # Status bar
      "statusBar.background" = "#${colors.bg}";
      "statusBar.foreground" = "#${colors.fg}";
      "statusBar.border" = "#${colors.bg-surface}";
      "statusBar.debuggingBackground" = "#${colors.orange}";
      "statusBar.debuggingForeground" = "#${colors.bg}";
      "statusBar.noFolderBackground" = "#${colors.bg}";
      "statusBarItem.remoteBackground" = "#${colors.accent}";
      "statusBarItem.remoteForeground" = "#${colors.fg-bright}";

      # Tabs
      "tab.activeBackground" = "#${colors.bg}";
      "tab.activeForeground" = "#${colors.fg-bright}";
      "tab.inactiveBackground" = "#${colors.bg}";
      "tab.inactiveForeground" = "#${colors.fg-muted}";
      "tab.activeBorderTop" = "#${colors.accent}";
      "tab.border" = "#${colors.bg}";
      "editorGroupHeader.tabsBackground" = "#${colors.bg}";

      # Terminal
      "terminal.background" = "#${colors.bg}";
      "terminal.foreground" = "#${colors.fg}";
      "terminal.ansiBlack" = "#${colors.bg-surface}";
      "terminal.ansiRed" = "#${colors.red}";
      "terminal.ansiGreen" = "#${colors.green}";
      "terminal.ansiYellow" = "#${colors.yellow}";
      "terminal.ansiBlue" = "#${colors.accent}";
      "terminal.ansiMagenta" = "#${colors.accent-soft}";
      "terminal.ansiCyan" = "#${colors.cyan}";
      "terminal.ansiWhite" = "#${colors.fg}";
      "terminal.ansiBrightBlack" = "#${colors.fg-muted}";
      "terminal.ansiBrightRed" = "#${colors.red}";
      "terminal.ansiBrightGreen" = "#${colors.green}";
      "terminal.ansiBrightYellow" = "#${colors.yellow}";
      "terminal.ansiBrightBlue" = "#${colors.accent}";
      "terminal.ansiBrightMagenta" = "#${colors.accent-soft}";
      "terminal.ansiBrightCyan" = "#${colors.cyan}";
      "terminal.ansiBrightWhite" = "#${colors.fg-bright}";

      # Input
      "input.background" = "#${colors.bg-surface}";
      "input.foreground" = "#${colors.fg}";
      "input.border" = "#${colors.fg-muted}";
      "input.placeholderForeground" = "#${colors.fg-muted}";
      "focusBorder" = "#${colors.accent}88";

      # Buttons
      "button.background" = "#${colors.accent}";
      "button.foreground" = "#${colors.fg-bright}";
      "button.hoverBackground" = "#${colors.accent-soft}";

      # Dropdown
      "dropdown.background" = "#${colors.bg-surface}";
      "dropdown.foreground" = "#${colors.fg}";
      "dropdown.border" = "#${colors.fg-muted}";

      # Scrollbar
      "scrollbarSlider.background" = "#${colors.fg-muted}33";
      "scrollbarSlider.hoverBackground" = "#${colors.fg-muted}55";
      "scrollbarSlider.activeBackground" = "#${colors.fg-muted}88";

      # Panels
      "panel.background" = "#${colors.bg}";
      "panel.border" = "#${colors.bg-surface}";
      "panelTitle.activeBorder" = "#${colors.accent}";
      "panelTitle.activeForeground" = "#${colors.fg-bright}";
      "panelTitle.inactiveForeground" = "#${colors.fg-muted}";

      # Peek view
      "peekView.border" = "#${colors.accent}";
      "peekViewEditor.background" = "#${colors.bg-surface}";
      "peekViewResult.background" = "#${colors.bg}";
      "peekViewTitle.background" = "#${colors.bg-surface}";

      # Git decoration
      "gitDecoration.addedResourceForeground" = "#${colors.green}";
      "gitDecoration.modifiedResourceForeground" = "#${colors.orange}";
      "gitDecoration.deletedResourceForeground" = "#${colors.red}";
      "gitDecoration.untrackedResourceForeground" = "#${colors.green}";
      "gitDecoration.conflictingResourceForeground" = "#${colors.red}";
      "gitDecoration.ignoredResourceForeground" = "#${colors.fg-muted}";

      # Minimap
      "minimap.findMatchHighlight" = "#${colors.accent}88";
      "minimap.selectionHighlight" = "#${colors.bg-highlight}CC";

      # Notifications
      "notificationCenter.border" = "#${colors.bg-surface}";
      "notifications.background" = "#${colors.bg-surface}";
      "notifications.foreground" = "#${colors.fg}";

      # Command palette
      "quickInput.background" = "#${colors.bg-surface}";
      "quickInput.foreground" = "#${colors.fg}";
      "quickInputList.focusBackground" = "#${colors.bg-highlight}";
    };
    tokenColors = [
      {
        scope = [
          "comment"
          "punctuation.definition.comment"
        ];
        settings = {
          foreground = "#${colors.fg-muted}";
          fontStyle = "italic";
        };
      }
      {
        scope = [
          "string"
          "string.quoted"
          "string.template"
        ];
        settings.foreground = "#${colors.green}";
      }
      {
        scope = [
          "constant.numeric"
          "constant.language"
          "constant.character"
        ];
        settings.foreground = "#${colors.orange}";
      }
      {
        scope = [
          "keyword"
          "keyword.control"
          "storage.type"
          "storage.modifier"
        ];
        settings.foreground = "#${colors.accent}";
      }
      {
        scope = [
          "entity.name.function"
          "support.function"
        ];
        settings.foreground = "#${colors.cyan}";
      }
      {
        scope = [
          "entity.name.type"
          "entity.name.class"
          "support.type"
          "support.class"
        ];
        settings.foreground = "#${colors.yellow}";
      }
      {
        scope = [
          "variable"
          "variable.other"
        ];
        settings.foreground = "#${colors.fg}";
      }
      {
        scope = [ "variable.parameter" ];
        settings.foreground = "#${colors.rose}";
      }
      {
        scope = [ "entity.name.tag" ];
        settings.foreground = "#${colors.red}";
      }
      {
        scope = [ "entity.other.attribute-name" ];
        settings.foreground = "#${colors.accent-soft}";
      }
      {
        scope = [
          "punctuation"
          "meta.brace"
        ];
        settings.foreground = "#${colors.fg}";
      }
      {
        scope = [ "keyword.operator" ];
        settings.foreground = "#${colors.cyan}";
      }
      {
        scope = [ "markup.heading" ];
        settings = {
          foreground = "#${colors.accent}";
          fontStyle = "bold";
        };
      }
      {
        scope = [ "markup.bold" ];
        settings.fontStyle = "bold";
      }
      {
        scope = [ "markup.italic" ];
        settings.fontStyle = "italic";
      }
      {
        scope = [
          "markup.inline.raw"
          "markup.fenced_code"
        ];
        settings.foreground = "#${colors.green}";
      }
      {
        scope = [ "markup.deleted" ];
        settings.foreground = "#${colors.red}";
      }
      {
        scope = [ "markup.inserted" ];
        settings.foreground = "#${colors.green}";
      }
      {
        scope = [ "markup.changed" ];
        settings.foreground = "#${colors.orange}";
      }
      {
        scope = [
          "invalid"
          "invalid.illegal"
        ];
        settings.foreground = "#${colors.red}";
      }
    ];
  };

  extensionDir = pkgs.runCommand "night-purple-vscode-theme" { } ''
    mkdir -p $out/themes
    cat > $out/package.json << 'PACKAGEEOF'
    {
      "name": "night-purple",
      "displayName": "Night Purple",
      "version": "0.0.1",
      "publisher": "mrgozxd",
      "engines": { "vscode": "^1.60.0" },
      "categories": ["Themes"],
      "contributes": {
        "themes": [{
          "label": "Night Purple",
          "uiTheme": "vs-dark",
          "path": "./themes/night-purple-color-theme.json"
        }]
      }
    }
    PACKAGEEOF
    cat > $out/themes/night-purple-color-theme.json << 'THEMEEOF'
    ${themeJSON}
    THEMEEOF
  '';
in
{
  # Use the conventional publisher.name-version folder format so VS Code
  # reliably detects the extension (e.g. publisher.name-version).
  home.file.".vscode/extensions/mrgozxd.night-purple-0.0.1".source = extensionDir;
}
