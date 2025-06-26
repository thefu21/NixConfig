{pkgs, ...}: {
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    geary
    gnome-disk-utility
    adwaita-icon-theme
    gnome-backgrounds
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs
    epiphany
    gnome-text-editor
    # gnome-calculator
    gnome-calendar
    gnome-characters
    # gnome-clocks
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    nautilus
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
    gnome-software
  ];
}
