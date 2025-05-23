{ config, ... }: {
  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = {
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
      ignore_dbus_inhibit = false;
      lock_cmd = "pidof hyprlock || hyprlock";
    };

    listener = [
      {
        timeout = 150;
        on-timeout = "brightnessctl -s set 1%";
        on-resume = "brightnessctl -r";
      }
      {
        timeout = 150;
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
        on-resume = "brightnessctl -rd rgb:kbd_backlight";
      }
      {
        timeout = 300;
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 330;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 1800;
        on-timeout = "systemd-ac-power || systemctl suspend";
      }
    ];
  };
}
