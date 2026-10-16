{
  description = "Nix-darwin configuration for MacBook - Terminal only";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, darwin, stylix, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      colors = import ./lib/colors.nix;
    in
    {
      darwinConfigurations.macbook = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs pkgs colors; };
        modules = [ ./hosts/macbook/default.nix ];
      };

      homeConfigurations.macbook = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = { inherit inputs system colors; };
        modules = [
          stylix.homeModules.stylix
          ./modules/home/core/style.nix
          ./modules/home/core/vscode-theme.nix
          ./modules/home/desktop/obsidian-theme.nix
          ./modules/home/core/shell/zsh.nix
          ./modules/home/core/shell/zoxide.nix
          ./modules/home/programs/yazi.nix
          ./modules/home/terminals/kitty.nix
          ./hosts/macbook/home.nix
        ];
      };
    };
}
