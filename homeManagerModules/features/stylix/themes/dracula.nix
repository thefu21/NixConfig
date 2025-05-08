{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;

    # base16Scheme = {
    #   base00 = "000000"; # Hintergrund – echtes Schwarz
    #   base01 = "111111"; # Dunkles Grau
    #   base02 = "222222"; # Etwas helleres Dunkelgrau
    #   base03 = "333333"; # Kommentar-/Low-Priority-Farbe
    #   base04 = "444444"; # Mid-gray (optional für Akzente)
    #   base05 = "cccccc"; # Standard-Textfarbe (helles Grau)
    #   base06 = "e0e0e0"; # Noch hellerer Text (z.B. UI)
    #   base07 = "ffffff"; # Weiß – evtl. für Highlights
    #
    #   # Farbakzente unverändert gelassen, aber du kannst sie bei Bedarf auch entsättigen
    #   base08 = "ea51b2";
    #   base09 = "b45bcf";
    #   base0A = "00f769";
    #   base0B = "ebff87";
    #   base0C = "a1efe4";
    #   base0D = "62d6e8";
    #   base0E = "b45bcf";
    #   base0F = "00f769";
    # };

    base16Scheme = {
      base00 = "#282a36";
      base01 = "#363447";
      base02 = "#44475a";
      base03 = "#6272a4";
      base04 = "#9ea8c7";
      base05 = "#f8f8f2";
      base06 = "#f0f1f4";
      base07 = "#ffffff";
      base08 = "#ff5555";
      base09 = "#ffb86c";
      base0A = "#f1fa8c";
      base0B = "#50fa7b";
      base0C = "#8be9fd";
      base0D = "#80bfff";
      base0E = "#ff79c6";
      base0F = "#bd93f9";
    };

    image = ../../../../wallpapers/dracula/landscape.jpg;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    iconTheme = {
      enable = true;
      package = pkgs.dracula-icon-theme;
      light = "Dracula";
      dark = "Dracula";
    };

    polarity = "dark";

    targets.waybar.enable = false;
    targets.wofi.enable = false;
  };
}
