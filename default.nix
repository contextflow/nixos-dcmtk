{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation rec {
	version = "3.6.5";
	name = "dcmtk-${version}";
	mysrc = builtins.fetchGit {
		url = "https://github.com/DCMTK/dcmtk.git";
		rev = "0f2de2313a00f9360bdf33399a2f37ee5e65c429";
#        ref = "tags/DCMTK-3.6.5";
	};
    buildInputs = [	zlib libtiff libpng libxml2 cmake ];

    unpackPhase = ":";
    configurePhase = ''
      ls -l
      cmake ${mysrc};
      ls -l
      '';
    buildPhase = ''
      make -j8
      ls -l
    '';

    installPhase = ''
      mkdir ./dest 
      make DESTDIR=./dest install
      ls -l ./dest
      mkdir $out
      cp -r dest/var/empty/local/* $out/

    '';
}

