#!/bin/bash

rm $HOME/.config/lvim/config.lua
ln -s `readlink -f config.lua` $HOME/.config/lvim

rm $HOME/.config/lazygit/config.yml
ln -s `readlink -f config.yml` $HOME/.config/lazygit

ln -s `readlink -f .bash_aliases` $HOME
ln -s `readlink -f .mypy.ini` $HOME
ln -s `readlink -f .pylintrc` $HOME
ln -s `readlink -f .gdbinit` $HOME
ln -s `readlink -f .vimspector.json` $HOME
ln -s `readlink -f .bash_completion` $HOME
ln -s `readlink -f qgisprinters` $HOME/.gdb/qgisprinters

