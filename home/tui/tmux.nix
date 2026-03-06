{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    mouse = true;
    prefix = "C-a";
    historyLimit = 10000;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      yank
      catppuccin
    ];

    extraConfig = ''
      set -g xterm-keys on
      set -s extended-keys on
      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_tabs_enabled on
      set -g @catppuccin_status_background "default"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind y set-window-option synchronize-panes
    '';
  };
}
