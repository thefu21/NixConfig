{
  config,
  ...
}: {
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

        modules-left = [ "custom/logo"  "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "group/systray" "cpu" "memory" "battery" "network" "pulseaudio" "backlight" "clock" ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          format = "";
          format-icons = {
            active = "";
            default = "";
            sort-by-number = true;
            urgent = "";
          };
          persistent-workspaces = {
            "*" = 9;
          };
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{class}";
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
            <span size='9pt'>{calendar}</span>'';
        };

        "custom/logo" = {
          exec = "echo ' '";
          format = "{}";
        };
      };
    };

    style = let
      colors = config.stylix.base16Scheme;
    in ''
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
        background-color: #${colors.base00};
        box-shadow: 0px 0px 3px 0px #${colors.base00};
      }

      tooltip {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
        color: #${colors.base05};
        background-color: #${colors.base00};
        border-radius: 10px;
      }

      #workspaces {
        font-size: 0px;
        background: #${colors.base00};
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
        background: #${colors.base07};
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
        background: #${colors.base02};
      }

      #workspaces button.active {
        background: #${colors.base0D};
        min-width: 40px;
      }

      #workspaces button:hover {
        background: #${colors.base06};
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
      #clock {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
      }

      #custom-showtray {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 14px;
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #tray {
        padding-left: 2px;
        padding-right: 2px;
      }

      #cpu {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #battery {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #memory {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #network {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #pulseaudio {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #clock {
        color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }

      #custom-logo {
	color: #${colors.base0D};
	font-size: 24px;
      }

      #backlight {
	color: #${colors.base05};
        padding-left: 2px;
        padding-right: 2px;
      }
    '';
  };
}
