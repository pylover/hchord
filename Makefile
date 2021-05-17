.PHONY: run
run:
	cabal v2-run

.PHONY: build
build:
	cabal v2-build

.PHONY: clean
clean::
	-cabal v2-clean
