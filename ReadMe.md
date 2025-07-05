makesfiles
==========

Makes Makefiles for Various Setups


## Synopsis

Start a shell with Java, Maven, Clojure, and Leiningen installed:
```bash
$ make -f <(curl -sL https://github.com/makeplus/makesfiles/raw/main/clojure.mk) shell
```

Start a shell with Go, Rust and Just installed:
```bash
$ make -f <(curl -sL https://github.com/makeplus/makesfiles/raw/main/shell.mk) shell MAKES-INCLUDE='go.mk rust.mk just.mk'
```


## Description

This repo has sample Makefiles using the [Makes](
https://github.com/makeplus/makes) Makefile framework.

You can use them as templates for your project Makefiles or `curl` them inline
like in the examples above.


## Copyright and License

Copyright 2025 by Ingy döt Net

This is free software, licensed under:

The MIT (X11) License
