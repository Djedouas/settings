# Résout une version QGIS vers un commit nixpkgs cachable via l'API Nixhub,
# puis met à jour le flake.nix voisin (ajoute ou remplace l'input correspondant).
# Usage: add-qgis-commit.sh <version>   ex : 3.40 ou 3.40.3
#
# Refs:
#   Doc API     : https://www.jetify.com/docs/nixhub
#   Endpoint    : https://search.devbox.sh/v2/resolve?name=<pkg>&version=<ver>
#   UI web      : https://www.nixhub.io/packages/qgis

set -euo pipefail

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version>   ex: 3.40 ou 3.40.3" >&2
  exit 1
fi

for cmd in curl jq awk; do
  command -v "$cmd" >/dev/null || { echo "Erreur: '$cmd' requis" >&2; exit 1; }
done

url="https://search.devbox.sh/v2/resolve?name=qgis&version=${VERSION}"
resp=$(curl -sfL "$url") || { echo "Erreur: requête API échouée ($url)" >&2; exit 1; }

sha=$(echo "$resp" | jq -er '.systems["x86_64-linux"].flake_installable.ref.rev') || {
  echo "Erreur: réponse API inattendue pour version '$VERSION'" >&2
  echo "$resp" >&2
  exit 1
}
resolved=$(echo "$resp" | jq -er '.version')
echo "Version résolue : $resolved" >&2
echo "Commit nixpkgs  : $sha" >&2
echo "$sha"  # stdout composable

# flake.nix voisin (résolution du symlink si besoin)
script_dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
flake="$script_dir/flake.nix"
[[ -f "$flake" ]] || { echo "Note: $flake introuvable, pas de mise à jour" >&2; exit 0; }

# Clé courte majeur-mineur (3.40.3 → 3-40)
short=$(echo "$resolved" | awk -F. '{print $1"-"$2}')
input_line="    nixpkgs-${short}.url = \"github:nixos/nixpkgs/${sha}\"; # QGIS ${resolved}"
version_line="        \"${short}\" = inputs.nixpkgs-${short};"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
# Ancres d'insertion : "nixpkgs.follows" (bloc inputs) et "};" post-"versions = {"
awk -v short="$short" -v iline="$input_line" -v vline="$version_line" '
  # Bloc inputs : remplacement ou insertion avant nixpkgs.follows
  match($0, "^[[:space:]]*nixpkgs-" short "\\.url[[:space:]]*=") {
    print iline; input_done=1; next
  }
  !input_done && /nixpkgs\.follows/ { print iline; input_done=1 }

  # Bloc versions = { ... } : remplacement ou insertion avant "};"
  /versions = {/ { in_versions=1 }
  in_versions && match($0, "^[[:space:]]*\"" short "\"[[:space:]]*=[[:space:]]*inputs\\.") {
    print vline; version_done=1; next
  }
  in_versions && /^[[:space:]]*};[[:space:]]*$/ {
    if (!version_done) print vline
    in_versions=0; version_done=1
  }

  { print }
' "$flake" > "$tmp"

if diff -q "$flake" "$tmp" >/dev/null; then
  echo "flake.nix : aucun changement" >&2
  exit 0
fi

diff -u "$flake" "$tmp" >&2 || true
if { true < /dev/tty; } 2>/dev/null; then
  read -rp "Appliquer ces changements à $flake ? [y/N] " ans < /dev/tty
else
  ans=N
  echo "(pas de tty — refus par défaut)" >&2
fi
if [[ "$ans" =~ ^[yY]$ ]]; then
  mv "$tmp" "$flake"
  trap - EXIT
  echo "flake.nix mis à jour" >&2
else
  echo "Aucun changement appliqué" >&2
fi
