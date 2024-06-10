{
  pkgs,
  lib,
  name ? "graphical-computing-final-project",
  version ? "0.1.0",
  ...
}:
pkgs.stdenv.mkDerivation {
  pname = name;
  version = version;
  nativeBuildInputs = with pkgs; [
    autoreconfHook
    raylib
  ];
  buildInpts = [ ];

  postFixup = ''
    patchelf $out/bin/${name} \
      --add-needed libwayland-client.so \
      --add-needed libwayland-cursor.so \
      --add-needed libwayland-egl.so \
      --add-rpath ${lib.makeLibraryPath [ pkgs.wayland ]}
  '';

  src = ./.;
}
