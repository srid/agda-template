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
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
              (agdaPkgs.agda.withPackages (ps: [
                ps.standard-library
              ]))
              # (agdaPkgs.haskellPackages.callHackage "agda-language-server" "0.2.1" {})
            ];
          };
        }
      );
}
