# ~/.zsh/aliases.zsh
# Extracted from ~/.zshrc on 2025-08-16
# These aliases prefer eza over ls and bat over cat when available.

# Use eza in place of ls
# Common defaults: classify (-F), color, group directories first
# You can bypass the alias by calling the full path, e.g., /bin/ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -F --color=auto --group-directories-first'
fi

# Use bat in place of cat with plain style and no paging
# This preserves syntax highlighting but removes headers/line numbers
# You can bypass the alias by calling the full path, e.g., /bin/cat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never --style=plain'
fi

# ##
# replace common `rm` command with trash
alias rm='safe-rm'

# quick access to ~/.zshrc
alias zz='chezmoi edit ~/.zshrc'

# quick access to nvim config
alias nn='chezmoi edit ~/.config/nvim'

# chezmoi aliases
alias cz='chezmoi'
alias cza='chezmoi add'
alias czap='chezmoi apply'
alias czs='chezmoi status'
alias czd='chezmoi diff'
alias cze='chezmoi edit'
alias czu='chezmoi update'
alias czr='chezmoi re-add'
alias czm='chezmoi merge'
alias czcd='chezmoi cd'

# >>> AI Chat aliases >>>
alias ai='aichat'