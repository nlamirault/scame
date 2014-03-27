;;; 14_cloud.el --- Cloud configuration

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

;; Puppet files
(autoload 'puppet-mode "puppet-mode" "Major mode for editing Puppet config" t)
(setq auto-mode-alist  (cons '(".pp$" . puppet-mode) auto-mode-alist))

;; Vagrant files
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Docker files
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

(defun puppet-block-align ()
  "Align the => characters for a block."
  (interactive)
  (save-excursion
    (let ((apoint (search-backward " {" nil t))
          (epoint (re-search-forward "}[\n \t]" nil t)))
      (when apoint
        (align-regexp apoint epoint "\\(\\s-*\\)=>" 1 1)
        (puppet-flash-region apoint epoint)))))


;; Indent without tabs
(add-hook 'puppet-mode-hook
          (lambda ()
            (make-local-variable 'indent-tabs-mode)
            (setq indent-tabs-mode nil)))


(provide '14_cloud)
;;; 14_cloud.el ends here
