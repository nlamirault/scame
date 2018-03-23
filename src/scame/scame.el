;; scame.el --- Scame Emacs initialization file

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

(when (version< emacs-version "24.4")
  (error "Scame requires at least GNU Emacs 24.4"))

(defun scame--setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun scame--exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'scame--setup-hook)
(add-hook 'minibuffer-exit-hook #'scame--exit-hook)

;; Debug or not
(setq debug-on-error t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace nil)

(setq warning-minimum-level :error)

;; Scame
;; -----------------

(require 'scame-custom)
;; (when (file-exists-p scame-emacs-custom-file)
;;   (load scame-emacs-custom-file))

(require 'scame-pkg)

(require 'f)

(require 'scame-setup)
(require 'scame-ui)
(require 'scame-fonts)
(require 'scame-encodings)
(require 'scame-completion)
(require 'scame-search)
(require 'scame-server)
(require 'scame-keys)
(require 'scame-buffers)
(require 'scame-crypto)
(require 'scame-directories)
(require 'scame-modeline)
(require 'scame-cloud)
(require 'scame-shell)
(require 'scame-flycheck)

(require 'scame-vc)
(require 'scame-dev)
(require 'scame-python)
(require 'scame-go)
(require 'scame-commonlisp)
(require 'scame-erlang)
(require 'scame-ocaml)
(require 'scame-php)
(require 'scame-scheme)
(require 'scame-perl)
(require 'scame-haskell)
(require 'scame-elisp)
(require 'scame-clojure)
(require 'scame-ruby)
(require 'scame-c-cpp)
(require 'scame-rust)
(require 'scame-web)
(require 'scame-javascript)
(require 'scame-elixir)
(require 'scame-java)
(require 'scame-serialization)
(require 'scame-lua)
(require 'scame-arduino)
(require 'scame-markup)

(require 'scame-notifs)
(require 'scame-packages)
(require 'scame-languages)
(require 'scame-orga)
(require 'scame-email)
(require 'scame-browser)

(require 'scame-hydra)
(require 'scame-core)

(when linux-p
  (require 'scame-linux))
(when darwin-p
  (require 'scame-darwin))
(when cygwin-p
  (require 'scame-windows))


(when (and scame-use-vendoring
           (f-exists? scame-vendoring-directory)
           (f-directory? scame-vendoring-directory))
  (f-entries scame-vendoring-directory
             (lambda (elem)
               ;;(message "elem: %s" elem)
               (cond ((or (f-directory? elem)
                          (f-symlink? elem))
                      (add-to-list 'load-path elem))
                     ((f-file? elem)
                      (when (string= (f-ext elem) "el")
                        (load-file elem)))))))

(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

;; Enable mine ?
;; (when scame-use-custom-modeline
;;   (setq-default mode-line-format (scame--modeline)))

(setq warning-minimum-level :warning)

(provide 'scame)
;;; scame.el ends here
