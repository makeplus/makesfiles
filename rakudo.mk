M := $(or $(MAKES_REPO_DIR),$(HOME)/.makes/makes)
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)
MAKES-LOCAL-DIR := $(HOME)/.makesfiles/rakudo

include $M/init.mk
include $M/raku.mk
SHELL-NAME := makes rakudo
include $M/shell.mk
