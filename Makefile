# Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


APP = scame

SHELL = /bin/bash

EMACS ?= emacs
EMACSFLAGS = --debug-init -L .
CASK = cask
VAGRANT = vagrant

DOCKER = docker
NAMESPACE = nlamirault
IMAGE = scame

ELS = $(wildcard *.el)
OBJECTS = $(ELS:.el=.elc)

VERSION=$(shell \
        grep "defvar scame-version-number" src/scame/lisp/990_scame_version.el \
	|awk -F'"' '{print $$2}')


NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- test$(NO_COLOR)               : launch unit tests$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- local-test$(NO_COLOR)         : launch unit test using local configuration$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- integration-test$(NO_COLOR)   : launch integration tests$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- clean$(NO_COLOR)              : clean Scame installation$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- reset$(NO_COLOR)              : remote Scame dependencies for development$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- docker-build$(NO_COLOR)       : build the Docker image$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- docker-clean$(NO_COLOR)       : remove the Docker image$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- docker-run$(NO_COLOR)         : launch Emacs using Scame docker image$(NO_COLOR)"

.PHONY: build
build :
	@echo -e "$(OK_COLOR)[$(APP)] Build $(NO_COLOR)"
	@$(CASK) install
	@$(CASK) update

.PHONY: local-test
test : build
	@echo -e "$(OK_COLOR)[$(APP)] Launch unit tests$(NO_COLOR)"
	@$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
		$(EMACSFLAGS) \
		-l test/run-tests

.PHONY: test
local-test: build
	@echo -e "$(OK_COLOR)[$(APP)] Launch unit tests using local installation$(NO_COLOR)"
	@$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
		$(EMACSFLAGS) \
		-l test/run-local-tests

.PHONY: integration-test
integration-test: build
	@echo -e "$(OK_COLOR)[$(APP)] Launch integration tests using fresh installation$(NO_COLOR)"
	@$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
		$(EMACSFLAGS) \
		-l test/run-global-tests


.PHONY: virtual-test
virtual-test:
	@$(VAGRANT) up
	@$(VAGRANT) ssh -c "make -C /vagrant EMACS=$(EMACS) clean test"

.PHONY: clean
clean :
	@$(CASK) clean-elc
	@rm -fr dist scame-*.tar.gz test/sandboxorg-clock-save.el

reset : clean
	@rm -rf .cask # Clean packages installed for development
	@rm -fr test/sandbox

binaries:
	@echo "$(OK_COLOR)[$(APP)] Make binaries $(VERSION) $(NO_COLOR)"
	@rm -fr scame-$(VERSION) && mkdir scame-$(VERSION)
	@cp -r src/* scame-$(VERSION)
	@tar cf scame-$(VERSION).tar scame-$(VERSION)
	@gzip scame-$(VERSION).tar
	@rm -fr scame-$(VERSION)

%.elc : %.el
	@$(CASK) exec $(EMACS) --no-site-file --no-site-lisp --batch \
		$(EMACSFLAGS) \
		-f batch-byte-compile $<

.PHONY: docker-build
docker-build:
	@echo -e "$(OK_COLOR)[$(APP)] Build $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) build -t $(NAMESPACE)/$(IMAGE):$(VERSION) .

.PHONY: docker-publish
docker-publish: build
	@echo -e "$(OK_COLOR)[$(APP)] Publish $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) tag $(NAMESPACE)/$(IMAGE):$(VERSION) $(NAMESPACE)/$(IMAGE):$(VERSION)
	@$(DOCKER) push $(NAMESPACE)/$(IMAGE):$(VERSION)

.PHONY: docker-clean
docker-clean:
	@echo -e "$(OK_COLOR)[$(APP)] Clean $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) rm $(NAMESPACE)/$(IMAGE):$(VERSION)

.PHONY: docker-run
docker-run:
	@echo -e "$(OK_COLOR)[$(APP)] Run $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) run -it --rm=true $(NAMESPACE)/$(IMAGE):$(VERSION) -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix emacs-snapshot

.PHONY: docker-debug
docker-debug:
	@echo -e "$(OK_COLOR)[$(APP)] Run $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) run -it --rm=true $(NAMESPACE)/$(IMAGE):$(VERSION) /bin/bash

.PHONY: docker-test
docker-test:
	@echo -e "$(OK_COLOR)[$(APP)] Launch tests using Docker $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) run --rm -t $(IMAGE):$(VERSION) /.emacs.d/test/run-docker-test
