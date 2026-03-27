{
  pkgs,
  pkgsGns3,
  ...
}: {
  home.packages = [
    pkgs.tigervnc

    pkgsGns3.gns3-gui
    pkgsGns3.gns3-server
    pkgsGns3.ubridge
  ];
}
