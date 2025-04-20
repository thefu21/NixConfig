{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    platformio-core
    openocd
  ];

  services.udev.packages = with pkgs; [
    platformio-core.udev
  ];
}
