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

(require 'jedi)
(require 'elpy)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(elpy-enable)

(add-hook 'python-mode-hook (lambda () (setq fill-column 79)))
;;(add-hook 'python-mode-hook
;;	  (lambda ()
;;	    (unless (eq buffer-file-name nil) (flymake-mode 1))
;;	    (local-set-key [f2] 'flymake-goto-prev-error)
;;	    (local-set-key [f3] 'flymake-goto-next-error)))
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (local-set-key (kbd "C-c t") 'tox-current-test)
;; 	    (local-set-key (kbd "C-c c") 'tox-current-class)))

(define-key python-mode-map (kbd "C-c t") 'tox-current-test)
(define-key python-mode-map (kbd "C-c c") 'tox-current-class)

;; enable pep8
;; sudo pip install pep8
;;(when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;		       'flymake-create-temp-inplace))
;;	   (local-file (file-relative-name
;;			temp-file
;;			(file-name-directory buffer-file-name))))
;;    (list "pep8" (list "--repeat" local-file))))

;;(add-to-list 'flymake-allowed-file-name-masks
;;	       '("\\.py\\'" flymake-pylint-init)))

;;(defun my-flymake-show-help ()
;;  (when (get-char-property (point) 'flymake-overlay)
;;   (let ((help (get-char-property (point) 'help-echo)))
;;      (if help (message "%s" help)))))

;;(add-hook 'post-command-hook 'my-flymake-show-help)

(require 'virtualenvwrapper)
(setq venv-location "~/.virtualenvs/")
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(add-hook 'python-mode-hook
          (lambda ()
            (hack-local-variables)
            (venv-workon project-venv-name)))
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

;; Elpy switch to pyvenv: https://github.com/jorgenschaefer/elpy/issues/149
;; Set in python project directory a file *.dir-locals.el* :
;; ((python-mode . ((pyvenv-workon . "xxxxx")))


(provide '31_python)
;;; 31_python.el ends here
