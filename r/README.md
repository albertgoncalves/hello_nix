# Nix and R

As with the other examples, a minimal `shell.nix` file goes a long ways:
```nix
with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "R";

    buildInputs = [ R
                    rPackages.ggplot2
                    rPackages.lintr
                    rPackages.shiny
                  ];

    shellHook = ''
        export BROWSERPATH="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

        copyfile() { cat $1 | pbcopy; }
        export -f copyfile
    '';
}
```
On **macOS**, we will need to do a bit of preparation in order to get `shiny` to automatically open into the browser. Should your preferred browser reside in a different location, swap out the one defined above. We will call this variable from inside the `Rscript` when it comes time to open the `shiny` application.

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
If you want to lint your `R` scripts, looks like `lintr` also came along for the ride:
```bash
$ R
```

```R
> library(lintr)
> lint('hello_nix.R')

hello_nix.R:29:23: warning: no visible global function definition for ‘renderPlot’
    output$distPlot = renderPlot(distPlot())
                      ^~~~~~~~~~
hello_nix.R:30:39: warning: no visible global function definition for ‘stopApp’
    session$onSessionEnded(function() stopApp())
                                      ^~~~~~~
hello_nix.R:35:5: warning: no visible global function definition for ‘shinyApp’
    shinyApp(ui=ui(), server=server, options=list("launch.browser"=TRUE))
    ^~~~~~~~
hello_nix.R:35:14: warning: no visible global function definition for ‘ui’, Did you mean 'vi'?
    shinyApp(ui=ui(), server=server, options=list("launch.browser"=TRUE))
             ^~
hello_nix.R:35:23: warning: no visible binding for global variable ‘server’
    shinyApp(ui=ui(), server=server, options=list("launch.browser"=TRUE))
                      ^~~~~~
```
If needs be, linting operations can controlled with a `.lintr` config file.

---
Once you're done, <kbd>ctrl</kbd> + <kbd>d</kbd> or `$ exit` will set the world to rights.
