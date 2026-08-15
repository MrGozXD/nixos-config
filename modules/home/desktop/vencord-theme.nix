{ colors, ... }:
let
  themeCSS = ''
    /**
     * @name Night Purple
     * @description system24 theme with Night Purple color palette.
     * @author refact0r, mrgozxd
     * @version 2.0.0
     * @source https://github.com/refact0r/system24
     */

    /* import theme modules */
    @import url('https://refact0r.github.io/system24/build/system24.css');

    body {
        /* font */
        --font: 'DM Mono';
        --code-font: 'DM Mono';
        font-weight: 300;
        letter-spacing: -0.05ch;

        /* sizes */
        --gap: 12px;
        --divider-thickness: 4px;
        --border-thickness: 2px;
        --border-hover-transition: 0.2s ease;

        /* animation/transition options */
        --animations: on;
        --list-item-transition: 0.2s ease;
        --dms-icon-svg-transition: 0.4s ease;

        /* top bar options */
        --top-bar-height: var(--gap);
        --top-bar-button-position: titlebar;
        --top-bar-title-position: off;
        --subtle-top-bar-title: off;

        /* window controls */
        --custom-window-controls: off;
        --window-control-size: 14px;

        /* dms button options */
        --custom-dms-icon: off;
        --dms-icon-svg-url: url("");
        --dms-icon-svg-size: 90%;
        --dms-icon-color-before: var(--icon-subtle);
        --dms-icon-color-after: var(--white);
        --custom-dms-background: off;
        --dms-background-image-url: url("");
        --dms-background-image-size: cover;
        --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2));

        /* background image options */
        --background-image: off;
        --background-image-url: url("");

        /* transparency/blur options */
        --transparency-tweaks: off;
        --remove-bg-layer: off;
        --panel-blur: off;
        --blur-amount: 12px;
        --bg-floating: var(--bg-3);

        /* other options */
        --small-user-panel: on;

        /* unrounding options */
        --unrounding: on;

        /* styling options */
        --custom-spotify-bar: on;
        --ascii-titles: on;
        --ascii-loader: system24;

        /* panel labels */
        --panel-labels: on;
        --label-color: var(--text-muted);
        --label-font-weight: 500;
    }

    /* Night Purple color palette */
    :root {
        --colors: on;

        /* text colors */
        --text-0: var(--bg-4);
        --text-1: #${colors.fg-bright};
        --text-2: #${colors.fg};
        --text-3: #${colors.fg};
        --text-4: #${colors.fg-muted};
        --text-5: #${colors.fg-muted};

        /* background and dark colors */
        --bg-1: #${colors.bg-highlight};
        --bg-2: #${colors.bg-surface};
        --bg-3: #${colors.bg-surface};
        --bg-4: #${colors.bg};
        --hover: rgba(59, 66, 97, 0.1);
        --active: rgba(59, 66, 97, 0.2);
        --active-2: rgba(59, 66, 97, 0.3);
        --message-hover: var(--hover);

        /* accent colors */
        --accent-1: #${colors.accent};
        --accent-2: #${colors.accent};
        --accent-3: #${colors.accent};
        --accent-4: #${colors.accent-soft};
        --accent-5: #${colors.accent-soft};
        --accent-new: #${colors.red};
        --mention: linear-gradient(to right, rgba(178, 78, 255, 0.1) 40%, transparent);
        --mention-hover: linear-gradient(to right, rgba(178, 78, 255, 0.05) 40%, transparent);
        --reply: linear-gradient(to right, rgba(169, 177, 214, 0.1) 40%, transparent);
        --reply-hover: linear-gradient(to right, rgba(169, 177, 214, 0.05) 40%, transparent);

        /* status indicator colors */
        --online: #${colors.green};
        --dnd: #${colors.red};
        --idle: #${colors.yellow};
        --streaming: #${colors.accent};
        --offline: #${colors.fg-muted};

        /* border colors */
        --border-light: var(--hover);
        --border: var(--active);
        --border-hover: var(--accent-2);
        --button-border: rgba(192, 202, 245, 0.1);

        /* base colors — Night Purple variants */
        --red-1: #${colors.red};
        --red-2: #${colors.red};
        --red-3: #${colors.red};
        --red-4: #${colors.red};
        --red-5: #${colors.red};

        --green-1: #${colors.green};
        --green-2: #${colors.green};
        --green-3: #${colors.green};
        --green-4: #${colors.green};
        --green-5: #${colors.green};

        --blue-1: #${colors.cyan};
        --blue-2: #${colors.cyan};
        --blue-3: #${colors.cyan};
        --blue-4: #${colors.cyan};
        --blue-5: #${colors.cyan};

        --yellow-1: #${colors.yellow};
        --yellow-2: #${colors.yellow};
        --yellow-3: #${colors.yellow};
        --yellow-4: #${colors.yellow};
        --yellow-5: #${colors.yellow};

        --purple-1: #${colors.accent};
        --purple-2: #${colors.accent};
        --purple-3: #${colors.accent};
        --purple-4: #${colors.accent-soft};
        --purple-5: #${colors.accent-soft};
    }
  '';
in
{
  home.file.".config/vesktop/themes/night-purple.theme.css".text = themeCSS;
}
