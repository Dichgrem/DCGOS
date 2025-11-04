{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    initContent = ''
      export LANG=zh_CN.UTF-8
      export EDITOR=nano

      # === History ===
      HISTFILE=$XDG_STATE_HOME/zsh/history
      HISTSIZE=10000
      SAVEHIST=10000
      setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY INC_APPEND_HISTORY

      # === Tools ===
      if command -v atuin >/dev/null 2>&1; then
        eval "$(atuin init zsh)"
      fi
      if command -v zoxide >/dev/null 2>&1; then
        eval "$(zoxide init zsh)"
      fi
      if command -v starship >/dev/null 2>&1; then
        eval "$(starship init zsh)"
      fi

      # === Colors and Aliases ===
      autoload -U colors && colors
      alias ls='eza --icons=auto --group-directories-first'
      alias ll='eza -lh --icons=auto --group-directories-first'
      alias la='eza -lha --icons=auto --group-directories-first'

      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
      alias ..='cd ..'
      alias ...='cd ../..'

      # === Completion ===
      autoload -Uz compinit
      mkdir -p ~/.cache/zsh
      compinit -d ~/.cache/zsh/zcompdump
      setopt CORRECT

      # === Load plugins manually ===
      if [[ -o interactive ]]; then
        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)

        bindkey -e
        bindkey "$(tput kcuf1)" autosuggest-accept
      fi

      # === Prompt ===
      if ! command -v starship >/dev/null 2>&1; then
        PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
        RPROMPT='%F{yellow}[%D{%H:%M}]%f'
      fi
    '';
  };
}