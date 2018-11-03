# Nix and Python
```bash
$ nix-shell -p 'python3.withPackages(ps: with ps; [ numpy pandas ])'
```
will drop you into a `nix-shell` with `python3`, `numpy`, and `pandas`.

---
To see if it all worked as advertised:
```bash
$ python hello_nix.py
python: 3.6.6 (default, Oct  5 2018, 13:50:59)
[GCC 4.2.1 Compatible Clang 5.0.2 (tags/RELEASE_502/final)]
numpy : 1.15.1
pandas: 0.23.4
```

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
