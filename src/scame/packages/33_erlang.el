;;; 33_erlang.el -- Erlang configuration

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-erlang

  (defun scame--erlang-get-home-directory ()
    (cond ((f-directory-p "/usr/lib/erlang")
           "/usr/lib/erlang")
          ((f-directory-p "/usr/local/lib/erlang")
           "/usr/local/lib/erlang")
          (t nil)))

  (use-package erlang :quelpa
    :mode (("\\.erl?$" . erlang-mode)
           ("\\.hrl?$" . erlang-mode)
           ("\\.spec?$" . erlang-mode))
    :config (progn
              (let ((erlang-home (scame--erlang-get-home-directory)))
                (when erlang-home
                  (setq erlang-root-dir erlang-home)
                  (add-to-list 'exec-path (f-join erlang-home "bin"))
                  (setq erlang-man-root-dir (f-join erlang-home "man"))
                  (setq erlang-compile-extra-opts '(debug_info))
                  (require 'erlang-start)
                  (add-hook 'erlang-mode-hook
                            (lambda ()
                              (setq inferior-erlang-machine-options
                                    '("-sname" "scame"))))
                  ))))

  )

(provide '33_erlang)
;;; 33_erlang.el ends here
