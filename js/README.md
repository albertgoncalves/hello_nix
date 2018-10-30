# Nix and JavaScript

In this case, all I wanted to do was install `jshint` into my local environment (as opposed to installing libraries for use inside `node`).

---
To make this happen, all we need to do is create a `shell.nix` file in the local directory like so:

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
This will tell `Nix` to give us `node` and `npm`. Prior to letting us into the `nix-shell` environment, `nix` will run the terminal commands assigned to the `shellHook` variable.

---
Once this file is in place, just hammer out
```bash
$ nix-shell
```
which will drop you into a `node`-ready `nix-shell`.

---
From there:
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
