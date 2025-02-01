{ pkgs, config, lib, ... }: let
  cfg = config.myHomeManager;
in {
  imports = [
    ./features/hyprland.nix
    ./features/stylix.nix
#    ./features/gtk.nix
    ./features/git.nix
  ];
}
