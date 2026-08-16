{ pkgs }:
let
  shells = [
    ./java.nix
    ./cpp.nix
  ];
  merge = builtins.foldl' (acc: file: acc // (import file { inherit pkgs; })) { };
in
merge shells
