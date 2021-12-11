{
  description = "Agda project";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs { 
          system = 
            (if system == "aarch64-darwin" 
              then "x86_64-darwin" 
              else system);
        };  
        in {
          devShell = pkgs.mkShell {
                buildInputs = [
                  (pkgs.agda.withPackages (ps: [
                    ps.standard-library
                  ]))
                ];
            };
        }
      );
}
