{ pkgs, colors, ... }:
let
  manifestJSON = builtins.toJSON {
    name = "Night Purple";
    version = "1.0.0";
    minAppVersion = "1.0.0";
    author = "mrgozxd";
    authorUrl = "";
  };

  themeCSS = ''
    .theme-dark {
      /* ── Backgrounds ── */
      --background-primary: #${colors.bg};
      --background-primary-alt: #${colors.bg-surface};
      --background-secondary: #${colors.bg};
      --background-secondary-alt: #${colors.bg-surface};
      --background-modifier-border: #${colors.fg-muted};
      --background-modifier-border-hover: #${colors.accent};
      --background-modifier-border-focus: #${colors.accent};
      --background-modifier-form-field: #${colors.bg-surface};
      --background-modifier-hover: #${colors.bg-highlight};
      --background-modifier-active-hover: #${colors.bg-highlight};
      --background-modifier-success: #${colors.green};
      --background-modifier-error: #${colors.red};

      /* ── Text ── */
      --text-normal: #${colors.fg};
      --text-muted: #${colors.fg-muted};
      --text-faint: #${colors.fg-muted};
      --text-on-accent: #${colors.fg-bright};
      --text-error: #${colors.red};
      --text-success: #${colors.green};
      --text-accent: #${colors.accent};
      --text-accent-hover: #${colors.accent-soft};
      --text-selection: #${colors.bg-highlight};

      /* ── Interactive / accent ── */
      --interactive-normal: #${colors.bg-surface};
      --interactive-hover: #${colors.bg-highlight};
      --interactive-accent: #${colors.accent};
      --interactive-accent-hover: #${colors.accent-soft};

      /* ── Scrollbar ── */
      --scrollbar-bg: transparent;
      --scrollbar-thumb-bg: #${colors.fg-muted}33;
      --scrollbar-active-thumb-bg: #${colors.fg-muted}66;

      /* ── Tabs ── */
      --tab-text-color: #${colors.fg-muted};
      --tab-text-color-focused: #${colors.fg-bright};
      --tab-text-color-focused-active: #${colors.fg-bright};
      --tab-text-color-focused-active-current: #${colors.accent};
      --tab-background-active: #${colors.bg};
      --tab-outline-color: #${colors.fg-muted};

      /* ── Title bar ── */
      --titlebar-background: #${colors.bg};
      --titlebar-background-focused: #${colors.bg};
      --titlebar-text-color: #${colors.fg};
      --titlebar-text-color-focused: #${colors.fg-bright};

      /* ── Tags ── */
      --tag-color: #${colors.accent};
      --tag-color-hover: #${colors.accent-soft};
      --tag-background: transparent;
      --tag-background-hover: #${colors.bg-highlight};

      /* ── Headings ── */
      --h1-color: #${colors.accent};
      --h2-color: #${colors.accent-soft};
      --h3-color: #${colors.cyan};
      --h4-color: #${colors.yellow};
      --h5-color: #${colors.green};
      --h6-color: #${colors.orange};

      /* ── Inline code / code blocks ── */
      --code-normal: #${colors.green};
      --code-background: #${colors.bg-surface};
      --code-comment: #${colors.fg-muted};

      /* ── Syntax highlighting in code blocks ── */
      --code-keyword: #${colors.accent};
      --code-function: #${colors.cyan};
      --code-string: #${colors.green};
      --code-value: #${colors.orange};
      --code-important: #${colors.red};
      --code-tag: #${colors.red};
      --code-property: #${colors.yellow};
      --code-operator: #${colors.cyan};

      /* ── Links ── */
      --link-color: #${colors.accent};
      --link-color-hover: #${colors.accent-soft};
      --link-external-color: #${colors.cyan};
      --link-external-color-hover: #${colors.cyan};
      --link-unresolved-color: #${colors.rose};

      /* ── Bold / Italic ── */
      --bold-color: #${colors.fg-bright};
      --italic-color: #${colors.fg};

      /* ── Blockquote ── */
      --blockquote-border-color: #${colors.accent};

      /* ── Checkbox ── */
      --checkbox-color: #${colors.accent};
      --checkbox-color-hover: #${colors.accent-soft};
      --checkbox-marker-color: #${colors.bg};

      /* ── List ── */
      --list-marker-color: #${colors.fg-muted};

      /* ── Graph ── */
      --graph-line: #${colors.fg-muted}44;
      --graph-node: #${colors.accent};
      --graph-node-focused: #${colors.accent-soft};
      --graph-node-tag: #${colors.yellow};
      --graph-node-attachment: #${colors.green};

      /* ── Nav / file explorer ── */
      --nav-item-color: #${colors.fg};
      --nav-item-color-hover: #${colors.fg-bright};
      --nav-item-color-active: #${colors.accent};
      --nav-item-background-hover: #${colors.bg-highlight};
      --nav-item-background-active: #${colors.bg-highlight};
      --nav-collapse-icon-color: #${colors.fg-muted};

      /* ── Misc ── */
      --icon-color: #${colors.fg-muted};
      --icon-color-hover: #${colors.fg-bright};
      --icon-color-active: #${colors.accent};
      --icon-color-focused: #${colors.accent};
      --color-accent: #${colors.accent};
      --color-accent-1: #${colors.accent};
      --color-accent-2: #${colors.accent-soft};

      /* ── Cursor ── */
      --cursor-color: #${colors.accent};

      /* ── Indentation guide ── */
      --indentation-guide-color: #${colors.fg-muted}33;
      --indentation-guide-color-active: #${colors.fg-muted}88;
    }

    /* ── TUI styling ── */
    body {
      --font-text: "JetBrains Mono", monospace;
      --font-monospace: "JetBrains Mono", monospace;
      --font-interface: "JetBrains Mono", monospace;
      --radius-s: 0px;
      --radius-m: 0px;
      --radius-l: 0px;
      --input-radius: 0px;
      --tab-radius: 0px;
      --tab-radius-active: 0px;
      --checkbox-radius: 0px;
      --toggle-radius: 0px;
      --toggle-thumb-radius: 0px;
      --dialog-radius: 0px;
      --tab-curve: 0px;
    }

    /* kill all rounded corners aggressively */
    .workspace-tab-header,
    .workspace-tab-header-inner,
    .workspace-tab-header.is-active,
    .workspace-tab-header-tab-list,
    .workspace-tab-container,
    .workspace-tab-header::before,
    .workspace-tab-header::after,
    .workspace-tab-header-inner::before,
    .workspace-tab-header-inner::after {
      border-radius: 0px !important;
    }

    /* remove the curved decorative pseudo-elements on tabs */
    .workspace-tab-header::before,
    .workspace-tab-header::after,
    .workspace-tab-header-inner::before,
    .workspace-tab-header-inner::after {
      display: none !important;
    }

    /* fix active tab overlapping the separator line */
    .workspace-tab-header.is-active {
      margin-bottom: 0 !important;
      padding-bottom: 0 !important;
      bottom: 0 !important;
      position: relative !important;
    }
    .workspace-tab-header-container {
      padding-bottom: 0 !important;
    }
    .workspace-tab-header-container-inner {
      margin-bottom: 0 !important;
    }

    /* thin borders on panes */
    .workspace-leaf {
      border: 1px solid var(--background-modifier-border);
    }
    .workspace-leaf:hover {
      border-color: var(--interactive-accent);
    }

    /* flat sidebar */
    .workspace-ribbon {
      background-color: var(--background-primary);
    }

    /* remove box shadows for flat TUI look */
    *,
    .modal,
    .suggestion-container,
    .menu,
    .prompt {
      box-shadow: none !important;
    }

    /* monospace selection indicator */
    .nav-file-title.is-active::before {
      content: ">> ";
      color: var(--interactive-accent);
    }

    /* bordered modals */
    .modal {
      border: 1px solid var(--interactive-accent);
      border-radius: 0px;
    }

    /* bordered suggestions/command palette */
    .suggestion-container,
    .prompt {
      border: 1px solid var(--interactive-accent);
      border-radius: 0px;
    }

    /* scrollbar thin */
    ::-webkit-scrollbar {
      width: 4px;
    }
    ::-webkit-scrollbar-thumb {
      background: var(--scrollbar-thumb-bg);
      border-radius: 0px;
    }
    ::-webkit-scrollbar-thumb:hover {
      background: var(--scrollbar-active-thumb-bg);
    }

    /* status bar — prevent overlap with window border */
    .status-bar {
      padding: 4px 8px;
      margin: 0;
      border-top: 1px solid var(--background-modifier-border);
      font-size: 12px !important;
      line-height: 1.4;
      min-height: 24px;
      overflow: hidden;
    }
    .mod-root {
      padding-bottom: 0 !important;
    }
  '';

  themeDir = pkgs.runCommand "obsidian-night-purple-theme" { } ''
    mkdir -p $out
    cat > $out/manifest.json << 'EOF'
    ${manifestJSON}
    EOF
    cat > $out/theme.css << 'CSSEOF'
    ${themeCSS}
    CSSEOF
  '';
in
{
  home.file."Goz Vault/.obsidian/themes/Night Purple".source = themeDir;
}
