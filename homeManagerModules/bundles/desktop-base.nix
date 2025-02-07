{
  pkgs,
  lib,
  ...
}: {
  myHomeManager.fish.enable = lib.mkDefault true;
  myHomeManager.nvf.enable = lib.mkDefault true;
  myHomeManager.stylix.enable = lib.mkDefault true;
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.starship.enable = lib.mkDefault true;
  myHomeManager.sops.enable = lib.mkDefault true;
  myHomeManager.nextcloud.enable = lib.mkDefault true;
  myHomeManager.lf.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    kitty
    firefox
    libreoffice
    xfce.exo
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    xfce.xfconf
    libnotify
    feh
    neofetch
    networkmanagerapplet
    pavucontrol
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
