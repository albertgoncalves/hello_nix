{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
    name = "haskell";
    buildInputs = [ (haskell.packages.ghc861.ghcWithPackages (pkgs: [
                        pkgs.vector
                        pkgs.random
                        pkgs.tf-random
                    ]))
                    libiconv
                  ];
}
