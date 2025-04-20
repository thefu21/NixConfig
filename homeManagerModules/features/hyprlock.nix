{
  config,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general.hide_cursor = true;
      label = [
        {
          text = "<b>$TIME</b>";
          font_size = 150;
          color = "rgb(${config.stylix.base16Scheme.base05})";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update:3600] bash -c 'echo "<b> $(date +'"'"'%A, %-d %B %Y'"'"') </b>"' '';
          font_size = 30;
          color = "rgb(${config.stylix.base16Scheme.base05})";
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
      ];

      background = lib.mkMerge [
        {
          blur_passes = 2;
          blur_size = 7;
        }
      ];
    };
  };
}
