M := $(or $(MAKES_REPO_DIR),$(HOME)/.makes/makes)
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)

ifndef MAKES-FILE
$(error MAKES-FILE is required)
endif

MK := $(firstword $(MAKES-FILE))

MAKES-LOCAL-DIR := $(HOME)/.makesfiles/$(MK)

include $M/init.mk
include $M/$(MK).mk
SHELL-NAME := makes test $(MK)
include $M/shell.mk
