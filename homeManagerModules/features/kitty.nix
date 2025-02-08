{lib, ...}: {
  programs.kitty.enable = true;
  programs.kitty.settings = lib.mkForce {
    confirm_os_window_close = 0;
    dynamic_background_opacity = true;
    mouse_hide_wait = "-1.0";
    window_padding_width = 0;
    background_opacity = "1";
    background_blur = 5;
  };
}
