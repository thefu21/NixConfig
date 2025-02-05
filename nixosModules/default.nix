{inputs, pkgs, ...}: {
  imports = [
    ./features/sddm.nix
    ./features/sops.nix
  ];
}

