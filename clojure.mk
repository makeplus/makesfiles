M := $(or $(MAKES_REPO_DIR),$(HOME)/.makes/makes)
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)
MAKES-LOCAL-DIR := $(HOME)/.makesfiles/clojure

include $M/init.mk
include $M/java.mk
include $M/clojure.mk
include $M/lein.mk
SHELL-NAME := clojure $(CLOJURE-VERSION)
include $M/shell.mk
