# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='code-insiders'
export VISUAL='code-insiders'
# >>> nvm (Homebrew) >>>
# Initialize nvm for interactive shells
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  . "/opt/homebrew/opt/nvm/nvm.sh"
fi

# Enable bash-style completions to load nvm's completion under zsh
autoload -U +X bashcompinit && bashcompinit
if [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]; then
  . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi
# <<< nvm (Homebrew) <<<

# >>> agent-managed aliases: eza/bat >>>
# Moved to ~/.zsh/aliases.zsh
[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
# <<< agent-managed aliases: eza/bat <<<

# Disable Homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="$HOME/.cargo/bin:$PATH"

# bun completions
[ -s "/Users/seb/.bun/_bun" ] && source "/Users/seb/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Anthropic Proxy Server (ccflare)
export ANTHROPIC_BASE_URL=http://localhost:8080

# enable fzf fuzzy finder and hotkeys
eval "$(fzf --zsh)"
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# zoxide
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
