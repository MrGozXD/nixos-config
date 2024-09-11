{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Fix for hyprland https://github.com/hyprwm/Hyprland/issues/5891
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    stylix.url = "github:danth/stylix";
    # https://github.com/catppuccin/nix
    catppuccin.url = "github:catppuccin/nix";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      stylix,
      catppuccin,
      spicetify-nix,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
    in
    #pkgs = import nixpkgs { system = system; };
    {
      # Please replace my-nixos with your hostname
      nixosConfigurations.mrgozxd = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };
        modules = [
          ./nixos/configuration.nix
          catppuccin.nixosModules.catppuccin
          #stylix.nixosModules.stylix
          #inputs.nixvim.nixosModules.nixvim
          # if you use home-manager

        ];
      };

      homeConfigurations.mrgozxd = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        #inherit pkgs;
        extraSpecialArgs = {
          inherit inputs system;
        };
        modules = [
          stylix.homeManagerModules.stylix
          ./home-manager/home.nix
          catppuccin.homeManagerModules.catppuccin
          #spicetify-nix.homeManagerModules.default
        ];
      };
    };
}
