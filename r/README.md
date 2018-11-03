# Nix and R

As with the other examples, a minimal `shell.nix` file goes a long ways:
```nix
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
```
On `macOS`, we will need to do a bit of preparation in order to get `shiny` to automatically open into the browser. Should your preferred browser reside in a different location, swap out the one defined above. We will call this variable from inside the `Rscript` when it comes time to open the `shiny` application.

---
As always:
```bash
$ nix-shell
```

```bash
Rscript hello_nix.R
```

---
Additionally, with the aid of the small function included in the `shellHook`, we can streamline the interactive `R` experience a little bit:
```bash
$ copyfile hello_nix.R
$ R
```
Then <kbd>cmd</kbd> + <kbd>v</kbd> once you're on the inside.

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
