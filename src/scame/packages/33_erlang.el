;;; 33_erlang.el -- Erlang configuration

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

;; (eval-after-load "erlang"
;;   '(progn
;;      (require 'erlang-start)
;;      (require 'erlang-flymake)))


;; FIX: https://github.com/milkypostman/melpa/issues/2553
;; (use-package erlang
;;   :mode (("\\.erl?$" . erlang-mode)
;;          ("\\.hrl?$" . erlang-mode)
;;          ("\\.spec?$" . erlang-mode))
;;   :config (progn
;; 	    (setq erlang-root-dir "/usr/lib/erlang/erts-5.10.3")
;; 	    (add-to-list 'exec-path "/usr/lib/erlang/erts-5.10.3/bin")
;; 	    (setq erlang-man-root-dir "/usr/lib/erlang/erts-5.10.3/man")
;; 	    (setq erlang-compile-extra-opts '(debug_info))
;; 	    (require 'erlang-start)
;; 	    (add-hook 'erlang-mode-hook
;; 		      (lambda ()
;; 			(setq inferior-erlang-machine-options '("-sname" "syl20bnr"))))
;; 	    ))



(provide '33_erlang)
;;; 33_erlang.el ends here
