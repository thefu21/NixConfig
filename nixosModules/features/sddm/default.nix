{ pkgs, lib, ... }: {
  services.displayManager = {
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
      loginBackground = true;
      background = "${../../../wallpapers/cabin-4.png}";
    })
  ];

  services.xserver.enable = true;
}
