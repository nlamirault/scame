;; Cloud configuration
;;
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

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
  "align the => characters for a block"
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
