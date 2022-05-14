{
  description = "Agda project";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          agdaPkgs =
            if system == "aarch64-darwin"
            then import nixpkgs { system = "x86_64-darwin"; }  # Rosetta (Agda broken on M1)
            else pkgs;
          # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/agda.section.md
          myAgda = agdaPkgs.agda.withPackages (ps: [
            ps.standard-library
          ]);
          agda-template = agdaPkgs.agdaPackages.mkDerivation {
            pname = "agda-template";
            version = "0.1";
            meta = { };
            src = ./.;
            buildInputs = [ myAgda ];
          };
        in
        {
          packages.default = agda-template;
          defaultPackage = agda-template;
          devShell = pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
              myAgda
              # (agdaPkgs.haskellPackages.callHackage "agda-language-server" "0.2.1" {})
            ];
          };
        }
      ) //
    {
      herculesCI.ciSystems = [ "x86_64-linux" ];
    };
}
