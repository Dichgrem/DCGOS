{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    historyLimit = 10000;
    terminal = "tmux-256color";

    extraConfig = ''
      set -g xterm-keys on
      set -s extended-keys on
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind y set-window-option synchronize-panes
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
      catppuccin
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g status-left-length 100
          set -g status-right-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
        '';
      }
    ];
  };
}
