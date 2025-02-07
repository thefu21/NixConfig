{pkgs, lib, ...}: {
  programs.nm-applet.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  myNixOS = {
    sddm.enable = lib.mkDefault true;
    sops.enable = lib.mkDefault true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.desktopManager.xterm.enable = false;
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "alacritty.desktop" ];
    };
  };

  programs.fish.enable = true;
  users.users.thefu21.shell = pkgs.fish;
}
