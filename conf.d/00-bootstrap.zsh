# Path Config
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.linuxbrew/bin:$PATH"
eval "$(brew shellenv)"

# Grab async command
zinit light "mafredri/zsh-async"
