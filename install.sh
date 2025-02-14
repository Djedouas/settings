#!/bin/bash

rm $HOME/.config/lvim/config.lua
ln -s `readlink -f lunarvim/config.lua` $HOME/.config/lvim

rm $HOME/.config/lazygit/config.yml
ln -s `readlink -f lazygit/config.yml` $HOME/.config/lazygit

rm $HOME/.config/khal/config
ln -s `readlink -f khal/config` $HOME/.config/khal

rm $HOME/.config/khard/khard.conf
ln -s `readlink -f khard/khal.conf` $HOME/.config/khard

ln -s `readlink -f aerc` $HOME/.config
ln -s `readlink -f kitty` $HOME/.config

ln -s `readlink -f .bash_aliases` $HOME
ln -s `readlink -f .mypy.ini` $HOME
ln -s `readlink -f .pylintrc` $HOME
ln -s `readlink -f .gdbinit` $HOME
ln -s `readlink -f .vimspector.json` $HOME
ln -s `readlink -f .bash_completion` $HOME
ln -s `readlink -f qgisprinters` $HOME/.gdb/qgisprinters
