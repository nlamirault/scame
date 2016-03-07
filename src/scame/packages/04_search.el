;;; 04_search.el --- Emacs search frameworks configuration

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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



(global-unset-key (kbd "C-x c"))
(define-prefix-command 'scame-completion-map)
(global-set-key (kbd "C-x c") 'scame-completion-map)


(defun scame--setup-ido ()
  "Setup Scame with IDO backend."
  (use-package ido
    ;;:init (ido-mode 1)
    :config (progn
              (setq ido-case-fold t)
              (setq ido-everywhere t)
              (setq ido-enable-prefix nil)
              (setq ido-enable-flex-matching t)
              (setq ido-create-new-buffer 'always)
              (setq ido-max-prospects 10)
              (add-to-list 'ido-ignore-files "\\.DS_Store"))))

(defun scame--setup-helm ()
  "Setup Scame with HELM backend."

  (use-package helm
    :bind (("C-x c F" . helm-find-files)
           ("C-x c f" . helm-for-files)
           ("C-x c r" . helm-recentf)
           ("C-x c x" . helm-M-x)
           ("C-x c y" . helm-show-kill-ring)
           ("C-x c l" . helm-bookmarks)
           ("C-x c a" . helm-apropos)
           ("C-x c i" . helm-info-emacs)
           ("C-x c b" . helm-buffers-list)))

  (use-package helm-occur
    :bind (("C-x c o" . helm-occur)))

  (use-package helm-imenu
    :bind (("C-x c i" . helm-imenu)))

  (use-package helm-descbinds
    :bind ("C-x c h" . helm-descbinds))

  (use-package helm-swoop
    :config (progn
              (setq helm-multi-swoop-edit-save t)
              (setq helm-swoop-split-direction 'split-window-vertically))
    :bind (("C-x c w" . helm-swoop)
           ("C-x c W" . helm-multi-swoop)))
  )


(defun scame--setup-ivy ()
    "Setup Scame using IVY backend."
  (use-package counsel
    :bind (("C-x c F" . counsel-find-file)
           ("C-x c v" . counsel-describe-variable)
           ("C-x c f" . counsel-describe-function)
           ("C-x c y" . counsel-info-lookup-symbol)
           ("C-x c i" . counsel-imenu)))

  (use-package ivy
    :diminish ivy-mode
    :bind (("C-x c r" . ivy-recentf)
           ("C-x c b" . ivy-switch-buffer)))

  (use-package swiper
    :bind (("C-s" . swiper)
           ("C-r" . swiper)))
  (autoload 'ivy-read "ivy"))


(defun scame--setup-search-framework (completion-method)
  "Setup search frameworks using `COMPLETION-METHOD'."
  (cond ((eql 'ido completion-method)
         (progn
           (scame--setup-ido)
           (ido-mode 1)))
        ((eql 'helm completion-method)
         (progn
           (scame--setup-helm)
           (helm-mode 1)))
        ((eql 'ivy completion-method)
         (progn
           (scame--setup-ivy)
           (ivy-mode t)))
        (t (progn
             (scame--setup-ido)
             (ido-mode 1)))))


(scame--setup-search-framework scame-completion-method)




(provide '04_search)
;;; 04_search.el ends here
