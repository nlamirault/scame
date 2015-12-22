;;; 35_ocaml.el --- OCaml configuration

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-ocaml

  (setq opam-share
        (substring
         (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
  (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

  (use-package tuareg
    :mode (("\\.ml\\w?" . tuareg-mode)
           ("\\.topml\\'" . taureg-mode)
           ("\\.fs[ix]?" . tuareg-mode)))

  (use-package merlin
    :config (progn
              (add-hook 'tuareg-mode-hook 'merlin-mode t)
              (add-hook 'caml-mode-hook 'merlin-mode t)
              ;; (setq merlin-use-auto-complete-mode 'easy)
              (with-eval-after-load 'company
                (add-to-list 'company-backends 'merlin-company-backend))
              (add-hook 'merlin-mode-hook 'company-mode)
              ;; Use opam switch to lookup ocamlmerlin binary
              (setq merlin-command 'opam)
              ))

  (use-package flycheck-ocaml
    :init (with-eval-after-load 'merlin (flycheck-ocaml-setup)))

  (use-package utop
    :if (executable-find "utop"))

  (use-package utop-minor-mode
    :if (executable-find "utop")
    :init (add-hook 'tuareg-mode-hook 'utop-minor-mode))

  )

(provide '35_ocaml)
;;; 35_ocaml.el ends here
