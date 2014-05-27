EMACS ?= emacs
EMACSFLAGS = --debug-init -L .
CASK = cask
VAGRANT = vagrant

CONTAINER = scame

ELS = $(wildcard *.el)
OBJECTS = $(ELS:.el=.elc)


help:
	@echo " ==== Scame ===="
	@echo "   - test               : launch unit tests"
	@echo "   - integration-test   : launch integration tests"
	@echo "   - clean              : clean Scame installation"
	@echo "   - reset              : remote Scame dependencies for development"
	@echo "   - docker-build       : build the Docker image"
	@echo "   - docker-clean       : remove the Docker image"
	@echo "   - docker-run         : launch Emacs using Scame docker image"

elpa:
	$(CASK) install
	$(CASK) update
	touch $@

.PHONY: build
build : elpa $(OBJECTS)


# .PHONY: test
# test : build
# 	${VIRTUAL_EMACS} --batch -l test/run-tests

.PHONY: test
test : build
	$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
	$(EMACSFLAGS) \
	-l test/run-tests

.PHONY: integration-test
integration-test : build
	$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
	$(EMACSFLAGS) \
	-l test/run-global-tests


.PHONY: virtual-test
virtual-test :
	$(VAGRANT) up
	$(VAGRANT) ssh -c "make -C /vagrant EMACS=$(EMACS) clean test"

.PHONY: clean
clean :
	$(CASK) clean-elc
	rm -f elpa
	rm -fr dist

reset : clean
	rm -rf .cask # Clean packages installed for development

%.elc : %.el
	$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
	$(EMACSFLAGS) \
	-f batch-byte-compile $<

# %.elc : %.el
# 	${VIRTUAL_EMACS} --batch -f batch-byte-compile $<

docker-build:
	sudo docker build -t $(CONTAINER) .

docker-clean:
	sudo docker rm $(CONTAINER)

docker-run:
	sudo docker run $(CONTAINER)
