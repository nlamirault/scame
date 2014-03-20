;;
;; Perl configuration
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist
	     '("\\.\\(pl\\|pm\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("cpanfile\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod\\'" . pod-mode))

(eval-after-load "cperl-mode"
  '(progn
     (cperl-set-style "PerlStyle")
     (setq cperl-auto-newline nil)
     (helm-perldoc:setup)
     ))
