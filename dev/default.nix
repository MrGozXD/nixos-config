{ pkgs }:
let
  shells = [
    ./java.nix
    ./cpp.nix
    ./rust.nix
  ];
  merge = builtins.foldl' (acc: file: acc // (import file { inherit pkgs; })) {};
in
merge shells
