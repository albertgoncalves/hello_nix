# Nix and JavaScript

In order to setup a simple environment with `node` and `jshint`, we will need to create a small `shell.nix` file.

```nix
{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
    name = "jshint";

    buildInputs = [ nodejs
                  ];

    shellHook = ''
        if [ ! -e node_modules/.bin/jshint ]
        then
            npm install --save-dev jshint
        fi

        export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
}
```
This will tell `Nix` to give us `node` and `npm`. Prior to handing over the keys, `nix` will run the terminal commands assigned to the `shellHook` variable.

---
With the stage set:
```bash
$ nix-shell
```

```bash
$ node hello_nix.js
3
4
```
```bash
$ jshint hello_nix.js
hello_nix.js: line 10, col 7, Missing semicolon.

1 error
```

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
