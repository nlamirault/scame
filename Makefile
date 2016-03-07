# Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
CASK ?= cask
VAGRANT ?= vagrant

DOCKER ?= docker
NAMESPACE = nlamirault
IMAGE = scame

# ELS = $(wildcard src/scame/*.el)
# OBJECTS = $(ELS:.el=.elc)

VERSION=$(shell \
        grep "defvar scame-version-number" src/scame/core/01_scame_version.el \
	|awk -F'"' '{print $$2}')

PACKAGE=$(APP)-$(VERSION)
ARCHIVE=$(PACKAGE).tar

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

.PHONY: clean
clean: ## clean Scame installation
	@$(CASK) clean-elc
	@rm -fr dist $(ARCHIVE).gz test/sandboxorg-clock-save.el test/sandbox

reset: clean
	@rm -fr .cask

.PHONY: elpa
elpa:
	@echo -e "$(OK_COLOR)[$(APP)] Cask setup $(NO_COLOR)"
	@$(CASK) install
	@$(CASK) update
	@touch .cask

.PHONY: deps
deps:
	@echo -e "$(OK_COLOR)[$(APP)] Outdated dependencies $(NO_COLOR)"
	@$(CASK) --path src outdated

.PHONY: install
install: clean ## Install Scame dependencies
	$(CASK) exec $(EMACS) -Q --batch -L . -L test \
		--eval "(progn (require 'test-helper) (install-scame))"
	$(CASK) exec $(EMACS) -Q --batch -L . -L test -L test/sandbox/scame \
		--eval "(progn (require 'test-helper) (cleanup-load-path) (setup-scame-test) (require 'scame))"

.PHONY: test
test: elpa ## Launch unit tests
	@echo -e "$(OK_COLOR)[$(APP)] Launch unit tests$(NO_COLOR)"
	@$(CASK) exec ert-runner -L test/sandbox

.PHONY: test-tag
test-tag: elpa
	@echo -e "$(OK_COLOR)[$(APP)] Launch unit tests$(NO_COLOR)"
	@$(CASK) exec ert-runner -L test/sandbox --verbose --debug -t $(tag)


.PHONY: virtual-test
virtual-test:
	@$(VAGRANT) up
	@$(VAGRANT) ssh -c "make -C /vagrant EMACS=$(EMACS) clean test"

release:
	@echo -e "$(OK_COLOR)[$(APP)] Make archive $(VERSION) $(NO_COLOR)"
	@rm -fr $(PACKAGE) && mkdir $(PACKAGE)
	@cp -r src/* $(PACKAGE)
	@tar cf $(ARCHIVE) $(PACKAGE)
	@gzip $(ARCHIVE)
	@rm -fr $(PACKAGE)
	@addons/github.sh $(VERSION)


#
# Docker
#


.PHONY: docker-build
docker-build:
	@echo -e "$(OK_COLOR)[$(APP)] Build $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) build -t $(NAMESPACE)/$(IMAGE):$(VERSION) .

.PHONY: docker-publish
docker-publish: docker-build
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
	@$(DOCKER) run -it --rm=true -e DISPLAY=unix${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix emacs-snapshot --name scame $(NAMESPACE)/$(IMAGE):$(VERSION)

.PHONY: docker-debug
docker-debug:
	@echo -e "$(OK_COLOR)[$(APP)] Run $(IMAGE):$(VERSION) $(NO_COLOR)"
	@$(DOCKER) run -it --rm=true $(NAMESPACE)/$(IMAGE):$(VERSION) /bin/bash
