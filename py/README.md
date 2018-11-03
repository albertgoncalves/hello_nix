# Nix and Python
```bash
$ nix-shell -p 'python3.withPackages(ps: with ps; [ numpy pandas pylint ])'
```
will drop you into a `nix-shell` with `python3`, `numpy`, `pandas`, and `pylint`.

---
Alternatively, we can utilize the local `shell.nix` file and streamline this process a little bit:

```bash
$ nix-shell
```

---
To see if it all worked as advertised:
```bash
$ python hello_nix.py
python: 3.6.6 (default, Oct  5 2018, 13:50:59)
[GCC 4.2.1 Compatible Clang 5.0.2 (tags/RELEASE_502/final)]
numpy : 1.15.1
pandas: 0.23.4
```

```bash
$ pylint hello_nix.py

************* Module hello_nix
hello_nix.py:20:0: C0305: Trailing newlines (trailing-newlines)
```

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
