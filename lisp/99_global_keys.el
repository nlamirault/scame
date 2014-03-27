;;; 99_global_keys.el --- Global key settings

;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(provide '99_global_keys)
;;; 99_global_keys.el ends here
