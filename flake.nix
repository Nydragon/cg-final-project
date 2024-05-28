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
        lib = nixpkgs.lib;
        name = "demo";
      in
      {
        packages.${name} = import ./. { inherit pkgs lib; };

        defaultPackage = self.packages.${system}.${name};

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            clang-tools
            raylib
          ];

          shellHook = ''
            #unset WAYLAND_DISPLAY;
          '';
        };
      }
    );
}
