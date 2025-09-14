{ pkgs, lib, ... }: {
  services.displayManager = {
    sessionPackages = [pkgs.hyprland];
    ly = {
      enable = true;
      settings = {
        tty = lib.mkForce 2;
      };
    };
  };
}
