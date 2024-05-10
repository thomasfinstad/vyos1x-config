FROM docker.io/vyos/vyos-build:current

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y less

RUN apt-get install -y opam opam-doc
RUN opam init --auto-setup --disable-sandboxing
RUN echo 'eval $(opam env)' > $HOME/.bashrc

RUN opam install -y ocaml-lsp-server
RUN opam install -y ocamlformat

ENV DEBIAN_FRONTEND dialog
