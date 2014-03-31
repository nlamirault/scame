;;; 30_dev.el -- Commons configurations for development

;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; From : http://batsov.com/projectile/

;;(require 'projectile)

(use-package projectile
  :init (projectile-global-mode 1)
  :bind (("C-c h" . helm-projectile))
  :config (progn
	    (setq projectile-enable-caching t)
	    (setq projectile-require-project-root nil)
	    ;;(setq projectile-completion-system 'grizzl)
	    (setq projectile-completion-system 'ido)
	    (add-to-list 'projectile-globally-ignored-files
			 ".DS_Store")))


;; (projectile-global-mode)
;; (global-set-key (kbd "C-c h") 'helm-projectile)

(use-package project-explorer)
;;(require 'project-explorer)


(add-hook 'write-file-hooks 'delete-trailing-whitespace)


(provide '30_dev)
;;; 30_dev.el ends here
