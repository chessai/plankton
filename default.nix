{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc821" }:

let
  inherit (nixpkgs) pkgs;

  f = 
    { mkDerivation, adjunctions, base, protolude, stdenv }:
    mkDerivation {
      pname = "plankton";
      version = "0.0.0.1";
      src = ./.;
      libraryHaskellDepends = [ adjunctions base protolude ];
      homepage = "https://github.com/chessai/plankton";
      description = "The core of a numeric prelude, taken from numhask";
      license = stdenv.lib.licenses.bsd3;
    };
  haskellPackages = pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in
  if pkgs.lib.inNixShell then drv.env else drv
