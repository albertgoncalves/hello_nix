{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
    name = "pylint";

    buildInputs = [ python3
                    python36Packages.numpy
                    python36Packages.pandas
                    python36Packages.pylint
                  ];

    shellHook = ''
        alias pylint='pylint -s n'
    '';
}
