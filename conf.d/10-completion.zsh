ZCOMPCACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZCOMPCACHE"

autoload -Uz +X bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit -d "${ZCOMPCACHE}/zcompdump"
complete -C "$(which aws_completer)" aws
#. <(flux completion zsh)
