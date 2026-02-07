{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.phpstorm
    jetbrains.datagrip
    jetbrains.clion
    jetbrains.webstorm
    python3
  ];
}
