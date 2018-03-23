;;; scame-go.el -- Configuration for the GO language

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Go dependencies (go get -u ....):
;;
;; - https://github.com/nsf/gocode
;; - code.google.com/p/rog-go/exp/cmd/godef
;; - golang.org/x/tools/cmd/godoc
;; - github.com/golang/lint/golint
;; - golang.org/x/tools/cmd/guru
;; - github.com/kisielk/errcheck
;; - github.com/fatih/gomodifytags
;; - github.com/derekparker/delve/cmd/dlv
;; -
;; -
;; -
;; -
;; -
;; -
;; -
;; -
;; -

;;; Code:


(when scame-golang

  (use-package go-mode
    :ensure t
    :pin melpa
    :defer t
    :mode (("\\.go$" . go-mode))
    :config
    (progn

      (subword-mode +1)
      (add-hook 'before-save-hook 'gofmt-before-save)
      ;;(add-hook 'go-mode-hook 'go-oracle-mode)
      (add-hook 'go-mode-hook
                (lambda ()
                  (local-set-key (kbd "C-x g r") 'go-remove-unused-imports)
                  (local-set-key (kbd "C-x g i") 'go-goto-imports)
                  (local-set-key (kbd "C-x g d") 'godoc)
                  (local-set-key (kbd "C-x g j") 'godef-jump)))

      (define-key go-mode-map (kbd "C-x g h")
        (defhydra hydra-go (:color blue)
      "
   ^Test^            ^Tools^           ^Navigate^
  ╭─────────────────────────────────────────────────────
   _t_: test         _d_: godoc        _D_: definition
   _f_: file         _e_: errcheck     _R_: referrers
   _p_: project      _l_: golint
  ------------------------------------------------------------
        "
      ("q" nil "quit")
      ("t" go-test-current-test "test")
      ("f" go-test-current-file "file")
      ("p" go-test-current-project "project")
      ("d" godoc "godoc")
      ("e" go-errcheck "errcheck")
      ("l" golint "golint")
      ("D" go-guru-definition "go-guru")
      ("R" go-guru-referrers "go-guru")
      ))

      ))

  (use-package go-eldoc
    :ensure t
    :pin melpa
    :defer t
    :config (add-hook 'go-mode-hook 'go-eldoc-setup))

  (use-package gotest
    :ensure t
    :pin melpa
    :defer t
    :config (add-hook 'go-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x g t") 'go-test-current-test)
                        (local-set-key (kbd "C-x g f") 'go-test-current-file)
                        (local-set-key (kbd "C-x g p") 'go-test-current-project))))

  (use-package go-errcheck
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g e") 'go-errcheck)))))


  (use-package golint
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g l") 'golint)))))

  (use-package go-rename
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g R") 'go-rename)))))

  (use-package go-dlv
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g d") 'dlv-current-func)))))

  (use-package go-direx
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (add-hook 'go-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x g x")
                                         'go-direx-pop-to-buffer)))))

  (use-package go-projectile
    :ensure t
    :pin melpa
    :defer t
    )

  (use-package company-go
    :ensure t
    :pin melpa
    :defer t
    :config (progn
              (setq company-go-show-annotation t)
              (add-to-list 'company-backends 'company-go)))

 ;; (use-package go-autocomplete
 ;;   :ensure t
 ;;   :pin melpa)


)

(provide 'scame-go)
;;; scame-go.el ends here
