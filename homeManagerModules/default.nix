{ pkgs, config, lib, ... }: let
  cfg = config.myHomeManager;
in {
  imports = [
    ./features/hyprland.nix
    ./features/stylix.nix
    ./features/git.nix
  ];
}
