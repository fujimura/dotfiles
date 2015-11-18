export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.rbenv/shims:$PATH

eval "$(rbenv init -)"

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Users/fujimura/Downloads/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Openssl
OPENSSL_PATH=/usr/local/opt/openssl
if [ -d "$OPENSSL_PATH" ];then
  export PATH=$OPENSSL_PATH/bin:$PATH
  export LD_LIBRARY_PATH=$OPENSSL_PATH/lib:$LD_LIBRARY_PATH
  export CPATH=$OPENSSL_PATH/include:$LD_LIBRARY_PATH
fi
