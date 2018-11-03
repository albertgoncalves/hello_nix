{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc861" }:

let

    inherit (nixpkgs) pkgs;

    f = { mkDerivation, base, stdenv }:
        mkDerivation {
            pname = "haskell";
            version = "0";
            isLibrary = false;
            isExecutable = true;
            executableHaskellDepends = [ base
                                         haskellPackages.vector
                                         haskellPackages.random
                                         haskellPackages.tf-random
                                       ];
            license = stdenv.lib.licenses.gpl3;
        };

    haskellPackages = if compiler == "default"
                          then pkgs.haskellPackages
                      else
                          pkgs.haskell.packages.${compiler};

    drv = haskellPackages.callPackage f {};

in

    if pkgs.lib.inNixShell
        then drv.env
    else drv
