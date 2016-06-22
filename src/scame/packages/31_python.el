;;; 31_python.el --- Python configuration

;; Copyright (c) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(when scame-python

  (use-package python
    ;; :defer scame-defer-package
    :mode (("\\.py\\'" . python-mode))
    :config (progn
              (define-key python-mode-map (kbd "RET") 'newline-and-indent)
              (setq tab-width 4)
              ;;(setq python-indent-guess-indent-offset 4)
              (setq python-indent-offset 4)))

  ;; FIXME
  ;; (use-package jedi
  ;;   :commands jedi:setup
  ;;   :config (progn
  ;; 	    (add-hook 'python-mode-hook 'jedi:setup)
  ;; 	    (setq jedi:setup-keys t)
  ;; 	    (setq jedi:complete-on-dot t)
  ;; 	    (add-hook 'python-mode-hook (lambda ()
  ;; 					  (setq fill-column 79)))))


  (use-package anaconda-mode
    ;; :defer scame-defer-package
    :config (progn
              (add-hook 'python-mode-hook 'anaconda-mode)
              (add-hook 'python-mode-hook 'eldoc-mode))
    :diminish anaconda-mode)

  (use-package company-anaconda
    ;; :defer scame-defer-package
    :config (add-to-list 'company-backends 'company-anaconda))

  ;; (use-package elpy
  ;;   :config (progn
  ;; 	    (elpy-enable)
  ;; 	    (setq elpy-rpc-backend "jedi")
  ;; 	    (delq 'flymake-mode elpy-default-minor-modes)
  ;; 	    (delq 'highlight-indentation-mode elpy-default-minor-modes)))


  ;; Elpy switch to pyvenv: https://github.com/jorgenschaefer/elpy/issues/149
  ;; Set in python project directory a file *.dir-locals.el* :
  ;; ((python-mode . ((pyvenv-workon . "xxxxx")))

  (use-package tox
    :config (add-hook 'python-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x y t") 'tox-current-test)
                        (local-set-key (kbd "C-x y f") 'tox-current-class))))

  (use-package jedi-direx
    ;; :defer scame-defer-package
    :config (progn
              (add-hook 'jedi-mode-hook 'jedi-direx:setup)
              (add-hook 'jedi-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x y x")
                                         'jedi-direx:pop-to-buffer)))))

  (use-package sphinx-doc
    ;; :defer scame-defer-package
    :config (add-hook 'python-mode-hook
                      (lambda ()
                        (require 'sphinx-doc)
                        (sphinx-doc-mode t)))
    :diminish sphinx-doc-mode)

  (use-package helm-pydoc
    ;; :defer scame-defer-package
    :config (add-hook 'python-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x y d") 'helm-pydoc))))

  (use-package pip-requirements
    ;; :defer scame-defer-package
    :mode (("\\requirements.txt\\'" . pip-requirements-mode)
           ("\\requirements-dev.txt\\'" . pip-requirements-mode)
           ("\\requirements-doc.txt\\'" . pip-requirements-mode)
           ("\\requirements-style.txt\\'" . pip-requirements-mode)
           ("\\requirements-test.txt\\'" . pip-requirements-mode)))

  (use-package py-yapf
    :config (add-hook 'python-mode-hook 'py-yapf-enable-on-save))


  (define-key python-mode-map (kbd "C-x y h")
    (defhydra hydra-python (:color blue)
      "
   ^Tox^                ^Misc^
  ╭─────────────────────────────────
   _t_: test            _d_: pydoc
   _f_: file
   _p_: project
  ----------------------------------
        "
      ("q" nil "quit")
      ("t" tox-current-test "test")
      ("f" tox-current-file "file")
      ("p" tox-current-project "project")
      ("d" helm-pydoc "pydoc")
      ))

  )


(provide '31_python)
;;; 31_python.el ends here
