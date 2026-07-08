#!/usr/bin/env bash
# qgis-shell.sh — sélectionne un devShell PyQGIS via fzf en parsant flake.nix
set -euo pipefail

FLAKE_DIR="${FLAKE_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
cd "$FLAKE_DIR"

# Parse la section versions = { ... } dans flake.nix
SHELLS=$(awk '
  /^[[:space:]]*versions[[:space:]]*=[[:space:]]*{/ { in_versions=1; next }
  in_versions && /^[[:space:]]*}[[:space:]]*;/ { exit }
  in_versions && /^[[:space:]]*"[^"]*"/ {
    match($0, /"([^"]+)"/, arr)
    print arr[1]
  }
' flake.nix)

if [[ -z "$SHELLS" ]]; then
  echo "Erreur: aucune version trouvée dans flake.nix" >&2
  exit 1
fi

# Si un seul shell, lance direct
COUNT=$(echo "$SHELLS" | wc -l)
if [[ $COUNT -eq 1 ]]; then
  SELECTED="$SHELLS"
else
  SELECTED=$(echo "$SHELLS" | fzf) || exit 0
fi

# Détecte si on a besoin du flag experimental-features
NIX_EXTRA_ARGS=()
if nix --version &>/dev/null && ! nix show-config 2>/dev/null | grep -q 'experimental-features.*flakes'; then
  NIX_EXTRA_ARGS=(--extra-experimental-features 'nix-command flakes')
fi

exec nix "${NIX_EXTRA_ARGS[@]}" develop ".#$SELECTED"
