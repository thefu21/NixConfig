{
  outputs,
  pkgs,
  ...
}: {
  imports = [outputs.homeManagerModules.default];

  home.username = "thefu21";
  home.homeDirectory = "/home/thefu21";

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  myHomeManager = {
    bundles.desktop-hyprland.enable = true;
  };

  programs.home-manager.enable = true;


  home.stateVersion = "24.11"; # Please read the comment before changing.
}
