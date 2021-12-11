{
  description = "Agda project";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          rosettaPkgs = import nixpkgs { system = "x86_64-darwin"; };
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
              (rosettaPkgs.agda.withPackages (ps: [
                ps.standard-library
              ]))
            ];
          };
        }
      );
}
