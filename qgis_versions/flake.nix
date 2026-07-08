{
  description = "PyQGIS dev — multi-version";

  # Pour ajouter/mettre à jour une version : voir add-commit-qgis.sh à côté.
  inputs = {
    nixpkgs-3-38.url = "github:nixos/nixpkgs/f0eaec3bf29b96bf6f801cc602ed6827a9fa53ec"; # QGIS 3.38.2
    nixpkgs-3-40.url = "github:nixos/nixpkgs/212518a3623f5451efad314323e2c6b847eab45a"; # QGIS 3.40.3
    nixpkgs-3-42.url = "github:nixos/nixpkgs/2ff2ac81dbef983d72337001baca0c9471025705"; # QGIS 3.42.3
    nixpkgs-3-44.url = "github:nixos/nixpkgs/fb437e05005c399f60922159ea5bee98370b01dc"; # QGIS 3.44.7
    nixpkgs-4-0.url = "github:nixos/nixpkgs/534ee3d8beb1737b5342995f8837e2b2705ce0d8"; # QGIS 4.0.3

    # Un input "principal" sert de default (utile pour `nix flake check` etc.)
    nixpkgs.follows = "nixpkgs-3-44";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      # Fabrique un devShell à partir d'un input nixpkgs.
      mkQgisShell =
        nixpkgsInput:
        let
          pkgs = import nixpkgsInput { inherit system; };
          py = pkgs.qgis.unwrapped.py;

          qtMajor =
            if builtins.any (p: (p.pname or "") == "pyqt6") pkgs.qgis.unwrapped.pythonBuildInputs
            then "6"
            else "5";
          pyqt = py.pkgs."pyqt${qtMajor}";
          qtbase = if qtMajor == "6" then pkgs.qt6.qtbase else pkgs.qt5.qtbase;

          # Build les pyqtStubs
          pyqtStubs = py.pkgs.buildPythonPackage {
            pname = "pyqt${qtMajor}-stubs";
            version = pyqt.version;
            format = "other";
            src = pyqt.src;

            patches = pyqt.patches;
            dontWrapQtApps = true;
            dontConfigure = true;

            buildInputs = pyqt.buildInputs;
            nativeBuildInputs = [
              py.pkgs.sip
              py.pkgs.pyqt-builder
              py.pkgs."pyqt${qtMajor}-sip"
              qtbase
            ] ++ (map (p: p.dev or p) pyqt.buildInputs);

            dontUnpack = false;

            buildPhase = ''
              sip-build --pep484-pyi --no-compile --no-version-info
            '';

            installPhase = ''
              mkdir -p $out/${py.sitePackages}/PyQt${qtMajor}-stubs
              touch $out/${py.sitePackages}/PyQt${qtMajor}-stubs/__init__.pyi
              find build -name "*.pyi" -exec cp {} $out/${py.sitePackages}/PyQt${qtMajor}-stubs/ \;
            '';
          };
        in
        pkgs.mkShell {
          name = "qgis-${pkgs.qgis.unwrapped.version}-qt${qtbase.version}";
          inputsFrom = [ pkgs.qgis.unwrapped ];
          packages = [
            pkgs.qgis
            pyqtStubs
          ];
          PYTHONPATH = "${pkgs.qgis}/share/qgis/python:${pkgs.qgis}/share/qgis/python/plugins:${pyqtStubs}/${py.sitePackages}";
          MY_QGIS_VERSION="${pkgs.qgis.unwrapped.version}";
        };

      # Table des versions dispo. Ajouter une ligne ici pour exposer un nouveau shell.
      versions = {
        "3-38" = inputs.nixpkgs-3-38;
        "3-40" = inputs.nixpkgs-3-40;
        "3-42" = inputs.nixpkgs-3-42;
        "3-44" = inputs.nixpkgs-3-44;
        "4-0" = inputs.nixpkgs-4-0;
      };
    in
    {
      devShells.${system} =
        (builtins.mapAttrs (_: input: mkQgisShell input) versions)
        // {
          default = mkQgisShell inputs.nixpkgs-3-44;
        };
    };
}
