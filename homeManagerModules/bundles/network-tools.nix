{pkgs, ...}: {
  home.packages = with pkgs; [
    gns3-gui
    tigervnc
    ciscoPacketTracer8
  ];
}
