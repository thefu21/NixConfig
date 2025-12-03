{
  pkgs,
  config,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 1;
    clock24 = true;
    shortcut = "s";
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      set -g renumber-windows on
      set -g status-position top
      set -g status-interval 2

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Remove borders that cause the left gap
      set -g status-position top
      set -g status-style "bg=default"

      # Rounded icons
      set -g @l ""
      set -g @r ""

      # LEFT
      set -g status-left '#{?client_prefix,\
      #[fg=default bg=${colors.base01}] #[bg=${colors.base01} fg=${colors.base05}]#S #[bg=${colors.base09} fg=${colors.base00}] #[fg=${colors.base09} bg=default]#{@r}#[fg=default bg=default] ,\
      #[fg=default bg=${colors.base01}] #[bg=${colors.base01} fg=${colors.base05}]#S #[bg=${colors.base0D} fg=${colors.base00}] #[fg=${colors.base0D} bg=default]#{@r}#[fg=default bg=default] \
      }'

      # WINDOW BUBBLES
      # Active
      set -g window-status-current-format '#[fg=${colors.base01} bg=${colors.base00}]#{@l}#[bg=${colors.base01} fg=${colors.base05}]#W #[bold bg=${colors.base0D} fg=${colors.base00}] #I#[fg=${colors.base0D} bg=${colors.base00}]#{@r}'

      # Inactive
      set -g window-status-format '#[fg=${colors.base01} bg=${colors.base00}]#{@l}#[bg=${colors.base01} fg=${colors.base05}]#W #[bg=${colors.base03} fg=${colors.base05}] #I#[fg=${colors.base03} bg=${colors.base00}]#{@r}'

      # RIGHT
      set -g status-right '#[fg=${colors.base0D}]#{@l}#[bg=${colors.base0D} fg=${colors.base01}]󰝰 #[bg=${colors.base01} fg=${colors.base05}] #{pane_current_path}#[fg=default bg=${colors.base01}] '
    '';
  };
}
