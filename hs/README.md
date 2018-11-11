# Nix and Haskell

We will need a `shell.nix` file; from what I can tell, there are **many** ways to write one of those.

Here's one way:

```nix
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
```
For now, it seems `libiconv` needs to tag along. From what I can, tell this is due in part to a bug when using **Nix** on **macOS High Sierra**. Your mileage may vary on other operating systems.

---
With that out of the way:
```bash
$ nix-shell
```

---
If everything went according to plan, we can evaluate code at runtime:
```bash
$ runhaskell hello_nix.hs
0.49725085
1.1379123e-3
0.9997634
"It worked!"
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
"It worked!"
```

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
