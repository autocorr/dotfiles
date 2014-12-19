#!/usr/bin/env bash
sudo apt-get install ghc cabal-install
sudo apt-get install libghc-bzlib-dev libghc-haskell-src-dev
cp ../ghci.conf ~/.ghc/ghci.conf
chmod g-w ~/.ghc
chmod g-w ~/.ghc/ghci.conf
cabal update
cabal install hscolour ipprint ghci-pretty vector hdevtools
source ~/.zshrc  # reset PATH for ~/.cabal
cabal install happy  # dependency for hoogle
cabal install hoogle
hoogle data
cabal install alex
cabal install haddock
cabal install ghc-mod
