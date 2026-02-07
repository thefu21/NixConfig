{
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    config = {
      experimental-features = "nix-command flakes";
    };
  };

  myHomeManager.fish.enable = lib.mkDefault true;
  myHomeManager.nvf.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.starship.enable = lib.mkDefault true;
  myHomeManager.sops.enable = lib.mkDefault true;
  myHomeManager.nextcloud.enable = lib.mkDefault true;
  myHomeManager.lf.enable = lib.mkDefault true;
  myHomeManager.kitty.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    lazygit
    rustdesk-flutter
    evince
    alacritty
    firefox
    thunderbird
    libreoffice
    xfce4-exo
    (thunar.override {
      thunarPlugins = [thunar-archive-plugin thunar-volman];
    })
    tumbler
    pdfarranger
    xfconf
    file-roller
    libnotify
    feh
    qimgv
    fastfetch
    networkmanagerapplet
    pavucontrol
    vlc
    inetutils
    yubioath-flutter
    yubikey-manager
    discord
    inkscape
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
