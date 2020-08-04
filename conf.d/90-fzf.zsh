# FZF

## Install fzf binary
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin 
# Note: Following files must be downloaded manually (for now):
# https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
# https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

## Enable Tab Completion with fzf
export FZF_BASE="$(dirname $(which fzf))"
zinit wait lucid for OMZ::plugins/fzf
