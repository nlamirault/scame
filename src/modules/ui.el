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

;;; ui.el -*- lexical-binding: t; -*-

;; Enable treemacs.el
(use-package treemacs
  :straight t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))
    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;; Enable treemacs icons when using dired buffer.
(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

;; ;; Enable using magit.el integrated with treemacs.
;; (use-package treemacs-magit
;;   :after (treemacs magit)
;;   :ensure t)

;; Enable tabs using buitin tab-bar-mode.
(use-package treemacs-tab-bar        ; treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;; all the icons packages for treemacs.
(use-package treemacs-all-the-icons  ; icons
  :straight t
  :after treemacs)

(use-package  all-the-icons
  :straight t
  :init
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons")
  :if (display-graphic-p))

(use-package vertico
  :straight t
  :init
  (vertico-mode))

(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Welcome to Scame")
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                        ;; (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
  )

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; (use-package spaceline
;;   :straight t
;;   :config
;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

;; (use-package spaceline-config
;;   :config
;;   (spaceline-toggle-buffer-position-off)
;;   (spaceline-toggle-hud-off)
;;   (spaceline-toggle-projectile-root-on)
;;   (spaceline-toggle-minor-modes-off)
;;   (spaceline-toggle-flycheck-error-on)
;;   (spaceline-toggle-flycheck-warning-on)
;;   (spaceline-toggle-flycheck-info-on)
;;   (spaceline-toggle-which-function-on))

;; (setq-default
;;  powerline-height 20
;;  spaceline-workspace-numbers-unicode 't
;;  spaceline-window-numbers-unicode 't
;;  spaceline-separator-dir-left '(right . right)
;;  spaceline-separator-dir-right '(left . left))


(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;(load-theme 'doom-nord t)
  (load-theme 'doom-material-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;;(doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(provide 'ui)
