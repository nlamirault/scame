
;;; 30_dev.el -- Commons configurations for development

;; Copyright (C) 2014, 2015, 2016, 2017, 2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

;; change-log-mode is hard-coded to use TABs for indentation. Get around that with:
(add-hook 'change-log-mode-hook
          (function (lambda () (setq indent-tabs-mode nil))))
(setq tab-width 8)
(add-hook 'text-mode-hook #'bug-reference-mode)
(add-hook 'prog-mode-hook #'bug-reference-prog-mode)

(use-package editorconfig
  :ensure t
  :pin melpa
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.editorconfig" . conf-unix-mode))
          (editorconfig-mode 1)))



(defun ivy-switch-project ()
  (interactive)
  (ivy-read
   "Switch to project: "
   (if (projectile-project-p)
       (cons (abbreviate-file-name (projectile-project-root))
             (projectile-relevant-known-projects))
     projectile-known-projects)
   :action #'projectile-switch-project-by-name))


(use-package projectile
  :ensure t
  :pin melpa
  :config (progn
            (projectile-global-mode t)
            (setq projectile-completion-system 'ivy)
	    (setq projectile-enable-caching t)
	    (setq projectile-require-project-root nil)
            ;;(setq projectile-switch-project-action 'projectile-dired)
	    ;;(setq projectile-switch-project-action 'projectile-find-dir)
	    (setq projectile-switch-project-action 'projectile-find-file)
	    (add-to-list 'projectile-globally-ignored-files
			 ".DS_Store"))
  :bind (("C-c p SPC" . ivy-switch-project))
  :diminish projectile-mode)

(use-package ibuffer-projectile
  :ensure t
  :pin melpa
  :config (progn
            (add-hook 'ibuffer-hook
                      (lambda ()
                        (ibuffer-projectile-set-filter-groups)
                        (unless (eq ibuffer-sorting-mode 'alphabetic)
                          (ibuffer-do-sort-by-alphabetic) ; first do alphabetic sort
                          (ibuffer-do-sort-by-major-mode))))))

;; (use-package persp-mode
;;   :ensure t
;;   :pin melpa
;;   :commands (persp-mode
;;              persp-switch persp-prev persp-next)
;;   :bind (("C-c RET" . persp-switch)
;;          ("M-["     . persp-prev)
;;          ("M-]"     . persp-next))
;;   :init (progn
;;           (custom-set-variables
;;            '(persp-keymap-prefix (kbd "C-x x")))
;;           (setq persp-save-dir (concat scame-cache-directory "persp-confs/"))
;;           (persp-mode 1))
;;   :config (progn
;;             (setq wg-morph-on nil) ;; switch off animation
;;             (setq persp-autokill-buffer-on-remove 'kill) ; 'kill-weak)
;;             ;; Kill buffers not belonging to any perspective.
;;             (set-face-background 'persp-face-lighter-buffer-not-in-persp
;;                                  (face-attribute 'isearch-fail :background))
;;             (set-face-foreground 'persp-face-lighter-buffer-not-in-persp
;;                                  (face-attribute 'isearch-fail :foreground))))

;; (use-package persp-mode-projectile-bridge
;;   :ensure t
;;   :pin melpa
;;   :commands (persp-mode-projectile-bridge-mode)
;;   :functions (persp-mode-projectile-bridge-find-perspectives-for-all-buffers
;;               persp-mode-projectile-bridge-kill-perspectives)
;;   :preface (progn
;;              (autoload 'persp-mode-projectile-bridge-mode "persp-mode-projectile-bridge")
;;              (defun enable-persp-mode-projectile-bridge-mode ()
;;                "Enable persp-mode-projectile-bridge mode."
;;                (persp-mode-projectile-bridge-mode t)))
;;   :init (progn
;;           (add-hook 'persp-mode-projectile-bridge-mode-hook
;;                     #'(lambda ()
;;                         (if persp-mode-projectile-bridge-mode
;;                             (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
;;                           (persp-mode-projectile-bridge-kill-perspectives))))
;;           (add-hook 'after-change-major-mode-hook #'enable-persp-mode-projectile-bridge-mode)))


(use-package counsel-projectile
  :ensure t
  :pin melpa
  :config (counsel-projectile-mode 1))


(setq-default indent-tabs-mode nil)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(add-hook 'find-file-hook 'copyright-update)

(which-function-mode)

(use-package ansi-color
  :ensure t
  :pin melpa)

(defun scame-colorize-compilation-buffer ()
  "Taken from
http://stackoverflow.com/questions/3072648/cucumbers-ansi-colors-messing-up-emacs-compilation-buffer/3072831#3072831"
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'scame-colorize-compilation-buffer)

(use-package eyebrowse
  :ensure t
  :pin melpa
  :config (progn
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)
            (eyebrowse-setup-opinionated-keys)))

(use-package neotree
  :ensure t
  :pin melpa
  :init (progn
           (setq neo-theme 'icons
                 neo-smart-open t)
          (defun neotree-project-dir ()
            "Open NeoTree using the git root."
            (interactive)
            (let ((project-dir (projectile-project-root))
                  (file-name (buffer-file-name)))
              (neotree-toggle)
              (if project-dir
                  (if (neo-global--window-exists-p)
                      (progn
                        (neotree-dir project-dir)
                        (neotree-find file-name)))
                (message "Could not find git project root.")))))
  :config (progn
            (setq projectile-switch-project-action 'neotree-projectile-action))
  :bind (("C-x t t" . neotree-toggle)
         ("C-x t p" . neotree-project-dir)))

;; (use-package treemacs
;;   :ensure t
;;   :pin melpa
;;   :bind (("C-x T t" . treemacs-toggle))
;;   :config (progn
;;            (setq treemacs-width 25)
;;            (setq treemacs-git-integration t)
;;            (setq treemacs--persist-file (locate-user-emacs-file "cache/treemacs-persist"))
;;            (treemacs-follow-mode)
;;            (treemacs-filewatch-mode)))

;; (use-package treemacs-projectile
;;   :ensure t
;;   :pin melpa
;;   :bind (("C-x T p" . treemacs-projectile))
;;   :config (setq treemacs-header-function #'treemacs-projectile-create-header))


(use-package dired-sidebar
  :ensure t
  :pin melpa
  :commands (dired-sidebar-toggle-sidebar)
  :bind (("C-x T t" . dired-sidebar-toggle-sidebar))
  :config (progn
            (cond
             ((eq system-type 'gnu/linux)
              (if (display-graphic-p)
                  (setq dired-sidebar-theme 'icons)))
             ((eq system-type 'darwin)
                 (if (display-graphic-p)
                  (setq dired-sidebar-theme 'icons)
                (setq dired-sidebar-theme 'nerd))
              (setq dired-sidebar-face '(:family "Helvetica" :height 80)))
             ((eq system-type 'windows-nt)
              (setq dired-sidebar-theme 'nerd)
              (setq dired-sidebar-face '(:family "Lucida Sans Unicode" :height 110)))
             (:default
              (setq dired-sidebar-theme 'nerd)
              (setq dired-sidebar-face '(:family "Arial" :height 120))))
            (setq dired-sidebar-use-term-integration t)
            (setq dired-sidebar-use-custom-font t)))


;; Search

;; See counsel.

;; (use-package ag

;;   :commands (ag ag-project)
;;   :config (setq ag-highlight-search t))

;; (use-package pt
;;   :bind (("C-c p s p" . projectile-pt)))

;; (use-package sift)
;;   :bind (("C-c p s t" . projectile-pt)))


(use-package dumb-jump
  :ensure t
  :pin melpa
  :init (progn
          (add-hook 'faust-mode-hook 'dumb-jump-mode))
  :bind (("C-x j g" . dumb-jump-go)
         ("C-x j b" . dumb-jump-back)
         ("C-x j o" . dumb-jump-go-other-window)
         ("C-x j x" . dumb-jump-go-prefer-external)
         ("C-x j q" . dumb-jump-quick-look))
  :config (setq dumb-jump-selector 'ivy))

(global-unset-key (kbd "C-x C-o"))
(define-prefix-command 'scame-origami-map)
(global-set-key (kbd "C-x C-o") 'scame-origami-map)

(use-package origami
  :ensure t
  :pin melpa
  :init (global-origami-mode)
  :bind (("C-x C-o +"  . origami-open-node)
         ("C-x C-o *"  . origami-open-all-nodes)
         ("C-x C-o -"  . origami-close-node)
         ("C-x C-o ="  . origami-close-all-nodes)
         ("C-x C-o /"  . origami-recursively-toggle-node)))


(provide '30_dev)
;;; 30_dev.el ends here
