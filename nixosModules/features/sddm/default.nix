{ pkgs, lib, ... }: {
  services.displayManager = {
    sessionPackages = [pkgs.hyprland];

    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catpucchin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font  = "Noto Sans";
      fontSize = "9";
      loginBackground = true;
      background = "${../../../wallpapers/cabin-4.png}";
    })
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  services.xserver.enable = true;
}
