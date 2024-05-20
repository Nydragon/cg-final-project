{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        name = "demo";
      in
      {
        packages.${name} = import ./. { inherit pkgs; };

        defaultPackage = self.packages.${system}.${name};

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            clang-tools
            raylib
          ];
        };
      }
    );
}
