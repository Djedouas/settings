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
alias gcos='SKIP=flake8,pylint,mypy git commit -m'
alias gdc='git diff --cached'

# Edusign
alias rem="rename 's/(.*)_GMT0100.*/\$1.pdf/' *.pdf"
alias tem="unzip ~/Téléchargements/`ls ~/Téléchargements | grep -e ^archive.*\.zip` -d ."

# Other
alias cat='batcat'
alias l='ls -lph'
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

# ProjectCentre UK vagrant ssh tunnelling
alias toms_vagrant_tunnel='ssh -L 15432:localhost:5432 -p 2222 vagrant@localhost -i /home/jacky/Documents/proj/2206_ProjectCentre/deploy/ansible/.vagrant/machines/toms_test_vm/virtualbox/private_key -fNg'

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
function upload_image() {
  local lutim_instance="https://wtf.roflcopter.fr/pics/"
  local url

  # Save image from clipboard to temp file
  xclip -selection c -t image/png -o > /tmp/capture.png

  # Upload image for 1 day to lutim service and read json response
  url=$(curl -F "format=json" -F "file=@/tmp/capture.png" -F "delete-day=1" $lutim_instance | \
    python -c "import sys, json; print(sys.argv[1] + json.load(sys.stdin)['msg']['short'], end='')" $lutim_instance)

  # Notify user
  [ $? -eq 0 ] && notify-send "Success" || notify-send -u critical "Command unsuccessful"

  # Put url into clipboard
  echo $url | xclip -selection c
}

# Run make every time the file is modified
function watchmake() {
  while true; do
    inotifywait -e modify -e moved_to -e move -e move_self -e moved_from "$1" || return -1
    make
  done;
}

# fzf
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
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    qgis --profile "$selected_profile" &
  fi
}
function qf() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/dev/QGIS/.worktree/backport-release-3_26/build/output/bin/qgis --profile "$selected_profile" &
  fi
}
function ql() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/dev/QGIS/.worktree/backport-queued_ltr_backports/build/output/bin/qgis --profile "$selected_profile" &
  fi
}
function qm() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/dev/QGIS/build/output/bin/qgis --profile "$selected_profile" &
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
        f ) export QGIS_DIR=/home/jacky/dev/QGIS/.worktree/backport-release-3_26; break;;
    esac
  done
  export QGIS_PREFIX_PATH=$QGIS_DIR/build/output
  export PYTHONPATH=$QGIS_PREFIX_PATH/python:$QGIS_PREFIX_PATH/python/plugins:$QGIS_DIR/tests/src/python:$PYTHONPATH
}
