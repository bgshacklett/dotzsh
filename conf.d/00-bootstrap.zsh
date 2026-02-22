# Path Config
# On macOS, local bins take precedence over system paths; on Linux, system paths take precedence
if [[ "$OSTYPE" == darwin* ]]; then
  PATH="$HOME/.local/bin:$HOME/.linuxbrew/bin:$PATH"
else
  PATH="$PATH:$HOME/.local/bin:$HOME/.linuxbrew/bin"
fi
eval "$(brew shellenv)"

# Grab async command
zinit light "mafredri/zsh-async"
