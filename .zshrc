if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===== FZF Configuration =====
# Initialize FZF
source <(fzf --zsh)

# General file search (includes hidden files, excludes .git)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude node_modules"
# Ctrl+T: Insert file paths (uses same command as DEFAULT)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Alt+C: Directory navigation (shows only folders) 
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude node_modules"

# Color scheme and display settings
FZF_COLOR_SCHEME='
  --color=fg:#c9c9c9,fg+:#F0F0F0,bg:#000000,bg+:#174c6c
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#174c6c,label:#aeaeae,query:#d9d9d9'

FZF_DISPLAY_SETTINGS='
  --border="rounded" 
  --border-label="" 
  --preview-window="border-rounded" 
  --prompt="> "
  --marker=">" 
  --pointer="◆" 
  --separator="─" 
  --scrollbar="│"'

# Combine all options
export FZF_DEFAULT_OPTS="--height 50% $FZF_COLOR_SCHEME $FZF_DISPLAY_SETTINGS"

# Preview configurations
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# ===== Aliases =====
# File listing
alias ls='eza -a --icons'       # List all files with icons
alias ll='eza -al --icons'      # Detailed list with icons
alias lt='eza -a --tree --level=1 --icons' # Tree view

alias fman="compgen -c | fzf | xargs man" # Fuzzy find man 

# Home y End keys para zsh-vi-mode
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line
