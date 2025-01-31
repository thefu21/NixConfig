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
        modules-right = [ "cpu" "memory" "battery" "network" "pulseaudio" "backlight" "clock" ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          format = "{name}";
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
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              months = "<span color='#ffead3'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
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
      rosewater = "#f5e0dc";
      flamingo  = "#f2cdcd";
      pink      = "#f5c2e7";
      mauve     = "#cba6f7";
      red       = "#f38ba8";
      maroon    = "#eba0ac";
      peach     = "#fab387";
      yellow    = "#f9e2af";
      green     = "#a6e3a1";
      teal      = "#94e2d5";
      sky       = "#89dceb";
      sapphire  = "#74c7ec";
      blue      = "#89b4fa";
      lavender  = "#b4befe";
      text      = "#cdd6f4";
      subtext1  = "#bac2de";
      subtext0  = "#a6adc8";
      overlay2  = "#9399b2";
      overlay1  = "#7f849c";
      overlay0  = "#6c7086";
      surface2  = "#585b70";
      surface1  = "#45475a";
      surface0  = "#313244";
      base      = "#000000";
      mantle    = "#000000";
      crust     = "#000000";
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
        background-color: ${base};
        box-shadow: 0px 0px 3px 0px ${base};
      }

      tooltip {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
        background-color: ${base};
        border-radius: 10px;
      }

      #image {
        padding-left: 8px;
      }

      #workspaces {
        font-size: 0px;
        background: ${base};
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
        background: ${lavender};
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
        background: ${surface0};
      }

      #workspaces button.active {
        background: ${blue};
        min-width: 40px;
        background-size: 400% 400%;
      }

      #workspaces button:hover {
        background: ${sapphire};
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
        color: ${text};
        padding-left: 2px;
        padding-right: 2px;
      }

      #tray {
        padding-left: 2px;
        padding-right: 2px;
      }

      #cpu {
        color: ${green};
        padding-left: 2px;
        padding-right: 2px;
      }

      #battery {
        color: ${green};
        padding-left: 2px;
        padding-right: 2px;
      }

      #memory {
        color: ${red};
        padding-left: 2px;
        padding-right: 2px;
      }

      #network {
        color: ${teal};
        padding-left: 2px;
        padding-right: 2px;
      }

      #pulseaudio {
        color: ${rosewater};
        padding-left: 2px;
        padding-right: 2px;
      }

      #clock {
        color: ${peach};
        padding-left: 2px;
        padding-right: 2px;
      }

      #custom-logo {
	color: ${blue};
	font-size: 24px;
      }

      #backlight {
	color: ${blue};
        padding-left: 2px;
        padding-right: 2px;
      }
    '';
  };
}
