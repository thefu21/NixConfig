{
  pkgs,
  lib,
  ...
}: {
  programs.nm-applet.enable = true;

  services.gnome.gnome-keyring.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gvfs.enable = true;
  boot.supportedFilesystems = ["ntfs"];

  myNixOS = {
    ly.enable = lib.mkDefault true;
    sops.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault true;
  };

  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.desktopManager.xterm.enable = false;
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = ["kitty.desktop"];
    };
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    brightnessctl
  ];

  programs.fish.enable = true;
  users.users.thefu21.shell = pkgs.fish;
}
