if cmd_loc="$(type -p 'gcloud')" && [[ -n $cmd_loc ]]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi
