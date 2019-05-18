{ pkgs ? import <nixpkgs> {} }:

let
  ps = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "2af967a3947f64921da77bdea632e37686f864ff";
    sha256 = "1z5i4l8ljyfv0s52rgdmb7mpj723r37nnldpqpp0ily7jrrlfvsm";
  });

in with ps;
  pkgs.stdenv.mkDerivation {
    name = "easy-purescript";
    buildInputs = [ purs spago ];
  }
