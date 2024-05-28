{ pkgs, lib, ... }:
pkgs.stdenv.mkDerivation {
  pname = "hello";
  version = "test";
  nativeBuildInputs = with pkgs; [
    autoreconfHook
    raylib
  ];
  buildInpts = [ ];

  postFixup = ''
    patchelf $out/bin/hello \
      --add-needed libwayland-client.so \
      --add-needed libwayland-cursor.so \
      --add-needed libwayland-egl.so \
      --add-rpath ${lib.makeLibraryPath [ pkgs.wayland ]}
  '';

  src = ./.;
}
