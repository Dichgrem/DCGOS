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

# === Aliases ===
autoload -U colors && colors
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lh --icons=auto --group-directories-first'
alias la='eza -lha --icons=auto --group-directories-first'
alias cat='bat --paging=never'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# === Autosuggestions ===
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char)

# === Keybindings ===
bindkey -e
bindkey '\e[C' forward-char
bindkey '\eOC' forward-char

# === Completion ===
setopt CORRECT

# === Prompt fallback ===
if ! command -v starship >/dev/null 2>&1; then
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
  RPROMPT='%F{yellow}[%D{%H:%M}]%f'
fi
