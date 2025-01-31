{
  description = "NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
#    myLib = import ./myLib/default.nix { inherit inputs; };

    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {

  nixosConfigurations = {
    laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
        ./hosts/laptop/configuration.nix
	#./nixosModules
      ];
    };
  };

  homeConfigurations = {
      "thefu21@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit system; };
        modules = [
	  ./hosts/laptop/home.nix
	  ./homeManagerModules
	];
      };
    };

  };

#  homeManagerModules.default = ./homeManagerModules;
#  nixosModules.default = ./nixosModules;
}
