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
EMACS_BATCH_OPTS = --batch -Q --debug-init --eval "(setq my-disable-idle-timer t)"

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

.PHONY: clean
clean: ## clean Scame installation
	@rm -fr *.elc

.PHONY: check
check: check-terraform check-tflint check-terraform-docs check-pre-commit ## Check requirements

.PHONY: validate
validate: ## Execute git-hooks
	@pre-commit run -a

# %.elc: %.el
# 	@printf "Compiling $<\n"
# 	$(CASK) exec $(EMACS) $(EMACSFLAGS) $(COMPILE_COMMAND) $<

install: clean ## Clean environment
	@$(EMACS) $(EMACS_BATCH_OPTS) -l src/init.el

compile: install ## Compile Emacs Lisp files
	@$(EMACS) $(EMACS_BATCH_OPTS) -l src/init.el -l test/byte-compile.el 2>&1

# | grep -Ev "init-(hydra|evil).el:.*Warning: docstring wider than 80 characters|an obsolete" | grep -E "[0-9]: ([Ee]rror|[Ww]arning):" && exit 1 || exit 0

test: compile
	@$(EMACS) $(EMACS_BATCH_OPTS) -l src/init.el -l test/test.el
