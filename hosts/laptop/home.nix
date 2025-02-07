{ config, pkgs, ... }:

{
  home.username = "thefu21";
  home.homeDirectory = "/home/thefu21";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    libreoffice
    hyprshot
    xfce.exo
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    xfce.xfconf
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  programs.home-manager.enable = true; 
}
