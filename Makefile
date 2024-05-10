.ONESHELL:

default: all

all: deps deps-lock build

.PHONY: deps
deps: vyos1x-config.opam
	opam install -y . --deps-only

.PHONY:build
build: deps
	dune build

.PHONY: deps-lock
deps-lock: deps
	opam lock .