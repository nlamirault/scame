;; Global key settings
;;
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

;;; Code:


;; General
;; ------------

(global-set-key "\C-cl" 'package-list-packages-no-fetch)

(global-set-key "\C-cq"
                (defun my:quit-emacs ()
                  (interactive)
                  (if (yes-or-no-p "Quit emacs? ")
                      (save-buffers-kill-emacs))))


;; UI
;; -----


(global-set-key (kbd "C-<down>")
                (function (lambda ()
                            (interactive)
                            (scroll-up 1))))

(global-set-key (kbd "C-<up>")
                (function (lambda ()
                            (interactive)
                            (scroll-down 1))))

;; Internet
;; ----------------

(global-set-key "\C-cg"
        (defun my:google-query (keywords)
          (interactive
           (list
            (if (use-region-p)
            (buffer-substring (region-beginning) (region-end))
              (read-string "Search Google for: " (thing-at-point 'word)))))
          (browse-url
           (concat "http://www.google.com/search?q="
               (replace-regexp-in-string
                "[[:space:]]+"
                "+"
                keywords)))))


(global-set-key "\C-cu" 'browse-url-at-point)

(global-set-key "\C-cw" 'eww)
