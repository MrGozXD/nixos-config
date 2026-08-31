{ pkgs, ... }:
{
  imports = [
    ../../modules/home
  ];

  home.packages = with pkgs; [ github-cli pokeget-rs ];

  home = {
    username = "mrgozxd";
    homeDirectory = "/home/mrgozxd";
    sessionPath = [
      "$HOME/.bun/bin"
      "$HOME/.local/bin"
      "$HOME/nixos/dev"
    ];
    sessionVariables = {
      EDITOR = "code";
      BROWSER = "vivaldi";
      TERMINAL = "kitty";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };
    stateVersion = "23.11";

    file.".local/bin/new-rust-project" = {
      text = ''
        #!/usr/bin/env bash
        set -euo pipefail
        exec /home/mrgozxd/nixos/dev/new-rust-project.sh "$@"
      '';
      executable = true;
    };

    file.".local/bin/pokefetch" = {
      text = ''
        #!/usr/bin/env bash
        set -euo pipefail

        WIDTH=38
        EXTRA_PADDING_H=2
        EXTRA_PADDING_W=0

        POKEMON_LIST=(
          gengar
          "gengar --mega"
          "gengar --gmax"
        )

        fetcher_height=$(fastfetch --logo none | wc -l)

        sprite=$(pokeget ''${POKEMON_LIST[RANDOM % ''${#POKEMON_LIST[@]}]} --hide-name)
        height=$(echo "$sprite" | wc -l)

        pad_top=$(( (fetcher_height - height) / 2 + EXTRA_PADDING_H ))
        (( pad_top < 0 )) && pad_top=0

        sprite_width=$(
          printf '%s\n' "$sprite" \
            | sed $'s/\x1b\\[[0-9;]*m//g' \
            | awk '{ if (length > max) max = length } END { print max }'
        )

        pad_left=$(( (WIDTH - sprite_width) / 2 + EXTRA_PADDING_W ))
        pad_right=$(( (WIDTH - sprite_width + 1) / 2 + EXTRA_PADDING_W ))
        (( pad_left < 0 )) && pad_left=0
        (( pad_right < 0 )) && pad_right=0

        echo "$sprite" | fastfetch --file-raw - \
          --logo-padding-top "$pad_top" \
          --logo-padding-left "$pad_left" \
          --logo-padding-right "$pad_right"
      '';
      executable = true;
    };

  };
}
