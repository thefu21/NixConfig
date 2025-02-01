{ pkgs, inputs, ... }: {

  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = {
      base00 = "000000"; # base
      base01 = "181825"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    };

    image = ../../wallpapers/cabin-4.png;

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
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    targets.waybar.enable = false;

    polarity = "dark";

  };
}
