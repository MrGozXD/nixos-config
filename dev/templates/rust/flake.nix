{
  description = "Rust project flake template (dev shell)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          rust = pkgs.mkShell {
            buildInputs = with pkgs; [
              rustc # The Rust compiler itself
              cargo # Rust's package manager and build tool (build, run, test, publish)
              rustfmt # Official code formatter, keeps style consistent (cargo fmt)
              clippy # Official linter, catches common mistakes and non-idiomatic code (cargo clippy)
              rust-analyzer # LSP server powering IDE features: autocomplete, go-to-def, inline errors, etc.
              bacon # Background code checker that re-runs cargo check/test/clippy on file save
              cargo-expand # Shows the result of macro expansion, useful for debugging macros
            ];
            shellHook = ''
              echo "Rust $(rustc --version)"
            '';
          };
          default = self.devShells.${system}.rust;
        }
      );
    };
}
