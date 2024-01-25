# VI Mode
bindkey -v
bindkey -M vicmd -r :  # Disable execute mode binding

# Remove delay on mode change
# Note: This impacts the ability to use escape sequences.
export KEYTIMEOUT=1

# Set cursor modes
export MODE_CURSOR_VIINS="#00ff00 blinking bar"
export MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
export MODE_CURSOR_VICMD="green block"
export MODE_CURSOR_SEARCH="#ff00ff steady underline"
export MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
export MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# Enable vi-mode plugin
function zvm_config() {
  ZVM_INIT_MODE=sourcing
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
zinit light jeffreytse/zsh-vi-mode
