;;; 13_modeline.el --- Mode-line configuration

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


;; (use-package smart-mode-line
;;   :init (progn
;;           (setq sml/theme 'respectful
;;                 ;;sml/theme 'smart-mode-line-powerline
;;                 sml/shorten-directory t
;;                 sml/name-width 32
;;                 sml/shorten-modes t
;;                 sml/use-projectile-p 'before-prefixes
;;                 sml/projectile-replacement-format "%s/"
;;                 sml/no-confirm-load-theme t
;;                 sml/replacer-regexp-list '(("^/ssh:.*:" ":SSH:")
;;                                            ("^/sudo:.*:" ":SU:")
;;                                            ("^~/.config/" ":C:")
;;                                            ("^~/Dropbox/" ":DB:")
;;                                            ("^~/findspire/findspire-front/" ":FS:")
;;                                            ("^:FS:findspire/" ":FSf:")
;;                                            )))
;;   :config (progn
;;             (use-package rich-minority
;;               :config (progn
;;                         rm-blacklist '(" Guide"        ; guide-key mode
;;                                        " hc"           ; hardcore mode
;;                                        " AC"           ; auto-complete
;;                                        " vl"           ; global visual line mode enabled
;;                                        " Wrap"         ; shows up if visual-line-mode is enabled for that buffer
;;                                        " Omit"         ; omit mode in dired
;;                                        " yas"          ; yasnippet
;;                                        " drag"         ; drag-stuff-mode
;;                                        " VHl"          ; volatile highlights
;;                                        " ctagsU"       ; ctags update
;;                                        " Undo-Tree"    ; undo tree
;;                                        " wr"           ; Wrap Region
;;                                        " SliNav"       ; elisp-slime-nav
;;                                        " Fly"          ; Flycheck
;;                                        " PgLn"         ; page-line-break
;;                                        " ElDoc"        ; eldoc
;;                                        " hl-highlight" ; hl-anything
;;                                        " Helm"         ; Helm
;;                                        " GG"           ; ggtags
;;                                        ))
;;               (add-to-list 'rm-text-properties
;;                            '("Abbrev\\'"  'display " @")) ; Abbrev
;;               (add-to-list 'rm-text-properties
;;                            '("Ind\\'"     'display " *>")) ; org indent
;;               (add-to-list 'rm-text-properties
;;                            '("Outl\\'"    'display " ø")) ; outline
;;               (add-to-list 'rm-text-properties
;;                            '("Server\\'"  'display " Σ")) ; Server
;;               )
;;             (sml/setup)))


(use-package powerline
  :config (progn
	    (powerline-default-theme)
	    (setq powerline-default-separator 'slant))) ;;'arrow-fade)))


;;; Greek letters - C-u C-\ greek ;; C-\ to revert to default
;;; ς ε ρ τ υ θ ι ο π α σ δ φ γ η ξ κ λ ζ χ ψ ω β ν μ


(defvar mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (company-mode . " α")
    (ivy-mode . " ι")
    (yas/minor-mode . "")
    (paredit-mode . "")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (guide-key-mode . "")
    (projectile-mode . " ")
    (overseer-mode . "")
    (elisp-slime-nav-mode . "")
    (flycheck-mode . " ς")
    (lisp-interaction-mode . " λ")
    (hi-lock-mode . "")
    (sphinx-doc-mode . "")
    (anaconda-mode . "")
    ;;(python-mode . " ")
    ;;(go-mode . " ο")
    ;;(php-mode . " ρ")
    ;;(emacs-lisp-mode . "eλ")
    ;; (nxhtml-mode . "")
    ))



(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(defface powerline-custom1 '((t (:background "#EEAD0E" :foreground "black" :weight bold)))
  "Custom face for bright sections"
  :group 'powerline)

(defface powerline-custom2 '((t (:foreground "#EEAD0E" :weight bold)))
  "Custom face for text"
  :group 'powerline)

(defun powerline-scame-theme ()
  "A powerline theme for Scame."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (face3 (if active 'powerline-custom1 mode-line))
                          (face4 (if active 'powerline-custom2 mode-line))
                          (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" face3 'l)
                                     (powerline-raw " " face3)
                                     (funcall separator-left face3 mode-line)

                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size nil 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info face4 'l))
                                     (powerline-buffer-id face4 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)

                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-raw " " face1)
                                     (funcall separator-right face1 mode-line)

                                     (powerline-minor-modes mode-line 'l)
                                     (powerline-narrow mode-line 'l)
                                     (powerline-raw " " mode-line)
                                     (funcall separator-left mode-line face1)

                                     (powerline-vc face1 'r)
                                     (powerline-raw " " face1)
                                     (funcall separator-right face1 face2)

                                     ;; (when (bound-and-true-p nyan-mode)
                                     ;;   (powerline-raw (list (nyan-create)) face2 'l))))
                                     ))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
				     (unless window-system
				       (powerline-raw (char-to-string #xe0a1) face1 'l))
				     (powerline-raw "%4l" face1 'l)
				     (powerline-raw ":" face1 'l)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw " ")
				     (powerline-raw "%6p" nil 'r))))
		     (concat (powerline-render lhs)
			     (powerline-fill face2 (powerline-width rhs))
			     (powerline-render rhs)))))))


(powerline-scame-theme)

(provide '13_modeline)
;;; 13_modeline.el ends here
