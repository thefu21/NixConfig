{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.phpstorm
    jetbrains.datagrip
    jetbrains.clion
    jetbrains.webstorm
  ];
}
