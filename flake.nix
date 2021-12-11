{
  description = "Agda project";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs { inherit system; };  
        in {
          devShell = 
             pkgs.mkShell {
                buildInputs = [
                  (agda.withPackages (ps: [
                    ps.standard-library
                  ]))
                ];
        }
      );
}
