# Path Config
PATH=$HOME/homebrew/bin:$PATH
PATH=$HOME/homebrew/sbin:$PATH
PATH=$(pyenv root)/shims:$PATH
PATH=$HOME/.rbenv/shims/:$PATH
PATH="$HOME/homebrew/opt/openjdk/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$HOME/node_modules/.bin"


# Added by Zinit's installer{{{
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# End of Zinit's installer chunk}}}

# Enable completions
zpcompinit; zpcdreplay


## Set Theme
eval "$(starship init zsh)"

# Source all files in conf.d
 for file in $ZDOTDIR/conf.d/*.zsh; do
   # echo "source ${file}..."
   source "$file"
 done

complete -C "$(which aws_completer)" aws
