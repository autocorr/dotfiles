#!/usr/bin/env bash
sudo apt-get install ghc hdevtools cabal-install
sudo apt-get install libghc-bzlib-dev libghc-haskell-src-dev
cp ../ghci.conf ~/.ghc/ghci.conf
cabal update
cabal install hscolour ipprint ghci-pretty vector
cabal install happy  # dependency for hoogle
source ~/.zshrc
cabal install hoogle
hoogle data
chmod g-w ~/.ghc
chmod g-w ~/.ghc/ghci.conf
