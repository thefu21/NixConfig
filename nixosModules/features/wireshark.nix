{pkgs, ...}: {
  programs.wireshark.dumpcap.enable = true;
  programs.wireshark.usbmon.enable = true;
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    wireshark
  ];
}
