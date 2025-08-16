{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    settings = {
      windows = {
        overview = {
          enable = true;
          key = "";
          # modifier = "super";
          launcher = {
            enable = false;
            max_items = 6;
            plugins.websearch = {
              enable = true;
              engines = [
                {
                  name = "DuckDuckGo";
                  url = "https://duckduckgo.com/?q=%s";
                  key = "d";
                }
              ];
            };
          };
        };
      };
    };

    styleFile = with config.lib.stylix.colors.withHashtag; ''
      :root {
          --border-color: ${base0D};
          --border-color-active: ${base0D};

          --bg-color: ${base00};
          --bg-color-hover: ${base00};

          --border-radius: 10px;
          --border-size: 2px;
          --border-style: solid;
          --border-style-secondary: none;

          --text-color: ${base05};

          --window-padding: 2px;
      }

      .workspace.active {
          background: ${base0D};
      	  color: ${base0D};
      }

      .client.active {
          background: ${base0D};
      	  color: ${base0D};
      }
    '';
  };
}
