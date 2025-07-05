M := $(or $(MAKES_REPO_DIR),$(HOME)/.makes/makes)
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)
MAKES-LOCAL-DIR := $(HOME)/.makesfiles/babashka

include $M/init.mk
include $M/clean.mk
include $M/git.mk
include $M/graalvm.mk
include $M/clojure.mk
include $M/lein.mk
SHELL-NAME := bb
include $M/shell.mk

BB-VER-FILE := resources/BABASHKA_VERSION

ifeq (,$(wildcard $(BB-VER-FILE)))
$(error This doesn't look like a babashka directory)
endif


BB-VERSION := $(shell cat $(BB-VER-FILE))
BB-UBERJAR := target/babashka-$(BB-VERSION)-standalone.jar
BB-SUBMODULES := $(GIT-DIR)/modules/deps.clj
BB-REFLECT := \
  resources/META-INF/native-image/babashka/babashka/reflect-config.json

MAKES-CLEAN := bb target $(BB-REFLECT) metabom.jar reports/
MAKES-DISTCLEAN := tmp

BUILD-DEPS := \
  $(GRAALVM) $(MAVEN) $(CLOJURE) $(LEIN) \
  $(BB-SUBMODULES) \



build: bb
	./$< --version

bb: $(BB-UBERJAR)
	script/compile

$(BB-UBERJAR): $(BUILD-DEPS)
	script/uberjar

$(BB-SUBMODULES):
	git submodule update --init --recursive
	[[ -e $@ ]]
