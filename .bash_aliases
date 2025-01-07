# ---------------------------------------
# Aliases

# git
alias gc='git checkout'
alias ga='git add -A'
alias gs='git status'
alias gb='git branch'
alias gbv='git branch -avv'
alias gd='git diff'
alias gl='git log'
alias gll='git log --graph --oneline --decorate --all --remotes=origin'
alias gp='git pull --recurse-submodules'
alias gr='git remote -v'
alias gf='git fetch --all -p'
alias gfp='gf && gp'
alias gri='git rebase -i --autosquash'
alias gco='git commit -m'
alias gdc='git diff --cached'

# Other
alias cat='batcat'
alias l='ls -lph'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias t='tree -F -L 2 --filelimit 30'
alias tt='t -L 3'
alias ttt='t -L 4'
alias tttt='t -L 5'
alias i='sudo apt install'
alias u='sudo apt update'
alias up='sudo apt upgrade'
alias b='browse .'
alias co="xclip -selection clipboard"
alias vi='lvim'
alias lg='lazygit'
alias runOracle='docker run --rm --name oracle -d -v /tmp/oracle_share_folder:/tmp/oracle_share_folder -e ORACLE_SID="XE" -e ORACLE_PWD="adminpass" -e ORACLE_PDB="ORCLPDBTEST" -e ORACLE_CHARACTERSET="AL32UTF8" -p 0.0.0.0:1521:1521 "oslandia/oracle-slim-for-qgis:18.4.0-xe"' 

# ---------------------------------------
# PATHS

# QGIS Compilation
export DEPENDS_DIR=/home/jacky/depends
export ORACLE_DIR=$DEPENDS_DIR/oracle-instantclient_21_1 
export CMAKE_PREFIX_PATH=$ORACLE_DIR:$ORACLE_DIR/sdk/include
export LD_LIBRARY_PATH=$ORACLE_DIR:$LD_LIBRARY_PATH
export PATH=$ORACLE_DIR:$PATH 

# PATH
export PATH="$PATH:/home/jacky/.local/bin:/usr/lib/ccache"

# FZF
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'

# Neovim
export PATH=/opt/nvim-linux64/bin:$PATH

# Other
export PSQL_EDITOR="nvim"

# ---------------------------------------
# SSH

# ProjectCentre UK vagrant ssh tunnelling
alias toms_vagrant_tunnel='ssh -L 15432:localhost:5432 -p 2222 vagrant@localhost -i /home/jacky/Documents/proj/2206_ProjectCentre/deploy/ansible/.vagrant/machines/toms_test_vm/virtualbox/private_key -fNg'

# ---------------------------------------
# Powerline

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# ---------------------------------------
# Goto functions

function af() {
  local selected_affaire
  selected_affaire=$(ls /home/jacky/Documents/oslandia/affaires/ | fzf)

  if [ -n "$selected_affaire" ]; then
    cd "/home/jacky/Documents/oslandia/affaires/$selected_affaire"
  fi
}
function afa() {
  local selected_affaire
  selected_affaire=$(ls /home/jacky/Documents/oslandia/affaires/archives/ | fzf)

  if [ -n "$selected_affaire" ]; then
    cd "/home/jacky/Documents/oslandia/affaires/archives/$selected_affaire"
  fi
}
function g() {
  local selected_proj
  selected_proj=$(cd ~/Documents/proj; ls -d */ | fzf)

  if [ -n "$selected_proj" ]; then
    cd "$HOME/Documents/proj/$selected_proj"
  fi
}
function s() {
  local selected_dir
  selected_dir=$(ls ~/sandbox/ | fzf)

  if [ -n "$selected_dir" ]; then
    cd "$HOME/sandbox/$selected_dir"
  fi
}

# ---------------------------------------
# source environment functions

function v() {
  local selected_env
  selected_env=$(ls ~/.venvs/ | fzf)

  if [ -n "$selected_env" ]; then
    source "$HOME/.venvs/$selected_env/bin/activate"
  fi
}

# lancer QGIS du dossier build/
function qm() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/dev/QGIS/build/output/bin/qgis --profile "$selected_profile" &
  fi
}

# paramétrer l'environnement du terminal avec un QGIS installé dans ~/apps/
function vq() {
  if [ -n "${MY_QGIS_VERSION}" ] ; then
    echo "Ce terminal est déjà paramétré avec la version de QGIS $MY_QGIS_VERSION"
  else
    local selected_qgis
    selected_qgis=$(ls ~/apps/ | grep -i qgis | fzf)
    if [ -n "$selected_qgis" ]; then
      export MY_QGIS_VERSION=$selected_qgis  # for powerline
      selected_qgis=~/apps/$selected_qgis
      export PYTHONPATH=$selected_qgis/share/qgis/python:$selected_qgis/share/qgis/python/plugins/:$PYTHONPATH
      export LD_LIBRARY_PATH=$selected_qgis/lib:$LD_LIBRARY_PATH
      alias qgis=$selected_qgis/bin/qgis
    fi
  fi
}

# ---------------------------------------
# Create project folders function

function p() {
  local selected_project
  local selected_affaire
  local project_name
  read -p 'Nom du projet : ' project_name
  selected_project=$(ls /home/jacky/Documents/Client-projects/ | fzf --prompt="Projet git : ")
  selected_affaire=$(ls /home/jacky/Documents/oslandia/affaires/ | fzf --prompt="Projet affaires : ")

  if [ -n "$selected_project" ] && [ -n "$selected_affaire" ]; then
    mkdir "/home/jacky/Documents/proj/$project_name"
    cd "/home/jacky/Documents/proj/$project_name"
    ln -s "../../oslandia/affaires/$selected_affaire" ./affaire
    ln -s "../../Client-projects/$selected_project" ./git
  fi
}
