# Nix and Haskell

As opposed to the [Python](https://github.com/albertgoncalves/hello_nix/tree/master/py) example, booting up this `nix-shell` involves a `shell.nix` file instead of trying to get everything across in a one-liner.

---
We will need a `shell.nix` file, just so:

```nix
{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

    inherit (nixpkgs) pkgs;

    f = { mkDerivation, base, stdenv }:
        mkDerivation {
            pname = "haskell";
            version = "0";
            src = ./.;
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
```

---
With that, simply say:
```bash
$ nix-shell
```

---
If everything went according to plan, we can evaluate scripts at runtime:
```bash
$ runhaskell hello_nix.hs
0.49725085
1.1379123e-3
0.9997634
"It worked!
```

---
And, just like the good ol' days, we can compile:
```bash
$ ghc hello_nix.hs
```
```bash
$ ./hello_nix
0.49725085
1.1379123e-3
0.9997634
"It worked!
```

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
