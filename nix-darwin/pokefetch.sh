#!/usr/bin/env bash
set -euo pipefail

WIDTH=38
EXTRA_PADDING_H=2
EXTRA_PADDING_W=0

POKEMON_LIST=(gengar)

fetcher_height=$(fastfetch --logo none | wc -l)

# Try pokeget-rs first, then pokeget
POKEGET_CMD=$(command -v pokeget-rs >/dev/null 2>&1 && echo "pokeget-rs" || echo "pokeget")
sprite=$($POKEGET_CMD "${POKEMON_LIST[RANDOM % ${#POKEMON_LIST[@]}]}" --hide-name)
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
