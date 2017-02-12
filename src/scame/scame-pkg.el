;; scame-pkg.el --- Scame Packages installation

;; Copyright (c) 2014, 2015, 2016 2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; Install dependencies
(scame--msg-buffer scame-buffer
                   "--> Dependencies installation ...\n"
                   'font-lock-string-face)
(redisplay)
(defvar scame-dependencies '(s f dash popwin))
(dolist (pkg scame-dependencies)
  (unless (package-installed-p pkg)
    (package-install pkg)))
(require 'dash)

;; Scame packages

(defvar gnu-packages
  '(
    seq
    ))

(defvar stable-packages '())

(defvar unstable-packages
  '(


    ;; Search
    helm
    counsel
    swiper

    ack
    helm-ack
    ag
    helm-ag
    pt
    helm-pt
    sift
    swoop
    helm-swoop
    dumb-jump
    origami

    spinner
    paradox

    crux

    alert
    benchmark-init

    cask-mode

    flycheck
    flycheck-cask
    flycheck-color-mode-line
    flycheck-package
    flyspell-correct
    helm-flycheck

    ;; Completion
    company
    company-shell
    company-emoji
    auto-complete

    ;; Projects
    editorconfig
    projectile
    helm-projectile
    persp-projectile
    ibuffer-projectile
    helm-project-persist
    counsel-projectile

    toml-mode

    ;; Dired
    ;; https://github.com/Fuco1/dired-hacks/issues/33
    dired-filter dired-open dired-rainbow dired-subtree
    ;; https://github.com/vapniks/syslog-mode/issues/12

    ;; Misc
    ;; https://github.com/ruediger/weather-metno-el/issues/11
    weather-metno
    sunshine
    ;; forecast
    ;; https://github.com/hrs/engine-mode/issues/22
    engine-mode
    multi-term

    ;; Multimedia
    ;; emms
    ;; libmpdee

    ;; UI
    rich-minority
    powerline
    ace-window
    smart-mode-line smart-mode-line-powerline-theme
    spaceline
    mode-icons
    all-the-icons
    all-the-icons-dired
    ;;beacon

    ;; Keys
    hydra which-key

    epl el-init el-init-viewer

    neotree
    imenu-anywhere
    dired-imenu

    butler

    ;; Markup languages
    markdown-mode yaml-mode adoc-mode

    ;; Git and friends
    magit magit-gerrit
    gitconfig-mode gitignore-mode gitattributes-mode
    gist git-gutter+ git-timemachine helm-open-github

    ;; Utilities
    pkg-info project-persist
    ;; helm-mt
    lice

    ;; Notifications
    sauron

    ;; Dired and friends
    ranger direx dired-k

    ;; Multimedia
    ;; bongo

    ))

;; Packages environments


(when scame-golang
  (add-to-list 'unstable-packages 'go-mode t)
  (add-to-list 'unstable-packages 'company-go t)
  (add-to-list 'unstable-packages 'go-eldoc t)
  (add-to-list 'unstable-packages 'gotest t)
  (add-to-list 'unstable-packages 'go-direx t)
  (add-to-list 'unstable-packages 'go-errcheck t)
  ;; https://github.com/dougm/go-projectile/issues/2
  (add-to-list 'unstable-packages 'go-projectile t)
  ;; https://github.com/golang/lint/issues/111
  (add-to-list 'unstable-packages 'go-rename t)
  (add-to-list 'unstable-packages 'go-dlv t)
  (add-to-list 'unstable-packages 'golint t))

(when scame-commonlisp
  (add-to-list 'unstable-packages 'sly t)
  (add-to-list 'unstable-packages 'sly-company t))

(when scame-elisp
  (add-to-list 'unstable-packages 'elisp-slime-nav t)
  (add-to-list 'unstable-packages 'erefactor t)
  (add-to-list 'unstable-packages 'overseer t))

(when scame-python
  ;; https://github.com/proofit404/anaconda-mode/issues/98
  (add-to-list 'unstable-packages 'anaconda-mode t)
  ;;https://github.com/proofit404/company-anaconda/issues/3
  (add-to-list 'unstable-packages 'company-anaconda t)
  (add-to-list 'unstable-packages 'jedi t)
  ;; https://github.com/tkf/emacs-jedi-direx/issues/17
  (add-to-list 'unstable-packages 'jedi-direx t)
  (add-to-list 'unstable-packages 'tox t)
  (add-to-list 'unstable-packages 'py-yapf t)
  (add-to-list 'unstable-packages 'elpy t)
  (add-to-list 'unstable-packages 'pyvenv t)
  (add-to-list 'unstable-packages 'sphinx-doc t)
  (add-to-list 'unstable-packages 'helm-pydoc t)
  (add-to-list 'unstable-packages 'pip-requirements t))

(when scame-ruby
  (add-to-list 'unstable-packages 'rvm t)
  (add-to-list 'unstable-packages 'ruby-tools t)
  (add-to-list 'unstable-packages 'inf-ruby t)
  (add-to-list 'unstable-packages 'ruby-test-mode t)
  (add-to-list 'unstable-packages 'rhtml-mode t)
  (add-to-list 'unstable-packages 'company-inf-ruby t))

(when scame-scheme
  (add-to-list 'unstable-packages 'geiser t) t)

(when scame-clojure
  (add-to-list 'unstable-packages 'cider t))

(when scame-erlang
  (add-to-list 'unstable-packages 'erlang t))

(when scame-haskell
  (add-to-list 'unstable-packages 'haskell-mode t)
  (add-to-list 'unstable-packages 'flycheck-haskell t)
  (add-to-list 'unstable-packages 'ghci-completion t))

(when scame-ocaml
  (add-to-list 'unstable-packages 'tuareg t)
  (add-to-list 'unstable-packages 'merlin t)
  (add-to-list 'unstable-packages 'utop t)
  (add-to-list 'unstable-packages 'flycheck-ocaml t))

(when scame-php
  (add-to-list 'unstable-packages 'php-mode t)
  (add-to-list 'unstable-packages 'phpunit t))

(when scame-web
  (add-to-list 'unstable-packages 'web-mode t))

(when scame-perl
  (add-to-list 'unstable-packages 'cperl-mode t)
  (add-to-list 'unstable-packages 'helm-perldoc t))

(when scame-javascript
  (add-to-list 'unstable-packages 'js3-mode t)
  (add-to-list 'unstable-packages 'tern t)
  (add-to-list 'unstable-packages 'company-tern t)
  (add-to-list 'unstable-packages 'jade-mode t))

(when scame-c-cpp-objc
  (add-to-list 'unstable-packages 'irony t)
  (add-to-list 'unstable-packages 'company-irony t)
  (add-to-list 'unstable-packages 'flycheck-irony t)
  ;; https://github.com/ikirill/irony-eldoc/issues/3
  (add-to-list 'unstable-packages 'irony-eldoc t))

(when scame-elixir
  (add-to-list 'unstable-packages 'elixir-mode t)
  (add-to-list 'unstable-packages 'alchemist t))

(when scame-lua
  (add-to-list 'unstable-packages 'lua-mode t))

(when scame-rust
  ;; https://github.com/rust-lang/rust-mode/issues/87
  (add-to-list 'unstable-packages 'rust-mode t)
  (add-to-list 'unstable-packages 'flycheck-rust t)
  (add-to-list 'unstable-packages 'rustfmt t)
  (add-to-list 'unstable-packages 'racer t)
  (add-to-list 'unstable-packages 'company-racer t)
  (add-to-list 'unstable-packages 'cargo t))

(when scame-cloud
  (add-to-list 'unstable-packages 'dockerfile-mode t)
  (add-to-list 'unstable-packages 'vagrant t)
  (add-to-list 'unstable-packages 'puppet-mode t)
  (add-to-list 'unstable-packages 'ansible t)
  (add-to-list 'unstable-packages 'ansible-doc t)
  ;;(add-to-list 'unstable-packages 'terraform-mode t))
  )

(when scame-iot
  ;; Enable scrolling and colours in the compile buffer.
  (add-to-list 'unstable-packages 'arduino-mode t)
  (add-to-list 'unstable-packages 'platformio-mode t)
  (add-to-list 'unstable-packages 'company-arduino t))

(when scame-social
  (add-to-list 'unstable-packages 'twittering-mode t)
  (add-to-list 'unstable-packages 'sx t))

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
  (add-to-list 'unstable-packages 'calfw t)
  ;;(add-to-list 'unstable-packages 'org-gcal t)
  ;;(add-to-list 'unstable-packages 'org-agenda-property t)
  ;; (add-to-list 'unstable-packages 'org-journal t)
  ;; (add-to-list 'unstable-packages 'org-bullets t)
  ;; (add-to-list 'unstable-packages 'orgbox t)
  ;; (add-to-list 'unstable-packages 'org-caldav t))
  )

(when scame-multimedia
  (add-to-list 'unstable-packages 'bongo t)
  (add-to-list 'unstable-packages 'emms t))

(when scame-sysadmin
  (add-to-list 'unstable-packages 'nginx-mode t)
  (add-to-list 'unstable-packages 'syslog-mode t)
  (add-to-list 'unstable-packages 'apache-mode t))

(when scame-email
  (add-to-list 'unstable-packages 'bbdb t)
  (add-to-list 'unstable-packages 'gnus-x-gm-raw t)
  (add-to-list 'unstable-packages 'gnus-summary-ext t)
  (add-to-list 'unstable-packages 'bbdb- t)
  (add-to-list 'unstable-packages 'bbdb-csv-import t)
  (add-to-list 'unstable-packages 'notmuch t)
  (add-to-list 'unstable-packages 'notmuch-labeler t))


;; Themes
(add-to-list 'unstable-packages 'material-theme t)
(add-to-list 'unstable-packages 'monokai-theme t)
(add-to-list 'unstable-packages 'zerodark-theme t)
(add-to-list 'unstable-packages 'doom-themes t)


(defvar scame-addons nil)

;; Tools

(defun scame--install-packages (pkg-list)
  "Install each package of `PKG-LIST'."
  (dolist (pkg pkg-list)
    (scame--msg-buffer scame-buffer
                       (format "- %-25s" pkg)
                       'font-lock-variable-name-face)
    (redisplay)
    (scame--msg-buffer scame-buffer
                       " [x]\n"
                       'font-lock-variable-name-face)
    (unless (package-installed-p pkg)
      (package-install pkg))
    (redisplay)))

(dolist (pkg gnu-packages)
  (add-to-list 'package-pinned-packages
               (cons pkg "gnu")))

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

(scame--msg-buffer scame-buffer
                   "--> Packages installation ...\n"
                   'font-lock-string-face)
(redisplay)
(scame--install-packages gnu-packages)
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
