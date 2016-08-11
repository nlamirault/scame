;;; 30_dev.el -- Commons configurations for development

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(add-hook 'text-mode-hook #'bug-reference-mode)
(add-hook 'prog-mode-hook #'bug-reference-prog-mode)

;; (use-package fill-column-indicator
;;   :config (progn
;;             (fci-mode 1)
;;             (setq fci-rule-width 1)
;;             ;; (setq fci-rule-color "darkcyan")
;;             (setq fci-rule-column 80)
;;             (define-globalized-minor-mode global-fci-mode fci-mode
;;               (lambda ()
;;                 (fci-mode 1)))
;;             (global-fci-mode 1)))


(use-package editorconfig
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.editorconfig" . conf-unix-mode))
          (editorconfig-mode 1)))


(use-package projectile
  ;; :defer scame-defer-package
  ;;:init (projectile-global-mode 1)
  :config (progn
            (projectile-global-mode t)
	    (setq projectile-enable-caching t)
	    (setq projectile-require-project-root nil)
            ;;(setq projectile-switch-project-action 'projectile-dired)
	    ;;(setq projectile-switch-project-action 'projectile-find-dir)
	    (setq projectile-switch-project-action 'projectile-find-file)
	    (add-to-list 'projectile-globally-ignored-files
			 ".DS_Store"))
  :diminish projectile-mode)

(use-package ibuffer-projectile
  ;; :defer scame-defer-package
  :config (progn
            (add-hook 'ibuffer-hook
                      (lambda ()
                        (ibuffer-projectile-set-filter-groups)
                        (unless (eq ibuffer-sorting-mode 'alphabetic)
                          (ibuffer-do-sort-by-alphabetic) ; first do alphabetic sort
                          (ibuffer-do-sort-by-major-mode))))))


(defun ivy-switch-project ()
  (interactive)
  (ivy-read
   "Switch to project: "
   (if (projectile-project-p)
       (cons (abbreviate-file-name (projectile-project-root))
             (projectile-relevant-known-projects))
     projectile-known-projects)
   :action #'projectile-switch-project-by-name))

(message "Scame completion : %s" scame-completion-method)

(cond ((eql 'ido scame-completion-method)
       (setq projectile-completion-system 'ido))

      ((eql 'helm scame-completion-method)
       (progn
         (message "Projectile with Helm")
         (use-package helm-projectile
           :config (setq projectile-completion-system 'helm)
           :bind (("C-c p SPC" . helm-projectile)))
         (helm-projectile-on)
         (setq projectile-completion-system 'helm)))

      ((eql 'ivy scame-completion-method)
       (progn
         (message "Projectile with Ivy")
         (setq projectile-completion-system 'ivy)
         ;; (global-set-key (kbd "C-c p SPC") 'ivy-switch-project)))
         (use-package counsel-projectile
           :bind (:map projectile-command-map
                       ("p" . counsel-projectile)))))

      (t (setq projectile-completion-system 'ido)))


(use-package persp-projectile
  :bind (("C-c p n" . projectile-persp-switch-project)))


(setq-default indent-tabs-mode nil)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(add-hook 'find-file-hook 'copyright-update)

(which-function-mode)

(use-package ansi-color)

(defun scame-colorize-compilation-buffer ()
  "Taken from
http://stackoverflow.com/questions/3072648/cucumbers-ansi-colors-messing-up-emacs-compilation-buffer/3072831#3072831"
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'scame-colorize-compilation-buffer)


(use-package neotree
  :init (progn
          (defun neotree-project-dir ()
            "Open dirtree using the git root."
            (interactive)
            (let ((project-dir (ffip-project-root))
                  (file-name (buffer-file-name)))
              (if project-dir
                  (progn
                    (neotree-dir project-dir)
                    (neotree-find file-name))
                (message "Could not find git project root.")))))
  :bind (("C-x t t" . neotree-toggle)
         ("C-x t p" . neotree-project-dir)))


;; Search

(use-package ag
  :commands (ag ag-project)
  :config (setq ag-highlight-search t))

(use-package pt
  :bind (("C-c p s p" . projectile-pt)))

;; (use-package sift)
;;   :bind (("C-c p s t" . projectile-pt)))


(use-package dumb-jump
  :init (progn
          (add-hook 'faust-mode-hook 'dumb-jump-mode))
  :bind (("C-x j g" . dumb-jump-go)
         ("C-x j b" . dumb-jump-back)
         ("C-x j q" . dumb-jump-quick-look)))


(provide '30_dev)
;;; 30_dev.el ends here
