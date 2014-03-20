;;
;; Setup Emacs configuration
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;


(setq home-dir (concat (expand-file-name "~") "/"))

(load "server")
(unless (server-running-p)
    (server-start))

(require 'ido)
(ido-mode t)

;;; Some constants to check the system type
(defconst darwin-p (eq system-type 'darwin)
  "Are we on OSX?")
(defconst linux-p (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux))
  "Are we running on a GNU/Linux system?")
(defconst console-p (eq (symbol-value 'window-system) nil)
  "Are we in a console?")

(provide '00_setup)
;;; 00_setup.el ends here
