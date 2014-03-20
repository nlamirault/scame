;;; buffers.el
;;
;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>

;;; Code:

(require 'swoop)
(global-set-key (kbd "C-o")   'swoop)
(global-set-key (kbd "C-M-o") 'swoop-multi)
(global-set-key (kbd "M-o")   'swoop-pcre-regexp)
(global-set-key (kbd "C-S-o") 'swoop-back-to-last-position)
(global-set-key (kbd "H-6")   'swoop-migemo) ;; Option for Japanese match

(provide 'buffers)
;;; buffers.el ends here
