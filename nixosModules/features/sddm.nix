{ pkgs, lib, ... }: {
  services.displayManager = {
    sessionPackages = [pkgs.hyprland];

    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font  = "Noto Sans";
      fontSize = "9";
      background = "${../../../wallpapers/cabin-4.png}";
      loginBackground = true;
    })
  ];

  services.xserver.enable = true;
}
