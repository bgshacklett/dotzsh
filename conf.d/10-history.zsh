HISTFILE=${XDG_DATA_HOME:-"$HOME/.local/share/zsh/history"}
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME

# Simple function for searching history
# Credit to https://superuser.com/users/92596/wjv
# https://superuser.com/questions/232457/zsh-output-whole-history
h() { fc -Dlim "*$@*" 1 }
