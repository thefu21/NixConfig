{ input }: let
  myLib = (import ./default.nix) {inherit inputs;};
  outputs = inputs.self.outputs
in rec {
  mkSystem = config:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs myLib;
      };
      modules = [
        config
	outputs.nixosModules.default
      ];
    };
}
