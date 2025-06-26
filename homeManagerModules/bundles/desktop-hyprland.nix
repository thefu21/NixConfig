{
  lib,
  pkgs,
  ...
}: {
  myHomeManager = {
    bundles.desktop-base.enable = lib.mkDefault true;
    hyprland.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    wofi.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    swaync.enable = lib.mkDefault true;
    zathura.enable = lib.mkDefault true;
  };

  home.packages = with pkgs; [
    hyprshot
    nwg-displays
    hyprshell
  ];
}
