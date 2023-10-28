{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        devShell = pkgs.mkShell { 
          buildInputs = [
            pkgs.freetype
            pkgs.alsa-lib
            pkgs.webkitgtk
            pkgs.curl
            pkgs.fftwFloat
            pkgs.jack2
            pkgs.xorg.libX11
            pkgs.xorg.libXext
            pkgs.xorg.libXinerama
            pkgs.xorg.xrandr
            pkgs.xorg.libXcursor

            pkgs.pcre2
            pkgs.pcre
            pkgs.libuuid
            pkgs.libselinux
            pkgs.libsepol
            pkgs.libthai
            pkgs.libdatrie
            pkgs.xorg.libXdmcp
            pkgs.libxkbcommon
            pkgs.libepoxy
            pkgs.xorg.libXtst
            pkgs.libsysprof-capture
            pkgs.sqlite.dev
            pkgs.libpsl
          ];
          nativeBuildInputs = [
            pkgs.cmake
            pkgs.pkg-config
            pkgs.patchelf
            pkgs.gdb
          ];

          NIX_LDFLAGS = (toString [
            "-lX11"
            "-lXext"
            "-lXcursor"
            "-lXinerama"
            "-lXrandr"
          ]);
        };
      });
}
