# Nix and JavaScript

---
```bash
$ bash shell.sh
```

will run drop you into a `nix-shell` with `npm` and `node`.

From the `nix-shell`,
```bash
$ bash hello_jshint.sh
```
will locally install `jshint` and its dependencies.

With `jshint` on hand,
```bash
$ bash run_jshint.sh --version
$ bash run_jshint.sh script.js
```
should print out the installed version number and lint `script.js`.
