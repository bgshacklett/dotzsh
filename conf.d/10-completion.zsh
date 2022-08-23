autoload -Uz +X bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit
complete -C "$(which aws_completer)" aws
