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


(use-package ido
  ;;:init (ido-mode 1)
  :config (progn
            (setq ido-case-fold t)
            (setq ido-everywhere t)
            (setq ido-enable-prefix nil)
            (setq ido-enable-flex-matching t)
            (setq ido-create-new-buffer 'always)
            (setq ido-max-prospects 10)
            (add-to-list 'ido-ignore-files "\\.DS_Store")))


(global-unset-key (kbd "C-x h"))
(define-prefix-command 'scame-helm-map)
(global-set-key (kbd "C-x h") 'scame-helm-map)


(use-package helm
  ;; :init (progn
  ;;         (helm-mode 1))
  ;; :config (progn
  ;;           (setq helm-ff-tramp-not-fancy nil)
  ;;           (setq helm-ff-skip-boring-files t)
  ;;           (add-to-list 'helm-boring-buffer-regexp-list "\\*tramp")
  ;;           (add-to-list 'helm-boring-buffer-regexp-list "\\*epc")
  ;;           (add-to-list 'helm-boring-buffer-regexp-list "\\.elc$")
  ;;           (add-to-list 'helm-boring-buffer-regexp-list "\\.pyc$"))
  :bind (("C-x h F" . helm-find-files)
         ("C-x h f" . helm-for-files)
         ("C-x h r" . helm-recentf)
         ("C-x h x" . helm-M-x)
         ("C-x h y" . helm-show-kill-ring)
         ("C-x h l" . helm-bookmarks)
         ("C-x h a" . helm-apropos)
         ("C-x h i" . helm-info-emacs)
	 ("C-x h b" . helm-buffers-list)))

(use-package helm-occur
  :bind (("C-x h o" . helm-occur)))

(use-package helm-imenu
  :bind (("C-x h i" . helm-imenu)))

(use-package helm-proc)

(use-package helm-descbinds
  :bind ("C-x h h" . helm-descbinds))

(use-package helm-swoop
  :config (progn
            (setq helm-multi-swoop-edit-save t)
            (setq helm-swoop-split-direction 'split-window-vertically))
  :bind (("C-x h w" . helm-swoop)
         ("C-x h W" . helm-multi-swoop)))

(use-package helm-dash
  :config (progn
            (setq helm-dash-min-length 1)
            (setq helm-dash-browser-func 'eww)))

(use-package ivy
  :diminish ivy-mode)

(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
(autoload 'ivy-read "ivy")

;; (use-package swiper-helm)

(cond ((eql 'ido scame-completion-method)
       (ido-mode 1))
      ((eql 'helm scame-completion-method)
       (helm-mode 1))
      ((eql 'ivy scame-completion-method)
       (ivy-mode t))
      (t (ido-mode 1)))



(provide '04_search)
;;; 04_search.el ends here
