# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

#
# SPDX-License-Identifier: Apache-2.0

#
# SPDX-License-Identifier: Apache-2.0

APP = S C A M E

SHELL = /bin/bash -o pipefail

DIR = $(shell pwd)

SRC_DIR = src

# ELS  = $(SRC_DIR)/init.el
# ELS += $(SRC_DIR)/core/os.el
# ELS += $(SRC_DIR)/core/straight.el
# ELS += $(SRC_DIR)/modules/keymaps.el
# ELS += $(SRC_DIR)/modules/ui.el
# ELS += $(SRC_DIR)/modules/lsp.el
# ELS += $(SRC_DIR)/modules/dev.el
ELS = $(shell find $(SRC_DIR) -name "*.el")
# OBJECTS = $(ELS:.el=.elc)

EMACS ?= emacs
CASK ?= cask
EMACSFLAGS = -Q -batch -L $(SRC_DIR) $(NO_LOAD_WARNINGS)
COMPILE_COMMAND  = --eval "(setq byte-compile-error-on-warn t)" -f batch-byte-compile
CHECKDOC_COMMAND = -l "test/checkdock.el"

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
INFO_COLOR=\033[36m
WHITE_COLOR=\033[1m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

OK=[✅]
KO=[❌]
WARN=[⚠️]

.PHONY: help
help:
	@echo -e "$(OK_COLOR)                            $(APP)$(NO_COLOR)"
	@echo "------------------------------------------------------------------"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make ${INFO_COLOR}<target>${NO_COLOR}\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  ${INFO_COLOR}%-25s${NO_COLOR} %s\n", $$1, $$2 } /^##@/ { printf "\n${WHITE_COLOR}%s${NO_COLOR}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo -e "$(ERROR_COLOR)Environment variable $* not set$(NO_COLOR)"; \
		exit 1; \
	fi

check-%:
	@if $$(hash $* 2> /dev/null); then \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) $*"; \
	else \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) $*"; \
	fi

##@ Development

.PHONY: check
check: check-terraform check-tflint check-terraform-docs check-pre-commit ## Check requirements

.PHONY: validate
validate: ## Execute git-hooks
	@pre-commit run -a

# %.elc: %.el
# 	@printf "Compiling $<\n"
# 	$(CASK) exec $(EMACS) $(EMACSFLAGS) $(COMPILE_COMMAND) $<

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

.PHONY: checkdoc
checkdoc: ## Checks the EmacsLisp code
	@echo -e "$(OK_COLOR)[$(APP)] Check EmacsLisp code$(NO_COLOR)"
	for i in $(ELS); do \
		echo $$i && $(CASK) exec $(EMACS) --batch -L . --eval="(checkdoc)" -Q $$i; \
	done
