;; scame-pkg.el --- Scame Packages installation

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ))

(defvar stable-packages
      '(s f epl dash helm use-package paradox el-init el-init-viewer benchmark-init
          company helm-company auto-complete
          projectile helm-projectile persp-projectile ibuffer-projectile
          find-file-in-project
          neotree
          imenu-anywhere
          dired-imenu
          flycheck flycheck-cask flycheck-color-mode-line flycheck-package helm-flycheck
          butler
          ;; Common Lisp
          sly sly-company
          ;; Elisp
          elisp-slime-nav erefactor overseer
          ;; Golang
          go-mode go-play company-go go-eldoc helm-go-package gotest go-direx go-projectile go-errcheck golint
          ;; Python
          jedi elpy tox pyvenv anaconda-mode company-anaconda jedi-direx sphinx-doc helm-pydoc pip-requirements
          ;; Ruby
          ruby rvm rhtml-mode ruby-tools inf-ruby company-inf-ruby ruby-test-mode
          ;; Erlang
          erlang
          ;; Scheme
          geister
          ;; Clojure
          cider
          ;; Haskell
          haskell-mode flycheck-haskell ghci-completion
          ;; OCaml
          tuareg merlin
          ;; Web
          web-mode
          ;; Php
          php-mode emacsagist phpunit
          ;; Perl
          cperl-mode helm-perldoc
          ;; Javascript
          js3-mode tern company-tern
          ;; NodeJS
          jade-mode
          ;; C/C++/ObjectiveC
          irony company-irony flycheck-irony irony-eldoc
          ;; Rust
          rust-mode
          ;; Elixir
          elixir-mode alchemist
          ;; Lua
          lua-mode
          ;; Markup languages
          markdown-mode yaml-mode toml-mode adoc-mode
          ;; Cloud
          dockerfile-mode vagrant puppet-mode ansible ansible-doc
          ;; Git and friends
          magit magit-gerrit
          gitconfig-mode gitignore-mode gitattributes-mode
          gist git-gutter+ git-timemachine helm-open-github
          gitlab helm-gitlab
          ;; Utilities
          pkg-info persp-projectile project-persist helm-project-persist
          multi-term helm-mt
          lice
          ;; Notifications
          alert sauron
          ;; Search
          engine-mode
          helm-ack ag helm-ag pt helm-pt swoop helm-swoop
          swiper swiper-helm
          ;; Social
          jabber
          circe
          rcirc-groups rcirc-alertify rcirc-notify
          twittering-mode
          sx
          ;; Org
          org org-agenda-property org-caldav org-journal orgbox
          ;; Calendar
          calfw
          ;; UI
          rich-minority powerline smart-mode-line smart-mode-line-powerline-theme
          popwin
          ;; Dired and friends
          direx dired-k dired-filter dired-open dired-rainbow dired-subtree
          ;; Sysadmin
          nginx-mode syslog-mode apache-mode
          ;; Gnus and friends
          gnus-summary-ext gnus-x-gm-raw
          bbdb bdbd- bbdb-ext bbdb-csv-import
          notmuch notmuch-labeler
          ;; Keys
          hydra which-key
          ;; Misc
          weather-metno
          ;; Multimedia
          emms bongo libmpdee
          ))


(defvar unstable-packages
      '(
        ;; Themes
        material-theme monokai-theme zenburn-theme
        ))

(dolist (pkg stable-packages)
  (message "Package: %s" pkg)
  (add-to-list 'package-pinned-packages
               (cons pkg "melpa-stable")))
(message "Pinned : %s" package-pinned-packages))

(package-initialize)

(mapcar (lambda (pkg)
          (package-install pkg))
        stable-packages)
(mapcar (lambda (pkg)
          (package-install pkg))
        unstable-packages)


(provide 'scame-pkg)
;;; scame-pkg.el ends here
