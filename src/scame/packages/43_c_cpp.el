;;; 43_c_cpp.el -- C/C++ configuration

;; Copyright (C) 2014, 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style


;; (use-package cc-mode
;;   :config (progn
;;             ;; broke php-mode ??
;;             ;; (setq c-default-style "linux"
;;             ;;       c-basic-offset 4)
;;             (add-hook 'c-mode-hook
;;                       (lambda ()
;;                         (setq flycheck-clang-include-path
;;                               (list "/usr/include/"))
;;                         (setq flycheck-gcc-include-path
;;                               (list "/usr/include/"))))))

;; (use-package company-c-headers
;;   :config (add-to-list 'company-backends 'company-c-headers))


;; (use-package c-eldoc
;;   :config (progn
;;             (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;;             (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)))

(use-package irony
  :config (progn
            (defun scame--irony-mode ()
              ;; Avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
              (when (member major-mode irony-supported-major-modes)
                (irony-mode 1)))
            (add-hook 'c++-mode-hook 'scame--irony-mode)
            (add-hook 'c-mode-hook 'scame--irony-mode)
            (add-hook 'objc-mode-hook 'scame--irony-mode)
            (add-hook 'irony-mode-hook (lambda ()
                                         (define-key irony-mode-map [remap completion-at-point]
                                           'irony-completion-at-point-async)
                                         (define-key irony-mode-map [remap complete-symbol]
                                           'irony-completion-at-point-async)))))

(use-package company-irony
  :config (progn
            (add-to-list 'company-backends 'company-irony)
            (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
            (add-hook 'irony-mode-hook 'company-mode)))

(use-package flycheck-irony
  :config (progn
            (add-to-list 'flycheck-checkers 'irony)
            (add-hook 'irony-mode-hook 'flycheck-mode)))

(use-package irony-eldoc
  :config (add-hook 'irony-mode-hook 'irony-eldoc))


(provide '43_c_cpp)
;;; 43_c_cpp.el ends here
