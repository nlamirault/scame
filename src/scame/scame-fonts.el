;;; scame-fonts.el --- Fonts utils

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package dash
  :config
  (progn

    ;; Fira code ligatures. Fira Code Symbol is a different font than Fira Code!
    ;; You can use any font you wish with just the ligatures
    (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")

    (defun set-icon-fonts (code-font-alist)
      "Utility to associate many unicode points with specified fonts."
      (--each code-font-alist
        (-let (((font . codes) it))
          (--each codes
            (set-fontset-font t `(,it . ,it) font)))))

    ;; The icons you see are not the correct icons until this is evaluated!
    (set-icon-fonts
     '(("fontawesome"
        ;;                         
        #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101)

       ("all-the-icons"
        ;;    
        #xe907 #xe928)

       ("github-octicons"
        ;;                          
        #xf091 #xf059 #xf076 #xf075 #xe192  #xf016)

       ("material icons"
        ;;        
        #xe871 #xe918 #xe3e7)

       ("Symbola"
        ;; 𝕊    ⨂      ∅      ⟻    ⟼     ⊙      𝕋       𝔽
        #x1d54a #x2a02 #x2205 #x27fb #x27fc #x2299 #x1d54b #x1d53d
        ;; 𝔹    𝔇       𝔗
        #x1d539 #x1d507 #x1d517)))

    ))


(provide 'scame-fonts)
;;; scame-fonts.el ends here
