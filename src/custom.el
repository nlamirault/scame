;; custom.el --- Emacs customization file

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "/usr/bin/google-chrome")
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (moody minions zerodark-theme salt-mode gnus-summary-ext dired-sidebar notmuch-labeler notmuch all-the-icons-gnus doom-themes bbdb calfw-cal calfw-ical calfw flyspell-correct nov adoc-mode toml-mode fountain-mode markdown-mode yaml-mode paradox sauron alert platformio-mode arduino-mode lua-mode alchemist elixir-mode jade-mode company-tern tern js3-mode web-mode company-racer flycheck-rust racer cargo rust-mode irony-eldoc flycheck-irony company-irony irony company-inf-ruby rhtml-mode rvm ruby-tools cider haskell-mode erefactor elisp-slime-nav geiser phpunit php-mode flycheck-ocaml merlin tuareg company-go go-projectile go-direx go-dlv go-rename golint go-errcheck gotest go-eldoc go-mode erlang sly-company sly pip-requirements sphinx-doc pyvenv tox company-anaconda anaconda-mode origami dumb-jump treemacs-projectile treemacs neotree eyebrowse ibuffer-projectile editorconfig gitignore-mode gitconfig-mode magit flycheck-cask flycheck-color-mode-line flycheck multi-term fish-mode terraform-mode dockerfile-mode vagrant ansible-doc ansible puppet-mode direx all-the-icons-dired imenu-anywhere ace-jump-mode which-key ivy-rich all-the-icons-ivy ivy-hydra counsel-projectile counsel company emojify-logos emojify dashboard nlinum-hl page-break-lines ace-window mode-icons all-the-icons el-init f use-package)))
 '(paradox-github-token t)
 '(safe-local-variable-values (quote ((eval ispell-change-dictionary "en_US"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 113 :width normal)))))

(provide 'custom)
;;; custom.el ends here
