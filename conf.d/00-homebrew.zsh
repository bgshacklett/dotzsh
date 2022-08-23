export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/Users/brian.shacklett/homebrew/opt/openssl@3/lib/pkgconfig"
export CPATH="$CPATH:$HOME/homebrew/Cellar/zstd/1.5.0/lib:$HOME/homebrew/opt/openssl/lib"
export LIBRARY_PATH="$LIBRARY_PATH:$HOME/homebrew/Cellar/zstd/1.5.0/lib:$HOME/homebrew/opt/openssl/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/homebrew/Cellar/zstd/1.5.0/lib:$HOME/homebrew/opt/openssl/lib"

export LDFLAGS="$LDFLAGS -L/Users/brian.shacklett/homebrew/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/Users/brian.shacklett/homebrew/opt/openssl@3/include"

export LDFLAGS="-L/Users/brian.shacklett/.brew/opt/xz/lib $LDFLAGS"
export CPPFLAGS="-I/Users/brian.shacklett/.brew/opt/xz/include $CPPFLAGS"
export PKG_CONFIG_PATH="/Users/brian.shacklett/.brew/opt/xz/lib/pkgconfig:$PKG_CONFIG_PATH"
