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
(require 'powerline)
(require 's)

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
  (when buffer-file-name
    (concat
     ;; (propertize (concat "[" (abbreviate-file-name default-directory) "]")
     ;;             'face 'scame--mode-line-2)
     (propertize (s-trim-left (format-mode-line " %b "))
                 'help-echo (abbreviate-file-name default-directory)
                 'face 'scame--mode-line-2))))

(defun scame--modeline-buffer-state ()
  (when buffer-file-name
    (concat (if (not (file-exists-p buffer-file-name))
                "∄ "
              (if (buffer-modified-p) ;; "✱ "))
                  (concat
                   (propertize (all-the-icons-faicon "chain-broken")
                               'face `(:family ,(all-the-icons-faicon-family) :height 1.2)
                               'display '(raise -0.1))
                   " ")))
            (if buffer-read-only ;; " "))
                (concat
                 (propertize (all-the-icons-octicon "lock")
                             'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
                             'display '(raise -0.1))
                 " ")))))

(defun scame--modeline-mail-mode ()
    (when (or (string-equal "gnus-group-mode" major-mode)
              (string-equal "gnus-summary-mode" major-mode)
              (string-equal "gnus-article-mode" major-mode))
      (propertize (all-the-icons-octicon "mail")
                  'display '(raise 0))))


(defun scame--modeline-irc-mode ()
  (when (or (string-equal "rcirc-mode" major-mode))
    (propertize (all-the-icons-octicon "commentary")
                'display '(raise 0))))


(defun scame--modeline-vc-mode ()
  (when vc-mode
    (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
      (concat
       ;; (propertize (format " %s" (all-the-icons-alltheicon "git"))
       ;;             'face `(:height 1.2) 'display '(raise -0.1))
       ;; " · "
       (propertize (format " %s" (all-the-icons-octicon "git-branch"))
                   'face `(:height 1.3 :family ,(all-the-icons-octicon-family))
                   'display '(raise -0.1))
       (propertize (format " %s " branch) 'face `(:height 0.9))))))


(defun scame--modeline-buffer-position ()
  (when buffer-file-name
    (propertize " [l=%l, c=%c] " 'face 'scame--mode-line-2)))


(defun scame--modeline-flycheck-status ()
  (when flycheck-mode
    (let* ((flycheck-data
            (pcase flycheck-last-status-change
              (`finished (if flycheck-current-errors
                             (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
                                            (+ (or .warning 0) (or .error 0)))))
                               (cons (concat (all-the-icons-octicon "thumbsdown")
                                             (format " %s" count))
                                     'scame--mode-line-flycheck-error))
                           (cons (all-the-icons-octicon "thumbsup")
                                 'scame--mode-line-flycheck-ok)))
              (`running     (cons (all-the-icons-octicon "dashboard")
                                  'scame--mode-line-flycheck-ok))
              (`no-checker (cons (all-the-icons-octicon "info")
                                 'scame--mode-line-flycheck-ok))
              (`not-checked (cons (all-the-icons-octicon "no-newline")
                                  'scame--mode-line-flycheck-ok))
              (`errored     (cons (all-the-icons-octicon "alert")
                                  'scame--mode-line-flycheck-error))
              (`interrupted (cons (all-the-icons-octicon "stop")
                                  'scame--mode-line-flycheck-error))
              (`suspicious  (cons (all-the-icons-octicon "plug")
                                  'scame--mode-line-flycheck-error)))))
      (propertize (car flycheck-data)
                  'help-echo "Show Flycheck Errors"
                  'display '(raise 0)
                  'face (cdr flycheck-data)
                  'mouse-face '(:box 1)
                  'local-map (make-mode-line-mouse-map
                              'mouse-1 (lambda ()
                                         (interactive)
                                         (flycheck-list-errors)))))))


(defun scame--modeline-mode-icon ()
  (when major-mode
    (cond ((or (string-equal "gnus-group-mode" major-mode)
               (string-equal "gnus-summary-mode" major-mode)
               (string-equal "gnus-article-mode" major-mode))
           (propertize (all-the-icons-octicon "mail")
                       'display '(raise 0)))
          ((string-equal "rcirc-mode" major-mode)
           (propertize (all-the-icons-octicon "comment")
                       'display '(raise 0)))
          ((string-equal "message-mode" major-mode)
           (propertize (all-the-icons-octicon "book")
                       'display '(raise 0)))
          (t (let* ((devmode (assoc (s-replace "-mode" "" (format "%s" major-mode))
                                    all-the-icons-data/devicons-alist))
                    (face (all-the-icons-icon-family-for-buffer)))
               (if devmode
                   (all-the-icons-devicon (car devmode))
                 (if face
                     (format " %s "
                             (propertize (all-the-icons-icon-for-buffer)
                                         'help-echo (format "Major-mode: `%s`" major-mode)
                                         'display '(raise -0.1)
                                         'face `(:height 1.2 :family ,face)))
                   (format " %s " major-mode))))))))


(defun scame--modeline-datatime ()
  (concat
   (propertize (all-the-icons-faicon "calendar")
               'face `(:family ,(all-the-icons-faicon-family) :height 1.2)
               'display '(raise 0))
   (format-time-string " %Y-%m-%d %H:%M:%S")))


(defun scame--modeline-version ()
  (format " %s "
          (propertize (all-the-icons-octicon "question")
                      'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
                      'display '(raise 0)
                      'help-echo (format "Scame version: `%s`" scame-version-number))))


(defun scame--modeline ()
  '("%e" (:eval (concat
                 (scame--modeline-version)
                 (scame--modeline-buffer-state)
                 (scame--modeline-buffer-informations)
                 (scame--modeline-vc-mode)
                 (scame--modeline-mode-icon)
                 (scame--modeline-flycheck-status) " "
                 ;; (scame--modeline-datatime)
                 (scame--modeline-buffer-position)
                 ))))


(provide '08_scame_modeline)
;;; 08_scame_modeline.el ends here
