;; scame-custom.el --- Scame customization

;; Copyright (c) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(defgroup scame nil
  "Emacs starter kit."
  :group 'tools)

(defcustom user-home-directory (concat (getenv "HOME") "/")
  "Path of the user home directory."
  :group 'scame
  :type 'string)

;; (defcustom scame-cask-file "~/.cask/cask.el"
;;   "Scame Cask file."
;;   :group 'scame
;;   :type 'string)

(defcustom scame-keymap-prefix (kbd "C-c s")
  "Scame keymap prefix."
  :group 'scame
  :type 'string)

(defcustom scame-user-directory
  (concat user-home-directory ".emacs.d/scame")
  "Scame user directory installation."
  :group 'scame
  :type 'string)

(defcustom scame-vendoring-directory
  (concat user-emacs-directory "vendor")
  "Vendoring directory for Scame."
  :group 'scame
  :type 'string)

(defcustom scame-user-customization-file
  (concat user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization."
  :group 'scame
  :type 'string)

(defcustom scame-use-vendoring t
  "Set if you want to use vendoring utility."
  :group 'scame
  :type 'boolean)

(defcustom scame-defer-package t
  "Set if you want defer loading packages."
  :group 'scame
  :type 'boolean)

(defcustom scame-completion-method 'ido
  "Method to select a candidate from a list of strings."
  :group 'scame
  :type '(choice
          (const :tag "Ido" ido)
          (const :tag "Helm" helm)
          (const :tag "Ivy" ivy)))

;; Mail
;; ------------------

(defgroup scame-mail nil
  "Mail setup for Scame."
  :group 'scame)

(defcustom scame-gnus-version 'gnus
  "Method to select a candidate version of Gnus."
  :group 'scame-mail
  :type '(choice
          (const :tag "Gnus" gnus)
          (const :tag "Gnus-Dev" 'gnus-dev)))

(defcustom scame-gnus-dev-directory
  (concat user-home-directory "Apps/gnus")
  "Directory of Gnus source code."
  :group 'scame-mail
  :type 'string)

;; Development
;; -------------------

(defgroup scame-dev nil
  "Development environments for Scame."
  :group 'scame)

(defcustom scame-golang t
  "Set if you want the golang development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-commonlisp t
  "Set if you want the commonlisp development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-elisp t
  "Set if you want the emacslisp development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-python t
  "Set if you want the python development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-ruby t
  "Set if you want the ruby development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-scheme t
  "Set if you want the scheme development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-clojure t
  "Set if you want the clojure development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-haskell t
  "Set if you want the haskell development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-erlang t
  "Set if you want the erlang development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-ocaml t
  "Set if you want the ocaml development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-php t
  "Set if you want the php development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-web t
  "Set if you want the web development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-perl t
  "Set if you want the perl development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-javascript t
  "Set if you want the javascript development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-c-cpp-objc t
  "Set if you want the C/C++/ObjectiveC development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-elixir t
  "Set if you want the elixir development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-lua t
  "Set if you want the lua development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-rust t
  "Set if you want the rust development environment."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-cloud t
  "Set if you want the Cloud environment.
It means use tools like: Vagrant, Puppet, ansible, ..."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-iot t
  "Set if you want IOT tools.
It means: Arduino, RaspberryPI, ..."
  :group 'scame-iot
  :type 'boolean)

(defcustom scame-sysadmin t
  "Set if you want the sysadmin environment.
It means use tools like: nginx, apache, syslog, ..."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-social t
  "Set if you want social tools.
It means use tools like: Twitter, StackExchange, ..."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-communication t
  "Set if you want communications tools.
It means use tools like: IRC, Instant Messagerie, ..."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-org t
  "Set if you want Org tools."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-multimedia t
  "Set if you want multimedia tools.
It means use tools like: EMMS, Bongo, ..."
  :group 'scame-dev
  :type 'boolean)

(defcustom scame-email t
  "Set if you want Email tools.
It means use tools like: Gnus addons, notmuch, ..."
  :group 'scame-dev
  :type 'boolean)

(provide 'scame-custom)
;;; scame-custom.el ends here
