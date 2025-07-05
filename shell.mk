M := $(or $(MAKES_REPO_DIR),$(HOME)/.makes/makes)
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)
MAKES-LOCAL-DIR := $(HOME)/.makesfiles/shell

include $M/init.mk
SHELL-NAME := makes $(MAKES-INCLUDE)
include $M/shell.mk
