;;; 31_python.el --- Python configuration

;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:

(use-package python
  :mode (("\\.py\\'" . python-mode))
  :config (progn
	    (define-key python-mode-map (kbd "RET") 'newline-and-indent)
	    (setq tab-width 4)))


(use-package jedi
  :commands jedi:setup
  :config (progn
	    (add-hook 'python-mode-hook 'jedi:setup)
	    (setq jedi:setup-keys t)
	    (setq jedi:complete-on-dot t)
	    (add-hook 'python-mode-hook (lambda ()
					  (setq fill-column 79)))))

(use-package elpy
  :config (progn
	    (elpy-enable)
	    (setq elpy-rpc-backend "jedi")
	    (delq 'flymake-mode elpy-default-minor-modes)
	    (delq 'highlight-indentation-mode elpy-default-minor-modes)))



(use-package virtualenvwrapper
  :commands venv-workon
  :config (progn
	    (setq venv-location "~/.virtualenvs/")
	    (venv-initialize-interactive-shells)
	    (venv-initialize-eshell)
	    (setq-default mode-line-format
			  (cons '(:exec venv-current-name)
				mode-line-format))
	    (add-hook 'python-mode-hook
		      (lambda ()
			(hack-local-variables)
			(venv-workon project-venv-name)))))


;; Elpy switch to pyvenv: https://github.com/jorgenschaefer/elpy/issues/149
;; Set in python project directory a file *.dir-locals.el* :
;; ((python-mode . ((pyvenv-workon . "xxxxx")))

(use-package tox
  :config (add-hook 'python-mode-hook
		    (lambda ()
		      (local-set-key (kbd "C-x t") 'tox-current-test)
		      (local-set-key (kbd "C-x c") 'tox-current-class))))
  ;; :bind (("C-x y t" . tox-current-test)
  ;;  	 ("C-x y c" . tox-current-class)))
  ;; :bind ((python-mode-map . ("C-x t"  . tox-current-test))
  ;; 	 (python-mode-map . ("C-x c"  . tox-current-class))))

;; (define-key python-mode-map (kbd "C-x t") 'tox-current-test)
;; (define-key python-mode-map (kbd "C-x c") 'tox-current-class)


(provide '31_python)
;;; 31_python.el ends here
