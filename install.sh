#!/bin/bash

rm $HOME/.config/lvim
ln -s `readlink -f config.lua` $HOME/.config/lvim

ln -s `readlink -f .bash_aliases` $HOME
ln -s `readlink -f .mypy.ini` $HOME
ln -s `readlink -f .pylintrc` $HOME
ln -s `readlink -f .gdbinit` $HOME
ln -s `readlink -f .vimspector.json` $HOME
ln -s `readlink -f .bash_completion` $HOME
ln -s `readlink -f qgisprinters` $HOME/.gdb/qgisprinters

