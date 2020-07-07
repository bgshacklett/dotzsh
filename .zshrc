# Path Config
PATH=~/homebrew/bin:$PATH
PATH=$(pyenv root)/shims:$PATH
PATH=/Users/brian.shacklett/.rbenv/shims/:$PATH
PATH="~/homebrew/opt/openjdk/bin:$PATH"


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


# Source all files in conf.d
for file in $ZDOTDIR/conf.d/*.zsh; do
  source "$file"
done

# Enable completions
zpcompinit; zpcdreplay

## Set Theme
zinit light denysdovhan/spaceship-prompt
export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_VI_MODE_SHOW=false
