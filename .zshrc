export PATH=$PATH:$HOME/.config/.zshrc

autoload -Uz compinit && compinit
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':vcs_info:git:*' formats ' (%b)'

alias s='screen'
alias v='vim'

setopt PROMPT_SUBST
PROMPT='${PWD##*/}${vcs_info_msg_0_} ~ '
