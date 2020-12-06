export PATH=$PATH:$HOME/.config/.zshrc

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias s='screen'
alias v='vim'
