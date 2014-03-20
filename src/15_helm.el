;;
;; HELM configuration
;;

(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x M-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-i") 'helm-imenu)

(custom-set-variables
   '(helm-ff-tramp-not-fancy nil)
    '(helm-ff-skip-boring-files t))

(loop for name in '("\\*tramp" "\\*epc")
            do (add-to-list 'helm-boring-buffer-regexp-list name))
(loop for ext in '("\\.elc$" "\\.pyc$")
            do (add-to-list 'helm-boring-file-regexp-list ext))
