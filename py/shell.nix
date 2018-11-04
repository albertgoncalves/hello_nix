{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
    name = "python";

    buildInputs = [ python3
                    python36Packages.numpy
                    python36Packages.pandas
                    python36Packages.pylint
                  ];

    shellHook = ''
        copyfile() { cat $1 | pbcopy; }
        export -f copyfile
        alias pylint='pylint -s n'
    '';
}
