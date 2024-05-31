SHELL := bash
.ONESHELL:
.SHELLFLAGS := -xeu -o pipefail -c # Enable output of every command as they are ran
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEDIR := $(CURDIR)

default: deps deps-lock test build

.PHONY: deps
deps: vyos1x-config.opam
	@opam install -y . --deps-only

.PHONY:build
build: deps
	@dune build

.PHONY: deps-lock
deps-lock: deps
	@opam lock .

.PHONY: test-prep
test-prep: clean
	@opam install -y .
	dune build ./test/

.PHONY: test
test: test-prep
	@cd _build/default/test/
	dune exec ./test_vyos1x.bc
	cd $(MAKEDIR)

.PHONY: clean
clean:
	@dune clean
	rm -rf test/testresults
