;;; scame-ocaml-test.el --- Unit tests for Scame OCaml development.

;; Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(ert-deftest test-scame-ocaml ()
  :tags '(ocaml)
  (with-test-sandbox
   (let ((opam (executable-find "opam"))
         (ocamlmerlin (executable-find "ocamlmerlin")))
     (if (and opam ocamlmerlin)
         (let ((opam-dir (s-concat user-home-directory ".opam")))
           (unless (f-directory? opam-dir)
             (f-mkdir opam-dir))
           (with-current-file
            "var/hello.ml"
            (should (featurep 'tuareg))
            (should (featurep 'merlin))
            (should (featurep 'flycheck-ocaml))
           ))
       (message (ansi-yellow "[Scame] OCaml: OPAM not installed. No unit tests"))))))

(provide 'scame-ocaml-test)
;;; scame-ocaml-test.el ends here
