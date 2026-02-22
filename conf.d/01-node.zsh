export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH"
export PATH="$PATH:$HOME/node_modules/.bin"

nodenv() {
  unfunction nodenv
  eval "$(command nodenv init -)"
  nodenv "$@"
}
