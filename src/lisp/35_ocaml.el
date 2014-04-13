;;; 35_ocaml.el --- OCaml configuration

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

;;(require 'tuareg)

(use-package tuareg
  :mode (("\\.ml\\w?" . tuareg-mode)
         ("\\.topml\\'" . taureg-mode)
         ("\\.fs[ix]?" . tuareg-mode))
  :bind ("C-x o" . run-ocaml)
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
