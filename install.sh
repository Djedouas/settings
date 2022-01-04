#!/bin/bash

ln -s `readlink -f .bash_aliases` $HOME
ln -s `readlink -f .mypy.ini` $HOME
ln -s `readlink -f .pylintrc` $HOME
ln -s `readlink -f .tigrc` $HOME
ln -s `readlink -f .vimspector.json` $HOME
ln -s `readlink -f .bash_completion` $HOME
ln -s `readlink -f init.toml` $HOME/.SpaceVim.d/
ln -s `readlink -f myspacevim.vim` $HOME/.SpaceVim.d/autoload/
ln -s `readlink -f python.vim` $HOME/.SpaceVim/after/syntax/

