# Nix and Haskell

As opposed to the [JavaScript](https://github.com/albertgoncalves/hello_nix/tree/master/js) and [Python](https://github.com/albertgoncalves/hello_nix/tree/master/py) examples, booting up this `nix-shell` involves a `shell.nix` file as opposed to trying to get everything across in the terminal command.

With the `shell.nix` file on hand, all you need to do is:

```bash
$ nix-shell
```

From inside the `nix-shell`:

```bash
$ runhaskell hello_vector.hs
```
will evaluate the given Haskell script at runtime.

Meanwhile,
```bash
$ ghc hello_vector.hs
$ ./hello_vector
```
should compile the script to an executable and set it free, just like old times.
