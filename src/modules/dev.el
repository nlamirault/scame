;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;; SPDX-License-Identifier: Apache-2.0

;;; dev.el -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :bind
  (:map global-map ("C-x g" . magit-status))
)

;; -----------------------------
;; Golang

(use-package go-mode
  :straight t
  ;:hook
  ;(go-mode . lsp-deferred)
  ;(go-mode . company-mode)
  :config
  ;; (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-hook 'go-mode-hook 'eglot-ensure))


;; -----------------------------
;; Rust

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


;; -----------------------------
;; Python

(use-package python-mode
  :config
  (add-hook 'python-mode-hook 'eglot-ensure)
  :hook
  (python-mode . (lambda ()
		   (setq tab-width 4)
		   (setq indent-tabs-mode nil))))

;; -----------------------------
;; C/C++

;; (use-package c-mode
;;   :straight nil
;;   :config
;;   (add-hook 'c-mode-hook 'eglot-ensure))

;; (use-package c++-mode
;;   :config
;;   (add-hook 'c++-mode-hook 'eglot-ensure))

;; -----------------------------
;; Others

;; (use-package sh-mode
;;   :straight t
;;   :mode
;;   (("bashrc$" . sh-mode)
;;    ("bash_profile$" . sh-mode)
;;    ("bash_aliases$" . sh-mode)
;;    ("bash_local$" . sh-mode)
;;    ("bash_completion$" . sh-mode)
;;    ("\\.zsh" . sh-mode)
;;    ("runcoms/[a-zA-Z]+$" . sh-mode))
;;   :config
;;   (setq-default sh-indentation 4)
;;   (add-hook 'sh-mode-hook 'eglot-ensure))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml" . yaml-mode))

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md'" . markdown-mode)
         ("\\.markdown'" . markdown-mode)))

;; Protocol Buffer
(use-package protobuf-mode
  :ensure t
  :mode ("\\.proto" . protobuf-mode))

(provide 'dev)
