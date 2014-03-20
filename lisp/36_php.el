;;
;; PHP configuration
;;



(setq php-mode-force-pear t)

;; (add-hook 'php-mode-hook
;;           (lambda nil
;;             (setq indent-tabs-mode nil)
;;             (setq-default indent-tabs-mode nil)
;;             (setq-default tab-width 4)
;;             (setq c-basic-offset 4)
;;             (setq c-basic-indent 4)
;;             (column-highlight 150)
;;             (setq fill-column 150)
;;             (turn-on-auto-fill)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
