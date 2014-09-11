;;; 30_dev.el -- Commons configurations for development

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; From : http://batsov.com/projectile/

;;(require 'projectile)

;; change-log-mode is hard-coded to use TABs for indentation. Get around that with:
(add-hook 'change-log-mode-hook
          (function (lambda () (setq indent-tabs-mode nil))))

(use-package projectile
  :init (projectile-global-mode 1)
  :config (progn
	    (setq projectile-enable-caching t)
	    (setq projectile-require-project-root nil)
	    ;;(setq projectile-completion-system 'grizzl)
	    (setq projectile-completion-system 'ido)
	    ;;(setq projectile-switch-project-action 'projectile-dired)
	    ;;(setq projectile-switch-project-action 'projectile-find-dir)
	    (setq projectile-switch-project-action 'projectile-find-file)
	    (add-to-list 'projectile-globally-ignored-files
			 ".DS_Store")))

(use-package helm-projectile
  :bind (("C-c h" . helm-projectile)))

(use-package persp-projectile)

(condition-case e
    (require 'es-windows)
   (error (message "%s" e)))

;;(use-package project-explorer)

(setq-default indent-tabs-mode nil)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(add-hook 'find-file-hook 'copyright-update)

(which-function-mode)

(use-package ansi-color)

(defun scame-colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'scame-colorize-compilation-buffer)


(use-package know-your-http-well)

;; FIXME: doens't work. Package broken ?
;; (use-package fixmee
;;   :config (global-fixmee-mode 1)
;;   :bind (("C-x v f" . fixmee-view-listing)))

(use-package find-file-in-project)

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

(provide '30_dev)
;;; 30_dev.el ends here
