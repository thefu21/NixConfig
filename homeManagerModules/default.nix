{ pkgs, config, lib, ... }: let
  cfg = config.myHomeManager;
in {
  imports = [
    ./features/hyprland.nix
    ./features/hyprlock.nix
    ./features/hypridle.nix
    ./features/stylix.nix
    ./features/git.nix
    ./features/nextcloud.nix
    ./features/sops.nix
    ./features/fish.nix
    ./features/starship
    ./features/nvf.nix
    ./features/swaync.nix
  ];
}
