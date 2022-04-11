.PHONY: run
run:
	cabal v2-run hchord

.PHONY: build
build:
	cabal v2-build

.PHONY: configure
configure:
	cabal v2-configure --enable-tests

.PHONY: test
test:
	cabal v2-test

.PHONY: clean
clean::
	-cabal v2-clean
