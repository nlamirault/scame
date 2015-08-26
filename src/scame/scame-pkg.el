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

(require 'scame-io)


;; Repositories


(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ;; ("melpa" . "http://melpa.milkbox.net/packages/")
        ))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install dependencies
(scame--msg-buffer "--> Dependencies installation ...\n"
                   'font-lock-string-face)
(redisplay)
(defvar scame-dependencies '(s f dash popwin))
(dolist (pkg scame-dependencies)
  (unless (package-installed-p pkg)
    (package-install pkg)))
(require 'dash)

;; Scame packages


(defvar stable-packages
  '(
    epl helm paradox el-init el-init-viewer
    company auto-complete
    ;; find-file-in-project
    neotree
    imenu-anywhere
    dired-imenu
    flycheck flycheck-cask flycheck-color-mode-line flycheck-package
    butler
    ;; ;; Common Lisp
    ;; sly sly-company
    ;; ;; Elisp
    ;; elisp-slime-nav erefactor overseer
    ;; ;; Golang
    ;; ;; go-mode company-go go-eldoc gotest go-direx go-errcheck
    ;; ;; Python
    ;; jedi elpy tox pyvenv sphinx-doc helm-pydoc pip-requirements
    ;; ;; Ruby
    ;; rvm ruby-tools inf-ruby ruby-test-mode
    ;; ;; Scheme
    ;; geiser
    ;; ;; Clojure
    ;; cider
    ;; ;; Haskell
    ;; haskell-mode flycheck-haskell
    ;; ;; OCaml
    ;; tuareg ;merlin
    ;; ;; Web
    ;; web-mode
    ;; ;; Php
    ;; php-mode emacsagist phpunit
    ;; ;; Perl
    ;; cperl-mode helm-perldoc
    ;; ;; Javascript
    ;; js3-mode tern company-tern
    ;; ;; NodeJS
    ;; jade-mode
    ;; ;; C/C++/ObjectiveC
    ;; company-irony
    ;; ;; Elixir
    ;; elixir-mode alchemist
    ;; ;; Lua
    ;; lua-mode
    ;; Markup languages
    markdown-mode yaml-mode adoc-mode
    ;; ;; Cloud
    ;; dockerfile-mode vagrant puppet-mode ansible ansible-doc terraform-mode
    ;; Git and friends
    magit magit-gerrit
    gitconfig-mode gitignore-mode gitattributes-mode
    gist git-gutter+ git-timemachine helm-open-github
    ;; Utilities
    pkg-info project-persist
    helm-mt
    lice
    ;; Notifications
    sauron
    ;; Search
    helm-ack ag helm-ag pt helm-swoop
    swiper swiper-helm
    ;; ;; Social
    ;; jabber
    ;; twittering-mode
    ;; sx
    ;; Calendar
    ;; calfw

    ;; UI
    rich-minority powerline smart-mode-line smart-mode-line-powerline-theme
    ace-window

    ;; Dired and friends
    ranger direx dired-k

    ;; Sysadmin
    ;; nginx-mode

    ;; ;; Gnus and friends
    ;; gnus-x-gm-raw
    ;; bbdb-
    ;; notmuch

    ;; Keys
    hydra which-key

    ;; Multimedia
    ;; bongo
    ))


(defvar unstable-packages
  '(
    ;; Themes
    material-theme
    monokai-theme
    zenburn-theme

    alert
    benchmark-init
    helm-flycheck

    ;; Projects
    projectile helm-projectile persp-projectile ibuffer-projectile
    helm-project-persist

    ;; ;; https://github.com/dougm/go-projectile/issues/2
    ;; go-projectile
    ;; ;; https://github.com/golang/lint/issues/111
    ;; golint

    ;; ;; https://github.com/proofit404/anaconda-mode/issues/98
    ;; anaconda-mode
    ;; ;;https://github.com/proofit404/company-anaconda/issues/3
    ;; company-anaconda
    ;; ;; https://github.com/tkf/emacs-jedi-direx/issues/17
    ;; jedi-direx

    ;; rhtml-mode company-inf-ruby

    ;; erlang

    ;; ghci-completion

    ;; ;; https://github.com/Sarcasm/flycheck-irony/issues/4
    ;; irony
    ;; flycheck-irony
    ;; ;; https://github.com/ikirill/irony-eldoc/issues/3
    ;; irony-eldoc

    ;; ;; https://github.com/rust-lang/rust-mode/issues/87
    ;; rust-mode

    ;; https://github.com/dryman/toml-mode.el/issues/2
    toml-mode
    ;; https://github.com/Sliim/helm-project-persist/issues/2

    ;; IRC
    ;; https://github.com/jorgenschaefer/circe/issues/202
    ;; circe
    ;; rcirc-groups
    ;; ;; https://github.com/fgallina/rcirc-alertify/issues/1
    ;; rcirc-alertify
    ;; rcirc-notify

    ;; ;; Org
    ;; org org-gcal org-agenda-property org-journal orgbox org-caldav

    ;; Dired
    ;; https://github.com/Fuco1/dired-hacks/issues/33
    dired-filter dired-open dired-rainbow dired-subtree
    ;; https://github.com/vapniks/syslog-mode/issues/12

    ;; ;; Sysadmin
    ;; nginx-mode
    ;; syslog-mode
    ;; apache-mode

    ;; ;; Gnus
    ;; ;; https://github.com/vapniks/gnus-summary-ext/issues/3
    ;; gnus-summary-ext
    ;; bbdb
    ;; ;; https://github.com/vapniks/bbdb-ext/issues/1
    ;; bbdb-ext
    ;; ;; https://gitlab.com/iankelling/bbdb-csv-import/issues/2
    ;; bbdb-csv-import
    ;; ;; https://github.com/DamienCassou/notmuch-labeler/issues/2
    ;; notmuch-labeler

    ;; Misc
    ;; https://github.com/ruediger/weather-metno-el/issues/11
    weather-metno
    ;; https://github.com/hrs/engine-mode/issues/22
    engine-mode
    multi-term
    ;; https://github.com/ralesi/helm-pt/issues/2
    helm-pt
    ;; https://github.com/ShingoFukuyama/emacs-swoop/issues/9
    swoop

    ;; Multimedia
    ;; emms
    ;; libmpdee
    ))

;; Packages environments

(when scame-golang
  (add-to-list 'stable-packages 'go-mode t)
  (add-to-list 'stable-packages 'go-mode t)
  (add-to-list 'stable-packages 'company-go t)
  (add-to-list 'stable-packages 'go-eldoc t)
  (add-to-list 'stable-packages 'gotest t)
  (add-to-list 'stable-packages 'go-direx t)
  (add-to-list 'stable-packages 'go-errcheck t)
  ;; https://github.com/dougm/go-projectile/issues/2
  (add-to-list 'unstable-packages 'go-projectile t)
  ;; https://github.com/golang/lint/issues/111
  (add-to-list 'unstable-packages 'golint t))

(when scame-commonlisp
  (add-to-list 'stable-packages 'sly t)
  (add-to-list 'stable-packages 'sly-company t))

(when scame-elisp
  (add-to-list 'stable-packages 'elisp-slime-nav t)
  (add-to-list 'stable-packages 'erefactor t)
  (add-to-list 'stable-packages 'overseer t))

(when scame-python
  ;; https://github.com/proofit404/anaconda-mode/issues/98
  (add-to-list 'unstable-packages 'anaconda-mode t)
  ;;https://github.com/proofit404/company-anaconda/issues/3
  (add-to-list 'unstable-packages 'company-anaconda t)
  (add-to-list 'stable-packages 'jedi t)
  ;; https://github.com/tkf/emacs-jedi-direx/issues/17
  (add-to-list 'unstable-packages 'jedi-direx t)
  (add-to-list 'stable-packages 'tox t)
  (add-to-list 'unstable-packages 'py-yapf t)
  (add-to-list 'stable-packages 'elpy t)
  (add-to-list 'stable-packages 'pyvenv t)
  (add-to-list 'stable-packages 'sphinx-doc t)
  (add-to-list 'stable-packages 'helm-pydoc t)
  (add-to-list 'stable-packages 'pip-requirements t))

(when scame-ruby
  (add-to-list 'stable-packages 'rvm t)
  (add-to-list 'stable-packages 'ruby-tools t)
  (add-to-list 'stable-packages 'inf-ruby t)
  (add-to-list 'stable-packages 'ruby-test-mode t)
  (add-to-list 'unstable-packages 'rhtml-mode t)
  (add-to-list 'unstable-packages 'company-inf-ruby t))

(when scame-scheme
  (add-to-list 'stable-packages 'geiser t) t)

(when scame-clojure
  (add-to-list 'stable-packages 'cider t))

(when scame-erlang
  (add-to-list 'unstable-packages 'erlang t))

(when scame-haskell
  (add-to-list 'stable-packages 'haskell-mode t)
  (add-to-list 'stable-packages 'flycheck-haskell t)
  (add-to-list 'unstable-packages 'ghci-completion t))

(when scame-ocaml
  (add-to-list 'stable-packages 'tuareg t) t)

(when scame-php
  (add-to-list 'stable-packages 'php-mode t)
  (add-to-list 'stable-packages 'phpunit t))

(when scame-web
  (add-to-list 'stable-packages 'web-mode t))

(when scame-perl
  (add-to-list 'stable-packages 'cperl-mode t)
  (add-to-list 'stable-packages 'helm-perldoc t))

(when scame-javascript
  (add-to-list 'stable-packages 'js3-mode t)
  (add-to-list 'stable-packages 'tern t)
  (add-to-list 'stable-packages 'company-tern t)
  (add-to-list 'stable-packages 'jade-mode t))

(when scame-c-cpp-objc
  (add-to-list 'unstable-packages 'irony t)
  (add-to-list 'stable-packages 'company-irony t)
  (add-to-list 'unstable-packages 'flycheck-irony t)
  ;; https://github.com/ikirill/irony-eldoc/issues/3
  (add-to-list 'unstable-packages 'irony-eldoc t))

(when scame-elixir
  (add-to-list 'unstable-packages 'elixir-mode t)
  (add-to-list 'stable-packages 'alchemist t))

(when scame-lua
  (add-to-list 'stable-packages 'lua-mode t))

(when scame-rust
  ;; https://github.com/rust-lang/rust-mode/issues/87
  (add-to-list 'unstable-packages 'rust-mode t)
  (add-to-list 'unstable-packages 'racer t)
  (add-to-list 'unstable-packages 'flycheck-rust t)
  (add-to-list 'unstable-packages 'company-racer t))

(when scame-cloud
  (add-to-list 'stable-packages 'dockerfile-mode t)
  (add-to-list 'stable-packages 'vagrant t)
  (add-to-list 'stable-packages 'puppet-mode t)
  (add-to-list 'stable-packages 'ansible t)
  (add-to-list 'stable-packages 'ansible-doc t)
  (add-to-list 'stable-packages 'terraform-mode t))

(when scame-social
  (add-to-list 'stable-packages 'twittering-mode t)
  (add-to-list 'stable-packages 'sx t))

(when scame-communication
  (add-to-list 'unstable-packages 'jabber t)
  (add-to-list 'unstable-packages 'circe t)
  (add-to-list 'unstable-packages 'rcirc-groups t)
  ;; https://github.com/fgallina/rcirc-alertify/issues/1
  (add-to-list 'unstable-packages 'rcirc-alertify t)
  (add-to-list 'unstable-packages 'rcirc-notify t))

(when scame-org
  ;; (add-to-list 'unstable-packages 'org t)
  (add-to-list 'package-pinned-packages
               (cons 'org "org"))
  (add-to-list 'stable-packages 'calfw t)
  (add-to-list 'unstable-packages 'org-gcal t)
  (add-to-list 'unstable-packages 'org-agenda-property t)
  (add-to-list 'unstable-packages 'org-journal t)
  (add-to-list 'unstable-packages 'orgbox t)
  (add-to-list 'unstable-packages 'org-caldav t))

(when scame-multimedia
  (add-to-list 'stable-packages 'bongo t)
  (add-to-list 'unstable-packages 'emms t))

(when scame-sysadmin
  (add-to-list 'unstable-packages 'nginx-mode t)
  (add-to-list 'unstable-packages 'syslog-mode t)
  (add-to-list 'unstable-packages 'apache-mode t))

(when scame-email
  (add-to-list 'unstable-packages 'bbdb t)
  (add-to-list 'stable-packages 'gnus-x-gm-raw t)
  (add-to-list 'unstable-packages 'gnus-summary-ext t)
  (add-to-list 'stable-packages 'bbdb- t)
  (add-to-list 'unstable-packages 'bbdb-csv-import t)
  (add-to-list 'stable-packages 'notmuch t)
  (add-to-list 'unstable-packages 'notmuch-labeler t))

(defvar scame-addons nil)

;; Tools

(defun scame--install-packages (pkg-list)
  "Install each package of `PKG-LIST'."
  (dolist (pkg pkg-list)
    (scame--msg-buffer (format "- %-25s" pkg)
                       'font-lock-variable-name-face)
    (redisplay)
    (scame--msg-buffer " [x]\n"
                       'font-lock-variable-name-face)
    (unless (package-installed-p pkg)
      (package-install pkg))
    (redisplay)))


(dolist (pkg stable-packages)
 ;;  (message "Package: %s" pkg)
  (add-to-list 'package-pinned-packages
               (cons pkg "melpa-stable")))

(dolist (pkg unstable-packages)
  ;; (message "Package: %s" pkg)
  (add-to-list 'package-pinned-packages
               (cons pkg "melpa")))

;; (message "Pinned : %s" package-pinned-packages)


(setq split-height-threshold nil)
(setq split-width-threshold 0)

(scame--msg-buffer "--> Packages installation ...\n"
                   'font-lock-string-face)
(redisplay)
(scame--install-packages stable-packages)
(scame--install-packages unstable-packages)

;; Upgrade installed packages
;; (save-window-excursion
;;   (package-list-packages t)
;;   (package-menu-mark-upgrades)
;;   (condition-case nil
;;       (package-menu-execute t)
;;     (error
;;      (package-menu-execute))))

(provide 'scame-pkg)
;;; scame-pkg.el ends here
