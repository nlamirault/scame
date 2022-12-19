; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.
;
; SPDX-License-Identifier: Apache-2.0

;;; dev.el -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :bind
  (:map global-map
		("C-x g" . magit-status))
)

;; Golang

(use-package go-mode
  :straight t
  ;:hook
  ;(go-mode . lsp-deferred)
  ;(go-mode . company-mode)
  :config
  ;; GOPATH to gopls
  ;; (add-to-list 'exec-path "~/go/bin")
  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
	(add-hook 'before-save-hook #'lsp-format-buffer t t)
	(add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  )

(use-package rustic
  :straight t
  :init
  (setq rustic-lsp-client 'eglot)
  
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; set rustfmt on save
  (setq rustic-format-on-save t))

;; Enable cargo.el
(use-package cargo
  :hook
  (rust-mode . cargo-minor-mode))

(provide 'dev)