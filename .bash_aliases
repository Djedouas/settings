# Aliases

# git
alias gc='git checkout'
alias ga='git add -A'
alias gs='git status'
alias gb='git branch'
alias gbv='git branch -avv'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdn='git diff --name-only'
alias gdv='git difftool --tool=vimdiff --no-prompt'
alias gdvc='git difftool --tool=vimdiff --no-prompt --cached'
alias gl='git log'
alias gln='git log --name-only'
alias gll='git log --graph --oneline --decorate --all --remotes=origin'
alias gp='git pull --recurse-submodules'
alias gg='git grep -i'
alias gcp='git cherry-pick'
alias gr='git remote -v'
alias gf='git fetch --all -p'
alias gi='git switch'
alias gfp='gf && gp'
alias gri='git rebase -i --autosquash'

# Edusign
alias rem="rename 's/(.*)_GMT0100.*/\$1.pdf/' *.pdf"
alias tem="unzip ~/Téléchargements/`ls ~/Téléchargements | grep -e ^archive.*\.zip` -d ."

# Other
alias l='ls -lp'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias sv='nvim-qt'
alias t='tree -F -L 2 --filelimit 30'
alias tt='t -L 3'
alias ttt='t -L 4'
alias tttt='t -L 5'
alias i='sudo apt install'
alias u='sudo apt update'
alias up='sudo apt upgrade'

# Env
export DEPENDS_DIR=/home/jacky/depends
export PYTHONPATH="$PYTHONPATH:/usr/share/qgis/python/plugins/:/usr/share/qgis/python/"
export PATH="$PATH:/usr/lib/ccache"
export PSQL_EDITOR="vi"
export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'

# Oracle docker and environment
export ORACLE_DIR=$DEPENDS_DIR/oracle-instantclient_21_1 
export CMAKE_PREFIX_PATH=$ORACLE_DIR:$ORACLE_DIR/sdk/include
export LD_LIBRARY_PATH=$ORACLE_DIR:$PATH
export PATH=$ORACLE_DIR:$PATH 
alias runOracle='docker run --rm --name oracle -d -v /tmp/oracle_share_folder:/tmp/oracle_share_folder -e ORACLE_SID="XE" -e ORACLE_PWD="adminpass" -e ORACLE_PDB="ORCLPDBTEST" -e ORACLE_CHARACTERSET="AL32UTF8" -p 0.0.0.0:1521:1521 "oslandia/oracle-slim-for-qgis:18.4.0-xe"' 

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# Flameshot
function window_capture() {
  local a
  a=$(xwininfo -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') | awk '{if (NR==4 || NR==5 || NR==8 || NR==9) print $NF}')
  a=($a)
  flameshot gui --region ${a[2]}x${a[3]}+${a[0]}+${a[1]}
}

# fzf
function af() {
  local selected_affaire
  selected_affaire=$(ls /home/jacky/Documents/oslandia/affaires/ | fzf)

  if [ -n "$selected_affaire" ]; then
    cd "/home/jacky/Documents/oslandia/affaires/$selected_affaire"
  fi
}
function g() {
  local selected_proj
  selected_proj=$(ls ~/Documents/proj/ | fzf)

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
function v() {
  local selected_env
  selected_env=$(ls ~/.venvs/ | fzf)

  if [ -n "$selected_env" ]; then
    source "$HOME/.venvs/$selected_env/bin/activate"
  fi
}
function q() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini | fzf)

  if [ -n "$selected_profile" ]; then
    qgis --profile "$selected_profile" &
  fi
}
function qf() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/sandbox/QGIS/build-final-3_22_1/output/bin/qgis --profile "$selected_profile" &
  fi
}
function qm() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/sandbox/QGIS/build-master/output/bin/qgis --profile "$selected_profile" &
  fi
}
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
function vq() {
  while true; do
    read -p "master (m) - ltr (l) - latest (f) " mlf
    case $mlf in
        m ) export QGIS_DIR=/home/jacky/dev/QGIS; break;;
        l ) export QGIS_DIR=/home/jacky/dev/QGIS/.worktree/backport-queued_ltr_backports; break;;
        f ) export QGIS_DIR=/home/jacky/dev/QGIS/.worktree/backport-release-3_24; break;;
    esac
  done
  export QGIS_PREFIX_PATH=$QGIS_DIR/build/output
  export PYTHONPATH=$QGIS_PREFIX_PATH/python:$QGIS_PREFIX_PATH/python/plugins:$QGIS_DIR/tests/src/python:$PYTHONPATH
}
