{ config, pkgs, ... }:

{
  home.username = "thefu21";
  home.homeDirectory = "/home/thefu21";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  programs.fish = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true; 
}
