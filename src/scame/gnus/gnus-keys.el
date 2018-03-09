;;; gnus-keys.el --- Gnus keybindings configuration

;; Copyright (C) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; Keybindings
;; ------------

(defhydra scame-hydra-gnus (:color teal)
  "
    Message              Global
  ╭─────────────────────────────────────────────────────────────────────────
    [_a_]  Attach      [_g_]  Refresh
    [_s_]  Send        [_m_]  New mail
    [_r_]  Reply       [_g_]  Search
    [_d_]  Delete
  --------------------------------------------------------------------------------
        "
  ;; Message
  ("a" mml-attach-file) ; "Attach C-c C-a")
  ("s" message-send-and-exit) ; "Send C-c C-c")
  ("r" gnus-summary-wide-reply) ; "Reply all S w")
  ("d" gnus-summary-delete-article)
  ;; Global
  ("g" gnus-group-get-new-news) ; "Refresh g")
  ("m" gnus-group-mail) ; "Compose m OR C-x m")
  ("q" nil "cancel"))

(global-set-key (kbd "C-c s g") 'scame-hydra-gnus/body)

;; (eval-after-load 'gnus-group
;;   '(progn
;;      (defhydra hydra-gnus-group (:color blue)
;;        "Do?"
;;        ("a" gnus-group-list-active "REMOTE groups A A")
;;        ("l" gnus-group-list-all-groups "LOCAL groups L")
;;        ("c" gnus-topic-catchup-articles "Read all c")
;;        ("G" gnus-group-make-nnir-group "Search server G G")
;;        ("g" gnus-group-get-new-news "Refresh g")
;;        ("s" gnus-group-enter-server-mode "Servers")
;;        ("m" gnus-group-new-mail "Compose m OR C-x m")
;;        ("#" gnus-topic-mark-topic "mark #")
;;        ("q" nil "cancel"))
;;      ;; y is not used by default
;;      (define-key gnus-group-mode-map "y" 'hydra-gnus-group/body)))

;; ;; gnus-summary-mode
;; (eval-after-load 'gnus-sum
;;   '(progn
;;      (defhydra hydra-gnus-summary (:color blue)
;;        "Do?"
;;        ("n" gnus-summary-insert-new-articles "Refresh / N")
;;        ("f" gnus-summary-mail-forward "Forward C-c C-f")
;;        ("!" gnus-summary-tick-article-forward "Mail -> disk !")
;;        ("p" gnus-summary-put-mark-as-read "Mail <- disk")
;;        ("c" gnus-summary-catchup-and-exit "Read all c")
;;        ("e" gnus-summary-resend-message-edit "Resend S D e")
;;        ("R" gnus-summary-reply-with-original "Reply with original R")
;;        ("r" gnus-summary-reply "Reply r")
;;        ("W" gnus-summary-wide-reply-with-original "Reply all with original S W")
;;        ("w" gnus-summary-wide-reply "Reply all S w")
;;        ("#" gnus-topic-mark-topic "mark #")
;;        ("q" nil "cancel"))
;;      ;; y is not used by default
;;      (define-key gnus-summary-mode-map "y" 'hydra-gnus-summary/body)))

;; ;; gnus-article-mode
;; (eval-after-load 'gnus-art
;;   '(progn
;;      (defhydra hydra-gnus-article (:color blue)
;;        "Do?"
;;        ("f" gnus-summary-mail-forward "Forward")
;;        ("R" gnus-article-reply-with-original "Reply with original R")
;;        ("r" gnus-article-reply "Reply r")
;;        ("W" gnus-article-wide-reply-with-original "Reply all with original S W")
;;        ("o" gnus-mime-save-part "Save attachment at point o")
;;        ("w" gnus-article-wide-reply "Reply all S w")
;;        ("q" nil "cancel"))
;;      ;; y is not used by default
;;      (define-key gnus-article-mode-map "y" 'hydra-gnus-article/body)))

;; (eval-after-load 'message
;;   '(progn
;;      (defhydra hydra-message (:color blue)
;;        "Do?"
;;        ("ca" mml-attach-file "Attach C-c C-a")
;;        ("cc" message-send-and-exit "Send C-c C-c")
;;        ("q" nil "cancel"))
;;      (global-set-key (kbd "C-c C-y") 'hydra-message/body)))


(provide 'gnus-keys)
;;; gnus-keys.el ends here
