;; 08_scame_modeline.el --- Scame modeline

;; Copyright (c) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either modeline 3 of the License, or
;; (at your option) any later modeline.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'all-the-icons)


(require '01_scame_version)



;; Custom faces

(defface scame--mode-line-is-modified '((t (:inherit warning)))
  "Face for mode-line modified symbol")

(defface scame--mode-line-2 '((t (:inherit warning)))
  "The alternate color for mode-line text.")

(defface scame--mode-line-highlight nil
  "Face for bright segments of the mode-line.")

(defface scame--mode-line-count-face nil
  "Face for anzu/evil-substitute/evil-search number-of-matches display.")

;; Git/VCS segment faces
(defface scame--mode-line-vcs-info '((t (:inherit warning)))
  "")
(defface scame--mode-line-vcs-warning '((t (:inherit warning)))
  "")

(defface scame--mode-line-flycheck-ok nil
  "Face for flycheck correct feedback in the modeline.")

(defface scame--mode-line-flycheck-error '((t (:inherit error)))
  "Face for flycheck error feedback in the modeline.")

(defface scame--mode-line-flycheck-warning '((t (:inherit warning)))
  "Face for flycheck warning feedback in the modeline.")


(defun scame--modeline-buffer-informations ()
  (concat
   (propertize (concat "[" (abbreviate-file-name default-directory) "]")
               'face 'scame--mode-line-2)
   (propertize (s-trim-left (format-mode-line "%b"))
               'face 'scame--mode-line-2)))

(defun scame--modeline-buffer-state ()
  (when buffer-file-name
    (propertize
     (concat (if (not (file-exists-p buffer-file-name))
                 "∄ "
               (if (buffer-modified-p) "✱ "))
             (if buffer-read-only " "))
     'face 'scame--mode-line-is-modified)))

(defun scame--modeline-buffer-position ()
  (propertize " [l=%l, c=%c] " 'face 'scame--mode-line-2))



(defun scame--modeline-flycheck-status ()
  (let* ((text
          (pcase flycheck-last-status-change
            (`finished (if flycheck-current-errors
                           (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
                                          (+ (or .warning 0) (or .error 0)))))
                             (cons (format "✖ %s Issue%s" count (unless (eq 1 count) "s"))
                                   'scame--mode-line-flycheck-error))
                         (cons "✔ No Issues" 'scame--mode-line-flycheck-ok)))
            (`running     (cons "⟲ Running" 'scame--mode-line-flycheck-ok))
            (`no-checker  (cons "⚠ No Checker" 'scame--mode-line-flycheck-ok))
            (`not-checked (cons "✖ Disabled" 'scame--mode-line-flycheck-ok))
            (`errored     (cons "⚠ Error" 'scame--mode-line-flycheck-error))
            (`interrupted (cons "⛔ Interrupted" 'scame--mode-line-flycheck-warning))
            (`suspicious  ""))))
    (propertize (car text)
                'face (cdr text)
                'help-echo "Show Flycheck Errors"
                'display '(raise -0.1)
                'mouse-face '(:box 1)
                'local-map (make-mode-line-mouse-map
                            'mouse-1 (lambda ()
                                       (interactive)
                                       (flycheck-list-errors))))))

(defun scame--modeline-mode-icon ()
  (format " %s "
          (propertize (all-the-icons-icon-for-buffer)
                      'help-echo (format "Major-mode: `%s`" major-mode)
                      'display '(raise -0.1)
                      'face `(:height 1.2 :family ,(all-the-icons-icon-family-for-buffer)))))


(defun scame--modeline-datatime ()
  (concat
   (propertize (all-the-icons-faicon "calendar")
               'face `(:family ,(all-the-icons-faicon-family) :height 1.2)
               'display '(raise 0))
   (format-time-string " %Y-%m-%d %H:%M:%S")))


(defun scame--modeline-version ()
  (format " %s "
          (propertize (all-the-icons-octicon "package")
                      'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
                      'display '(raise -0.1)
                      'help-echo (format "Scame version: `%s`" scame-version-number))))

;; (defun custom-modeline-time ()
;;   (let* ((hour (string-to-number (format-time-string "%I")))
;;          (icon (all-the-icons-wicon (format "time-%s" hour) :height 1.3 :v-adjust 0.0)))
;;     (concat
;;      (propertize (format-time-string " %H:%M ") 'face `(:height 0.9))
;;      (propertize (format "%s " icon) 'face `(:height 1.0 :family ,(all-the-icons-wicon-family)) 'display '(raise
;; (setq mode-line-format '("%e" (:eval
;;   (concat
;;     (custom-modeline-modified)
;;     (custom-modeline-window-number)
;;     (custom-modeline-mode-icon)
;;     (custom-modeline-icon-vc)
;;     (custom-modeline-region-info)
;;     (custom-modeline-flycheck-status)
;;     (custom-modeline-suntime)
;;     (custom-modeline-weather)
;;     (custom-modeline-time)))))


(setq mode-line-format
      '("%e" (:eval (concat
                     (scame--modeline-version)
                     (scame--modeline-buffer-state)
                     (scame--modeline-buffer-informations)
                     ;; (scame--modeline-custom-modeline-modified)
                     (scame--modeline-mode-icon)
                     (scame--modeline-flycheck-status) " "
                     (scame--modeline-datatime)
                     (scame--modeline-buffer-position)
                     ))))


(provide '08_scame_modeline)
;;; 08_scame_modeline.el ends here
