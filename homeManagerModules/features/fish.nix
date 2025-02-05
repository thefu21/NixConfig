{ config, pkgs, ... }:

with config.stylix.base16Scheme;

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellInit = ''
      set -g fish_color_command ${base0D}
      set -g fish_color_quote ${base0F}
      set -g fish_color_error ${base08}
      set -g fish_color_param ${base07}
      set -g fish_color_comment ${base04}
      set -g fish_color_operator ${base00}
      set -g fish_color_autosuggestion ${base05}
    '';
  };
}
