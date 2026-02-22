export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

pyenv() {
  unfunction pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}
