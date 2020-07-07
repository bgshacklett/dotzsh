# Enable iTerm2 Shell Integration
zinit ice as"command" pick"bin/*" atclone'./_utils/download_files.sh' \
  atpull'%atclone' if"[[ $+ITERM_PROFILE ]]"
zinit light decayofmind/zsh-iterm2-utilities

# functions
zinit snippet 'https://raw.githubusercontent.com/gnachman/iterm2-website/master/source/shell_integration/zsh'

# Touchbar config
zinit light iam4x/zsh-iterm-touchbar
