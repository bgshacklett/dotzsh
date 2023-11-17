# Enable iTerm2 Shell Integration
zinit ice depth"1" \
  pick"shell_integration/zsh" \
  sbin"utilities/*" if"[[ $+ITERM_PROFILE ]]"
zinit load gnachman/iTerm2-shell-integration

# functions
SHI_VER_HASH='90c7e175d745062701b5308dff996d65a025b6d9'
zinit snippet "https://raw.githubusercontent.com/gnachman/iTerm2-shell-integration/$SHI_VER_HASH/shell_integration/zsh"
