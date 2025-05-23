{config, ...}:
with config.lib.stylix.colors.withHashtag; {
  programs.waybar = {
    enable = true;

    settings = {
      waybar = {
        layer = "bottom";
        position = "top";
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;
        spacing = 10;
        name = "waybar";
        mode = "dock";
        start_hidden = false;
        exclusive = true;
        fixed-center = true;
        reload_style_on_change = true;

        modules-left = ["custom/logo" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["group/systray" "cpu" "memory" "battery" "network" "pulseaudio" "backlight" "clock" "custom/notification"];

        "custom/notification" = {
          tooltip = false;
          format = "{icon} ";
          format-icons = {
            notification = "󰂚<span foreground='red'><sup></sup></span>";
            none = "󰂚";
            dnd-notification = "󰂛<span foreground='red'><sup></sup></span>";
            dnd-none = "󰂛";
            inhibited-notification = "󰂛<span foreground='red'><sup></sup></span>";
            inhibited-none = "󰂚";
            dnd-inhibited-notification = "󰂛<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "󰂛";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = true;
          format = "{name}";
          format-icons = {
            active = "";
            default = "";
            sort-by-number = true;
            urgent = "";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{title}";
          rewrite = {
          };
        };

        "group/systray" = {
          "orientation" = "horizontal";
          "modules" = ["custom/showtray" "tray"];
          "drawer" = {
            "transition-duration" = 300;
            "children-class" = "minimized";
          };
        };

        "custom/showtray" = {
          "format" = "";
          "tooltip" = false;
        };

        tray = {
          icon-size = 20;
          spacing = 5;
        };

        cpu = {
          interval = 5;
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          interval = 5;
          format = "  {used:0.1f}GiB";
          tooltip = false;
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = ["󰃞" "󰃟" "󰃠"];
          tooltip = false;
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-full = "󰁹 100%";
          interval = 5;
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
        };

        bluetooth = {
          format = "";
          format-connected = " {num_connections}";
          format-disabled = "";
          tooltip-format = " {device_alias}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias}";
        };

        network = {
          format-disconnected = " Disconnected";
          format-ethernet = "󱘖 Wired";
          format-linked = "󱘖 {ifname} (No IP)";
          format-wifi = "󰤨 {essid}";
          interval = 5;
          max-length = 30;
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          tooltip = true;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " ";
          on-click-right = "pavucontrol";
          format-icons = {
            default = ["" " " " " " " " " " " " "];
          };
          tooltip = false;
        };

        clock = {
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            format = {
              days = "<span><b>{}</b></span>";
              months = "<span><b>{}</b></span>";
              today = "<span><b><u>{}</u></b></span>";
            };
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
            on-scroll = 1;
            weeks-pos = "right";
          };
          format = "󰥔  {:%H:%M}";
          format-alt = "󰥔  {:%A, %d.%m.%Y (%R)} ";
          tooltip-format = ''
            <span>{calendar}</span>'';
        };

        "custom/logo" = {
          exec = "echo ' '";
          format = "{}";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        min-height: 0px;
      }

      window#waybar {
        background-color: transparent;
      }

      window#waybar > box {
        border-radius: 10px;
        margin: 4px 4px 4px 4px;
        padding: 0 4px;
        background-color: ${base00};
        box-shadow: 0px 0px 3px 0px ${base00};
      }

      tooltip {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
        color: ${base05};
        background-color: ${base00};
        border-radius: 10px;
      }

      #workspaces {
        font-size: 0px;
        background: ${base00};
        margin-top: 3px;
        margin-bottom: 3px;
        padding: 10px 0px;
      }

      #workspaces button {
        padding: 0px;
        margin: 0px 5px;
        min-width: 10px;
        min-height: 10px;
        border-radius: 10px;
        background: ${base07};
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
        background: ${base02};
      }

      #workspaces button.active {
        background: ${base0D};
        min-width: 40px;
      }

      #workspaces button:hover {
        background: ${base06};
        min-width: 40px;
        background-size: 400% 400%;
      }

      #window,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #battery,
      #backlight,
      #clock,
      #custom-notification
      {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
      }

      #custom-showtray {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 14px;
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #tray {
        padding-left: 2px;
        padding-right: 2px;
      }

      #cpu {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #battery {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #memory {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #network {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #pulseaudio {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #clock {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #custom-notification {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #custom-logo {
       color: ${base0D};
       font-size: 24px;
      }

      #backlight {
        color: ${base05};
        padding-left: 2px;
        padding-right: 2px;
      }
    '';
  };
}
