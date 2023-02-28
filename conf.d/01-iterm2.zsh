# Enable iTerm2 Shell Integration
zinit ice depth"1" \
  pick"shell_integration/zsh" \
  sbin"utilities/*" if"[[ $+ITERM_PROFILE ]]"
zinit load gnachman/iTerm2-shell-integration

# functions
zinit snippet 'https://raw.githubusercontent.com/gnachman/iterm2-website/master/source/shell_integration/zsh'

# Touchbar config
zinit light iam4x/zsh-iterm-touchbar
