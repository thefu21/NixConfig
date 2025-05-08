{
  pkgs,
  lib,
  ...
}: {
  services.displayManager = {
    sessionPackages = [pkgs.hyprland];

    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = lib.mkForce pkgs.kdePackages.sddm;
    };
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "16";
      background = "${../../wallpapers/dracula/landscape.jpg}";
      loginBackground = true;
    })
  ];

  services.xserver.enable = true;
}
