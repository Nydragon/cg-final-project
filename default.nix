{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "hello";
  version = "test";
  nativeBuildInputs = with pkgs; [
    autoreconfHook
    raylib
  ];
  buildInpts = [ ];

  src = ./.;
}
