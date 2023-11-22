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
alias vi='lvim'
alias lg='lazygit'
alias gg='lazygit log'
alias runOracle='docker run --rm --name oracle -d -v /tmp/oracle_share_folder:/tmp/oracle_share_folder -e ORACLE_SID="XE" -e ORACLE_PWD="adminpass" -e ORACLE_PDB="ORCLPDBTEST" -e ORACLE_CHARACTERSET="AL32UTF8" -p 0.0.0.0:1521:1521 "oslandia/oracle-slim-for-qgis:18.4.0-xe"' 

# Env
export DEPENDS_DIR=/home/jacky/depends
export ORACLE_DIR=$DEPENDS_DIR/oracle-instantclient_21_1 
export CMAKE_PREFIX_PATH=$ORACLE_DIR:$ORACLE_DIR/sdk/include
export LD_LIBRARY_PATH=$ORACLE_DIR:$LD_LIBRARY_PATH
export PATH=$ORACLE_DIR:$PATH 
export PYTHONPATH="$PYTHONPATH:/usr/share/qgis/python/plugins/:/usr/share/qgis/python/"
export PATH="$PATH:/home/jacky/.local/bin:/usr/lib/ccache"
export PSQL_EDITOR="nvim"
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/grass78/lib
export CPLUS_INCLUDE_PATH=/home/jacky/dev/QGIS/build/src/providers/grass/7/qgisgrass7_autogen/include:/home/jacky/dev/QGIS/build:/home/jacky/dev/QGIS/build/src/providers/grass:/home/jacky/dev/QGIS/build/src/providers/grass/7:/home/jacky/dev/QGIS/src/core:/home/jacky/dev/QGIS/build/src/core:/home/jacky/dev/QGIS/src/core/3d:/home/jacky/dev/QGIS/src/core/actions:/home/jacky/dev/QGIS/src/core/annotations:/home/jacky/dev/QGIS/src/core/auth:/home/jacky/dev/QGIS/src/core/browser:/home/jacky/dev/QGIS/src/core/callouts:/home/jacky/dev/QGIS/src/core/classification:/home/jacky/dev/QGIS/src/core/diagram:/home/jacky/dev/QGIS/src/core/dxf:/home/jacky/dev/QGIS/src/core/editform:/home/jacky/dev/QGIS/src/core/effects:/home/jacky/dev/QGIS/src/core/elevation:/home/jacky/dev/QGIS/src/core/expression:/home/jacky/dev/QGIS/src/core/externalstorage:/home/jacky/dev/QGIS/src/core/fieldformatter:/home/jacky/dev/QGIS/src/core/geometry:/home/jacky/dev/QGIS/src/core/geocoding:/home/jacky/dev/QGIS/src/core/gps:/home/jacky/dev/QGIS/src/core/labeling:/home/jacky/dev/QGIS/src/core/layertree:/home/jacky/dev/QGIS/src/core/layout:/home/jacky/dev/QGIS/src/core/locator:/home/jacky/dev/QGIS/src/core/maprenderer:/home/jacky/dev/QGIS/src/core/mesh:/home/jacky/dev/QGIS/src/core/metadata:/home/jacky/dev/QGIS/src/core/network:/home/jacky/dev/QGIS/src/core/numericformats:/home/jacky/dev/QGIS/src/core/pal:/home/jacky/dev/QGIS/src/core/plot:/home/jacky/dev/QGIS/src/core/pointcloud:/home/jacky/dev/QGIS/src/core/pointcloud/expression:/home/jacky/dev/QGIS/src/core/processing:/home/jacky/dev/QGIS/src/core/processing/models:/home/jacky/dev/QGIS/src/core/proj:/home/jacky/dev/QGIS/src/core/project:/home/jacky/dev/QGIS/src/core/providers:/home/jacky/dev/QGIS/src/core/providers/arcgis:/home/jacky/dev/QGIS/src/core/providers/memory:/home/jacky/dev/QGIS/src/core/providers/gdal:/home/jacky/dev/QGIS/src/core/providers/ogr:/home/jacky/dev/QGIS/src/core/providers/meshmemory:/home/jacky/dev/QGIS/src/core/raster:/home/jacky/dev/QGIS/src/core/renderer:/home/jacky/dev/QGIS/src/core/scalebar:/home/jacky/dev/QGIS/src/core/settings:/home/jacky/dev/QGIS/src/core/sensor:/home/jacky/dev/QGIS/src/core/symbology:/home/jacky/dev/QGIS/src/core/textrenderer:/home/jacky/dev/QGIS/src/core/tiledscene:/home/jacky/dev/QGIS/src/core/validity:/home/jacky/dev/QGIS/src/core/vector:/home/jacky/dev/QGIS/src/core/vectortile:/home/jacky/dev/QGIS/external:/home/jacky/dev/QGIS/external/nlohmann:/home/jacky/dev/QGIS/external/kdbush/include:/home/jacky/dev/QGIS/external/nmea:/home/jacky/dev/QGIS/external/rtree/include:/home/jacky/dev/QGIS/external/meshOptimizer:/home/jacky/dev/QGIS/external/tinygltf:/home/jacky/dev/QGIS/src/core/providers/ept:/home/jacky/dev/QGIS/src/core/providers/copc:/home/jacky/dev/QGIS/src/core/providers/vpc:/home/jacky/dev/QGIS/src/gui:/home/jacky/dev/QGIS/src/gui/actions:/home/jacky/dev/QGIS/src/gui/annotations:/home/jacky/dev/QGIS/src/gui/attributeformconfig:/home/jacky/dev/QGIS/src/gui/symbology:/home/jacky/dev/QGIS/src/gui/attributetable:/home/jacky/dev/QGIS/src/gui/auth:/home/jacky/dev/QGIS/src/gui/callouts:/home/jacky/dev/QGIS/src/gui/codeeditors:/home/jacky/dev/QGIS/src/gui/devtools:/home/jacky/dev/QGIS/src/gui/editorwidgets:/home/jacky/dev/QGIS/src/gui/editorwidgets/core:/home/jacky/dev/QGIS/src/gui/effects:/home/jacky/dev/QGIS/src/gui/elevation:/home/jacky/dev/QGIS/src/gui/history:/home/jacky/dev/QGIS/src/gui/inputcontroller:/home/jacky/dev/QGIS/src/gui/labeling:/home/jacky/dev/QGIS/src/gui/layertree:/home/jacky/dev/QGIS/src/gui/layout:/home/jacky/dev/QGIS/src/gui/locator:/home/jacky/dev/QGIS/src/gui/maptools:/home/jacky/dev/QGIS/src/gui/mesh:/home/jacky/dev/QGIS/src/gui/numericformats:/home/jacky/dev/QGIS/src/gui/ogr:/home/jacky/dev/QGIS/src/gui/plot:/home/jacky/dev/QGIS/src/gui/processing:/home/jacky/dev/QGIS/src/gui/processing/models:/home/jacky/dev/QGIS/src/gui/providers:/home/jacky/dev/QGIS/src/gui/providers/gdal:/home/jacky/dev/QGIS/src/gui/providers/mbtilesvectortiles:/home/jacky/dev/QGIS/src/gui/providers/ogr:/home/jacky/dev/QGIS/src/gui/providers/vtpkvectortiles:/home/jacky/dev/QGIS/src/gui/pointcloud:/home/jacky/dev/QGIS/src/gui/raster:/home/jacky/dev/QGIS/src/gui/sensor:/home/jacky/dev/QGIS/src/gui/settings:/home/jacky/dev/QGIS/src/gui/tableeditor:/home/jacky/dev/QGIS/src/gui/tiledscene:/home/jacky/dev/QGIS/src/gui/vector:/home/jacky/dev/QGIS/src/gui/vectortile:/home/jacky/dev/QGIS/build/src/gui:/home/jacky/dev/QGIS/build/src/ui:/home/jacky/dev/QGIS/src/gui/providers/ept:/home/jacky/dev/QGIS/src/gui/providers/copc:/home/jacky/dev/QGIS/src/native:/home/jacky/dev/QGIS/build/src/native:/usr/include/postgresql:/usr/lib/grass78/include:/usr/include/x86_64-linux-gnu/qt5:/usr/include/x86_64-linux-gnu/qt5/QtCore:/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++:/usr/include/x86_64-linux-gnu/qt5/QtGui:/usr/include/x86_64-linux-gnu/qt5/QtXml:/usr/include/x86_64-linux-gnu/qt5/QtWidgets:/usr/include/x86_64-linux-gnu/qt5/QtSvg:/usr/include/x86_64-linux-gnu/qt5/QtPrintSupport:/usr/include/x86_64-linux-gnu/qt5/QtNetwork:/usr/include/x86_64-linux-gnu/qt5/QtSql:/usr/include/x86_64-linux-gnu/qt5/QtConcurrent:/usr/include/Qca-qt5/QtCrypto:/usr/include/qt5keychain:/usr/include/x86_64-linux-gnu/qt5/QtSerialPort:/usr/include/x86_64-linux-gnu/qt5/QtWebKitWidgets:/usr/include/x86_64-linux-gnu/qt5/QtWebKit:/usr/include/geos:/usr/include/gdal:/usr/include/x86_64-linux-gnu/qt5/QtPositioning:/usr/include/qwt:/usr/include/x86_64-linux-gnu/qt5/QtDBus:/usr/include/x86_64-linux-gnu/qt5/QtUiTools:/usr/include/x86_64-linux-gnu/qt5/QtQuickWidgets:/usr/include/x86_64-linux-gnu/qt5/QtQuick:/usr/include/x86_64-linux-gnu/qt5/QtQmlModels:/usr/include/x86_64-linux-gnu/qt5/QtQml:/usr/include/x86_64-linux-gnu/qt5/QtMultimedia:/usr/include/x86_64-linux-gnu/qt5/QtMultimediaWidgets

# ProjectCentre UK vagrant ssh tunnelling
alias toms_vagrant_tunnel='ssh -L 15432:localhost:5432 -p 2222 vagrant@localhost -i /home/jacky/Documents/proj/2206_ProjectCentre/deploy/ansible/.vagrant/machines/toms_test_vm/virtualbox/private_key -fNg'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

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
    /home/jacky/dev/QGIS/.worktree/final-3_32_1/build/output/bin/qgis --profile "$selected_profile" &
  fi
}
function ql() {
  local selected_profile
  selected_profile=$(ls ~/.local/share/QGIS/QGIS3/profiles/ | grep -v .ini$ | fzf)

  if [ -n "$selected_profile" ]; then
    /home/jacky/dev/QGIS/.worktree/ltr_backport/build/output/bin/qgis --profile "$selected_profile" &
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
        l ) export QGIS_DIR=/home/jacky/dev/QGIS/.worktree/ltr_backport; break;;
        f ) export QGIS_DIR=/home/jacky/dev/QGIS/.worktree/final-3_32_1; break;;
    esac
  done
  export QGIS_PREFIX_PATH=$QGIS_DIR/build/output
  export PYTHONPATH=$QGIS_PREFIX_PATH/python:$QGIS_PREFIX_PATH/python/plugins:$QGIS_DIR/tests/src/python:$PYTHONPATH
}

function upload_paie() {
  local auth=`pass show passpersos/jvo/nuage`
  local annee=`date +%Y`
  local mois=`date +%m`
  cd ~/Documents/admin
  git pull
  curl -v --basic --user $auth -T paie/$annee/${annee}_${mois}_jvo.pdf \
    "https://nuage.volpes.fr/remote.php/dav/files/jacky/Documents/Nos%20papiers/Emplois/Oslandia/Bulletins%20de%20salaire/$annee/"
  cd -
}
