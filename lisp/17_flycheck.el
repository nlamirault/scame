;;
;; setting for flycheck
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

(require 'flycheck-color-mode-line)

;;(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
