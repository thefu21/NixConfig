{
  outputs,
  pkgs,
  ...
}: {
  imports = [outputs.homeManagerModules.default];

  home.username = "thefu21";
  home.homeDirectory = "/home/thefu21";

  home.packages = with pkgs; [
    virt-viewer
    gns3-gui
    ciscoPacketTracer8
    wireshark
  ];

  home.file = {
  };

  myHomeManager = {
    bundles.desktop-hyprland.enable = true;
#    bundles.gaming.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = _: true;

  programs.home-manager.enable = true;


  home.stateVersion = "24.11"; # Please read the comment before changing.
}
