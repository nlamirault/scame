;;; 97_twitter.el --- Twitter in Emacs

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package twittering-mode
  :init (progn
          (define-prefix-command 'scame-twitter-map)
          (global-set-key (kbd "C-c t") 'scame-twitter-map))
  :bind (("C-c t t" . twit))
  :config (progn
            (setq twittering-private-info-file "~/.twittering-mode.gpg")
            (setq twittering-use-master-password t)
            (setq twittering-auth-method 'oauth)
            (setq twittering-status-format
                  (concat "%i %p%s(%S)%RT{ [RT by %s]}\n"
                          "%C{%D %H:%M:%S}\n"
                          "%t\n"
                          (make-string (- (frame-width) 10) ?-)))
            (setq twittering-icon-mode t)
            (setq twittering-convert-fix-size 40)
            (setq twittering-timer-interval 90)
            (setq twittering-number-of-tweets-on-retrieval 50)
            (setq twittering-initial-timeline-spec-string
                  '(":replies" ":home"))))

(provide '97_twitter)
;;; 97_twitter.el ends here
