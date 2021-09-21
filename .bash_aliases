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
alias s='cd /home/jacky/sandbox'

# Env
export PYTHONPATH="$PYTHONPATH:/usr/share/qgis/python/plugins/:/usr/share/qgis/python/"
export PATH="$PATH:/usr/lib/ccache"
export PSQL_EDITOR="vi"
export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# fzf
function g() {
  local selected_proj
  selected_proj=$(ls ~/Documents/proj/ | fzf)

  if [ -n "$selected_proj" ]; then
    cd "$HOME/Documents/proj/$selected_proj"
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
