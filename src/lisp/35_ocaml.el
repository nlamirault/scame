;;; 35_ocaml.el --- OCaml configuration

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;;(require 'tuareg)

(use-package tuareg
  :mode (("\\.ml\\w?" . tuareg-mode)
         ("\\.topml\\'" . taureg-mode)
         ("\\.fs[ix]?" . tuareg-mode))
  ;;:bind ("C-x o" . run-ocaml)
  :config (progn
	    (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
	    (autoload 'ocamldebug "ocamldebug" "Run the Caml debugger" t)))


;; (setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

;; Install Merlin:
;; opam install merlin

;; TODO:

;; (push
;;  (concat (substring (shell-command-to-string "opam config var share") 0 -1)
;; 	 "/emacs/site-lisp")
;;  load-path)
;; (setq merlin-command
;;       (concat (substring (shell-command-to-string "opam config var bin") 0 -1)
;; 	      "/ocamlmerlin"))
;; (autoload 'merlin-mode "merlin" "Merlin mode" t)
;; (add-hook 'tuareg-mode-hook 'merlin-mode)
;; (add-hook 'caml-mode-hook 'merlin-mode)


(provide '35_ocaml)
;;; 35_ocaml.el ends here
