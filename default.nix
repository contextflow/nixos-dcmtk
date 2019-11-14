{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation rec {
	version = "20170509";
	name = "dcmtk-${version}";
	src = fetchgit {
		url = "git://git.dcmtk.org/dcmtk.git";
		rev = "41853806778665673d36eeb196e5fa76e85c841a";
		sha256 = "1lcwi02pryqs7yjyc6nz470bpr12n0ccsz1i0lwns4rv3sjb2g06";
	};
    buildInputs = [	zlib libtiff libpng libxml2 ];
}

