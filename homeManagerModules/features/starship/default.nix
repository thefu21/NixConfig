{ config, lib, ... }: 

with config.lib.stylix.colors.withHashtag;

{
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML ((builtins.readFile ./starship.toml)) // {
      palettes.stylix = {
        color_0 = base00;
        color_1 = base01;
        color_2 = base02;
        color_3 = base03;
        color_4 = base04;
        color_5 = base05;
        color_6 = base06;
        color_7 = base07;
        color_8 = base08;
        color_9 = base09;
        color_10 = base0A;
        color_11 = base0B;
        color_12 = base0C;
        color_13 = base0D;
        color_14 = base0E;
        color_15 = base0F;
      };
    };
  };
}
