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
  '(s f epl dash helm use-package paradox el-init el-init-viewer
      company auto-complete
      find-file-in-project
      neotree
      imenu-anywhere
      dired-imenu
      flycheck flycheck-cask flycheck-color-mode-line flycheck-package
      butler
      ;; Common Lisp
      sly sly-company
      ;; Elisp
      elisp-slime-nav erefactor overseer
      ;; Golang
      go-mode company-go go-eldoc gotest go-direx go-errcheck
      ;; Python
      jedi elpy tox pyvenv sphinx-doc helm-pydoc pip-requirements
      ;; Ruby
      rvm ruby-tools inf-ruby ruby-test-mode
      ;; Scheme
      geiser
      ;; Clojure
      cider
      ;; Haskell
      haskell-mode flycheck-haskell
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
      company-irony
      ;; Elixir
      elixir-mode alchemist
      ;; Lua
      lua-mode
      ;; Markup languages
      markdown-mode yaml-mode adoc-mode
      ;; Cloud
      dockerfile-mode vagrant puppet-mode ansible ansible-doc terraform-mode
      ;; Git and friends
      magit magit-gerrit
      gitconfig-mode gitignore-mode gitattributes-mode
      gist git-gutter+ git-timemachine helm-open-github
      gitlab helm-gitlab
      ;; Utilities
      pkg-info project-persist
      helm-mt
      lice
      ;; Notifications
      sauron
      ;; Search
      helm-ack ag helm-ag pt helm-swoop
      swiper swiper-helm
      ;; Social
      jabber
      twittering-mode
      sx
      ;; Calendar
      calfw
      ;; UI
      rich-minority powerline smart-mode-line smart-mode-line-powerline-theme
      popwin ace-window
      ;; Dired and friends
      direx dired-k
      ;; Sysadmin
      nginx-mode
      ;; Gnus and friends
      gnus-x-gm-raw
      bbdb-
      notmuch
      ;; Keys
      hydra which-key
      ;; Multimedia
      bongo
      ))


(defvar unstable-packages
  '(
    ;; Themes
    material-theme
    monokai-theme
    zenburn-theme
    ;; Packages without tags
    ;; See: https://github.com/fgallina/rcirc-alertify/issues/1
    alert
    benchmark-init
    helm-flycheck
    projectile helm-projectile persp-projectile ibuffer-projectile
    ;; https://github.com/dougm/go-projectile/issues/2
    go-projectile
    ;; https://github.com/golang/lint/issues/111
    golint
    ;; https://github.com/proofit404/anaconda-mode/issues/98
    anaconda-mode
    ;;https://github.com/proofit404/company-anaconda/issues/3
    company-anaconda
    ;; https://github.com/tkf/emacs-jedi-direx/issues/17
    jedi-direx
    rhtml-mode company-inf-ruby
    erlang
    ghci-completion
    ;; https://github.com/Sarcasm/flycheck-irony/issues/4
    irony
    flycheck-irony
    ;; https://github.com/ikirill/irony-eldoc/issues/3
    irony-eldoc
    ;; https://github.com/rust-lang/rust-mode/issues/87
    rust-mode
    ;; https://github.com/dryman/toml-mode.el/issues/2
    toml-mode
    ;; https://github.com/Sliim/helm-project-persist/issues/2
    helm-project-persist
    multi-term
    ;; https://github.com/hrs/engine-mode/issues/22
    engine-mode
    ;; https://github.com/ralesi/helm-pt/issues/2
    helm-pt
    ;; https://github.com/ShingoFukuyama/emacs-swoop/issues/9
    swoop
    ;; https://github.com/jorgenschaefer/circe/issues/202
    circe
    rcirc-groups
    ;; https://github.com/fgallina/rcirc-alertify/issues/1
    rcirc-alertify
    rcirc-notify
    org org-gcal org-agenda-property org-journal orgbox org-caldav
    ;; https://github.com/Fuco1/dired-hacks/issues/33
    dired-filter dired-open dired-rainbow dired-subtree
    ;; https://github.com/vapniks/syslog-mode/issues/12
    syslog-mode
    apache-mode
    ;; https://github.com/vapniks/gnus-summary-ext/issues/3
    gnus-summary-ext
    bbdb
    ;; https://github.com/vapniks/bbdb-ext/issues/1
    bbdb-ext
    ;; https://gitlab.com/iankelling/bbdb-csv-import/issues/2
    bbdb-csv-import
    ;; https://github.com/DamienCassou/notmuch-labeler/issues/2
    notmuch-labeler
    ;; https://github.com/ruediger/weather-metno-el/issues/11
    weather-metno
    emms
    libmpdee
    ))


(dolist (pkg stable-packages)
  (message "Package: %s" pkg)
  (add-to-list 'package-pinned-packages
               (cons pkg "melpa-stable")))
(message "Pinned : %s" package-pinned-packages)

(package-initialize)
(package-refresh-contents)


(defun scame--install-packages (pkg-list)
  "Install each package of `PKG-LIST'."
  (dolist (pkg pkg-list)
    (unless (package-installed-p pkg)
      (ignore-errors
        (package-install pkg)))))


(scame--install-packages stable-packages)
(scame--install-packages unstable-packages)


(provide 'scame-pkg)
;;; scame-pkg.el ends here
