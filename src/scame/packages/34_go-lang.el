;;; 34_go-lang.el -- Configuration for the GO language

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

;; Go dependencies :
;; - code.google.com/p/rog-go/exp/cmd/godef
;; - https://github.com/nsf/gocode

;;; Code:


(when scame-golang

  (use-package go-mode
    ;; :defer scame-defer-package
    :mode (("\\.go$" . go-mode))
    :config (progn
              (subword-mode +1)
              (add-hook 'before-save-hook 'gofmt-before-save)
              ;;(add-hook 'go-mode-hook 'go-oracle-mode)
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-x g i") 'go-goto-imports)
                          (local-set-key (kbd "C-x g d") 'godoc)
                          (local-set-key (kbd "C-x g j") 'godef-jump)))))

  (use-package go-eldoc
    ;; :defer scame-defer-package
    :config (add-hook 'go-mode-hook 'go-eldoc-setup))

  (use-package gotest
    ;; :defer scame-defer-package
    :config (add-hook 'go-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x g t") 'go-test-current-test)
                        (local-set-key (kbd "C-x g f") 'go-test-current-file)
                        (local-set-key (kbd "C-x g p") 'go-test-current-project))))

  (use-package go-errcheck
    ;; :defer scame-defer-package
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g e") 'go-errcheck)))))


  (use-package golint
    ;; :defer scame-defer-package
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g l") 'golint)))))

  (use-package go-rename
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g R") 'go-rename)))))

  (use-package go-dlv
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g d") 'dlv-current-func)))))

  (use-package go-direx
    ;; :defer scame-defer-package
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g x")
                                         'go-direx-pop-to-buffer)))))

  (use-package go-projectile
    ;; :defer scame-defer-package)
    )

  (use-package company-go
    ;; :defer scame-defer-package
    :config (add-hook 'go-mode-hook
                      (lambda ()
                        (set (make-local-variable 'company-backends) '(company-go))
                        (company-mode))))

)

(provide '34_go-lang)
;;; 34_go-lang.el ends here
