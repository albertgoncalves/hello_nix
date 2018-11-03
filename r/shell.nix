with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "r";

    buildInputs = [ R
                    rPackages.ggplot2
                    rPackages.shiny
                  ];

    shellHook = ''
        export BROWSERPATH="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
        copyfile() {
            cat $1 | pbcopy
        }
        export -f copyfile
    '';
}
