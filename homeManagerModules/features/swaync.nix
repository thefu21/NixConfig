{ config, ... }: {
  services.swaync.enable = true;
  services.swaync.settings = {
    positionX = "right";
    positionY = "top";
    cssPriority = "user";
    control-center-margin-top = 10;
    control-center-margin-bottom = 10;
    control-center-margin-right = 10;
    notification-icon-size = 64;
    notification-body-image-height = 100;
    notification-body-image-width = 200;
    timeout = 10;
    timeout-low = 5;
    timeout-critical = 0;
    fit-to-screen = false;
    control-center-width = 400;
    control-center-height = 600;
    notification-window-width = 400;
    keyboard-shortcuts = true;
    image-visibility = "when-available";
    transition-time = 200;
    hide-on-clear = false;
    hide-on-action = true;
    script-fail-notify = true;
    widgets = ["buttons-grid" "title" "notifications" "mpris"];
    widget-config = {
      title = {
        text = "Notification Center";
        clear-all-button = true;
        button-text = "󰆴 Clear All";
      };
      dnd = {
        text = "Do Not Disturb";
      };
      label = {
        max-lines = 1;
        text = "Notification Center";
      };
      mpris = {
        image-size = 96;
        image-radius = 7;
      };
      volume = {
        label = "󰕾";
      };
      backlight = {
        label = "󰃟";
      };
      "buttons-grid" = {
        actions = [
          {
            label = "󰐥";
            command = "systemctl poweroff";
          }
          {
            label = "󰜉";
            command = "systemctl reboot";
          }
          {
            label = "󰌾";
            command = "hyprlock";
          }
          {
            label = "󰍃";
            command = "hyprctl dispatch exit";
          }
          {
            label = "󰏥";
            command = "systemctl suspend";
          }
          {
            label = "󰖩";
            command = "nm-connection-editor";
          }
          {
            label = "󰂯";
            command = "blueman-manager";
          }
        ];
      };
    };
  };
  services.swaync.style = with config.lib.stylix.colors.withHashtag; ''
    progress,
    progressbar,
    trough {
      border: 1px solid ${base0D};
    }
    
    trough {
      background: @base01;
    }
    
    .notification.low,
    .notification.normal {
      border: 1px solid ${base0D};
    }
    
    .notification.low progress,
    .notification.normal progress {
      background: @base0F;
    }
    
    .notification.critical {
      border: 1px solid @base08;
    }
    
    .notification.critical progress {
      background: @base08;
    }
    
    .summary {
      color: @base05;
    }
    
    .body {
      color: @base05;
    }
    
    .time {
      color: @base05;
    }
    
    .notification-action {
      color: @base05;
      background: @base01;
      border: 1px solid @base0D;
    }
    
    .notification-action:hover {
      background: @base01;
      color: @base05;
    }
    
    .notification-action:active {
      background: @base0F;
      color: @base05;
    }
    
    .close-button {
      color: @base02;
      background: @base08;
    }
    
    .close-button:hover {
      background: lighter(@base08);
      color: lighter(@base02);
    }
    
    .close-button:active {
      background: @base08;
      color: @base00;
    }
    
    .notification-content {
      background: @base00;
    }
    
    .floating-notifications.background .notification-row .notification-background {
      background: transparent;
      color: @base05;
    }
    
    .notification-group .notification-group-buttons,
    .notification-group .notification-group-headers {
      color: @base05;
    }
    
    .notification-group .notification-group-headers .notification-group-icon {
      color: @base05;
    }
    
    .notification-group .notification-group-headers .notification-group-header {
      color: @base05;
    }
    
    .notification-group.collapsed .notification-row .notification {
      background: @base01;
    }
    
    .notification-group.collapsed:hover
      .notification-row:not(:only-child)
      .notification {
      background: @base01;
    }
    
    .control-center {
      background-color: ${base00};
      color: @base05;
      border: solid ${base0D} 1px;
    }
    
    .control-center .notification-row .notification-background {
      background: @base00;
      color: @base05;
    }
    
    .control-center .notification-row .notification-background:hover {
      background: @base00;
      color: @base05;
    }
    
    .control-center .notification-row .notification-background:active {
      background: @base0F;
      color: @base05;
    }
    
    .widget-title {
      color: @base05;
      margin: 0.5rem;
    }
    
    .widget-title > button {
      background-color: ${base01};
      border: none;
      border-radius: 4px;
      color: @base05;
    }
    
    .widget-title > button:hover {
      background-color: ${base02};
    }
    
    .widget-dnd {
      color: @base05;
    }
    
    .widget-dnd > switch {
      background: @base01;
      border: none;
    }
    
    .widget-dnd > switch:hover {
      background: @base01;
    }
    
    .widget-dnd > switch:checked {
      background: @base0F;
    }
    
    .widget-dnd > switch slider {
      background: @base06;
    }
    
    .widget-mpris {
      color: @base05;
    }
    
    .widget-mpris .widget-mpris-player {
      border: none;
      background-color: ${base01};
    }
    
    .widget-mpris .widget-mpris-player button:hover {
    }
    
    .widget-mpris .widget-mpris-player > box > button {
    }
    
    .widget-mpris .widget-mpris-player > box > button:hover {
    }
    
    .widget-buttons-grid{
      background-color: ${base00};
    }
    
    .widget-buttons-grid>flowbox>flowboxchild>button{
      border-radius: 4px;
      background-color: ${base01};
    }
    
    .widget-buttons-grid>flowbox>flowboxchild>button:hover {
      background: @base04;
      background-color: ${base02};
    }
  '';
}
