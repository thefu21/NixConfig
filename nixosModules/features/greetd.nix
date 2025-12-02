{lib, pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = lib.mkDefault "${pkgs.tuigreet}/bin/tuigreet --time --cmd '${pkgs.hyprland}/bin/Hyprland' --user-menu --user-menu-min-uid 1000 --remember";
        user = "greeter";
      };
    };
  };
}
