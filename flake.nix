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

    #Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    myLib = import ./myLib/default.nix { inherit inputs; };
  in
    with myLib; {
      nixosConfigurations = {
        laptop = mkSystem ./hosts/laptop/configuration.nix;
      };

      homeConfigurations = {
        "thefu21@nixos" = mkHome "x86_64-linux" ./hosts/laptop/home.nix;
      };

      nixosModules.default = ./nixosModules;
      homeManagerModules.default = ./homeManagerModules;
    };
}
