eval "$(starship init zsh)"
source <(fzf --zsh)

export EDITOR='nvim'
export GPG_TTY=$TTY
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias x="startx"
alias zshconfig="nvim ~/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias v="nvim"
alias ls="exa --icons --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias la="ls -a"
alias ll="ls -al"

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

autoload -U compinit && compinit


. "$HOME/.cargo/env"
. /opt/asdf-vm/asdf.sh
[ -s "/home/dcunha/.scm_breeze/scm_breeze.sh" ] && source "/home/dcunha/.scm_breeze/scm_breeze.sh"
