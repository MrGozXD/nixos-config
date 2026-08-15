{
  description = "NixOS config flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Catppuccin
    catppuccin.url = "github:catppuccin/nix";

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NVF
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia shell
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
    };
  };

  outputs =
    { nixpkgs, nixpkgs-stable, home-manager, stylix, catppuccin, nvf, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      colors = import ./lib/colors.nix;
    in
    {
      nixosConfigurations.mrgozxd = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
          inherit colors;
        };
        modules = [
          ./hosts/laptop
          catppuccin.nixosModules.catppuccin
          nvf.nixosModules.default
        ];
      };

      homeConfigurations.mrgozxd = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs system;
          inherit colors;
        };
        modules = [
          stylix.homeModules.stylix
          ./home/mrgozxd/home.nix
          catppuccin.homeModules.catppuccin
        ];
      };

      devShells.${system} = import ./dev { inherit pkgs; };
    };
}
