{
  description = "Flake utils demo";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  # TODO use napalm for automating builds

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          hello = pkgs.hello;
          default = hello;
        };
        apps = rec {
          hello = flake-utils.lib.mkApp { drv = self.packages.${system}.hello; };
          default = hello;
        };
        devShells = {
          default = with pkgs; mkShell {
            buildInputs = [
              nodePackages."@vue/cli"
              nodejs
            ];
          };
        };
      }
    );
}
