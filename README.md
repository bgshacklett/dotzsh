# dotzsh

My ZSH config


## Installation

1. Clone the repository into `$XDG_CONFIG_HOME/zsh`:
    ```
    git clone https://github.com/bgshacklett/dotzsh.git "$XDG_CONFIG_HOME/zsh"
    ```
1. Set `$ZDOTDIR` to point to the installed location:
    ```
    cat <<EOF > ~/.zshenv
    if [[ -z "$XDG_CONFIG_HOME" ]]
    then
        export XDG_CONFIG_HOME="$HOME/.config"
    fi

    if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
    then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
    fi
    EOF
    ```
