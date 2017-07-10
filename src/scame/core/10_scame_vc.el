; 10_scame_vc.el --- Scame Version Control customizations

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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



(require 'dash)
(require 'magit)

(defmacro pretty-magit (WORD ICON PROPS &optional NO-PROMPT?)
  "Replace sanitized WORD with ICON, PROPS and by default add to prompts."
  `(prog1
     (add-to-list 'pretty-magit-alist
                  (list (rx bow (group ,WORD (eval (if ,NO-PROMPT? "" ":"))))
                        ,ICON ',PROPS))
     (unless ,NO-PROMPT?
       (add-to-list 'pretty-magit-prompt (concat ,WORD ": ")))))

(setq pretty-magit-alist nil)
(setq pretty-magit-prompt nil)
(pretty-magit "Feature" ? (:foreground "slate gray" :height 1.2))
(pretty-magit "Add"     ? (:foreground "#375E97" :height 1.2))
(pretty-magit "ADD"     ? (:foreground "#375E97" :height 1.2))
(pretty-magit "Fix"     ? (:foreground "#FB6542" :height 1.2))
(pretty-magit "FIX"     ? (:foreground "#FB6542" :height 1.2))
(pretty-magit "Clean"   ? (:foreground "#FFBB00" :height 1.2))
(pretty-magit "CLEAN"   ? (:foreground "#FFBB00" :height 1.2))
(pretty-magit "Docs"    ? (:foreground "#3F681C" :height 1.2))
(pretty-magit "master"  ? (:box t :height 1.2) t)
(pretty-magit "origin"  ? (:box t :height 1.2) t)

(defun add-magit-faces ()
  "Add face properties and compose symbols for buffer from pretty-magit."
  (interactive)
  (with-silent-modifications
    (--each pretty-magit-alist
      (-let (((rgx icon props) it))
        (save-excursion
          (goto-char (point-min))
          (while (search-forward-regexp rgx nil t)
            (compose-region
             (match-beginning 1) (match-end 1) icon)
            (when props
              (add-face-text-property
               (match-beginning 1) (match-end 1) props))))))))

(advice-add 'magit-status :after 'add-magit-faces)
(advice-add 'magit-refresh-buffer :after 'add-magit-faces)


(setq use-magit-commit-prompt-p nil)
(defun use-magit-commit-prompt (&rest args)
  (setq use-magit-commit-prompt-p t))

(defun magit-commit-prompt ()
  "Magit prompt and insert commit header with faces."
  (interactive)
  (when use-magit-commit-prompt-p
    (setq use-magit-commit-prompt-p nil)
    (insert (ivy-read "Commit Type " pretty-magit-prompt
                      :require-match t :sort t :preselect "Add: "))
    ;; Or if you are using Helm...
    ;; (insert (helm :sources (helm-build-sync-source "Commit Type "
    ;;                          :candidates pretty-magit-prompt)
    ;;               :buffer "*magit cmt prompt*"))
    ;; I haven't tested this but should be simple to get the same behaior
    (add-magit-faces)
    (evil-insert 1)  ; If you use evil
    ))

(remove-hook 'git-commit-setup-hook 'with-editor-usage-message)
(add-hook 'git-commit-setup-hook 'magit-commit-prompt)
(advice-add 'magit-commit :after 'use-magit-commit-prompt)


(provide '10_scame_vc)
;;; 10_scame_vc.el ends here
