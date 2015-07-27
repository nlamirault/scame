;;; 19_vc.el --- Version control

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package magit
  :bind (("C-c g s" . magit-status)
	 ("C-c g d" . magit-pull)
	 ("C-c g p" . magit-push)
	 ("C-c g l" . magit-log-all)
	 ("C-c g b" . magit-branch-manager)))

(setq magit-auto-revert-mode nil
      magit-last-seen-setup-instructions "1.4.0")

(use-package magit-gerrit)

(use-package gitconfig-mode)

(use-package gitignore-mode)

;; FIXME
;; (use-package gist
;;   :init (setq gist-authenticate-function 'gist-oauth2-authentication)
;;   :bind (("C-c g g") . gist-region-or-buffer))

;; (use-package git-gutter-fringe+
;;   :config (git-gutter-fr+-minimal))

(use-package git-gutter+
  :config (global-git-gutter+-mode 1)
  :bind (("C-c g m" . global-git-gutter+-mode)
         ("C-c g >" . git-gutter+-next-hunk)
         ("C-c g <" . git-gutter+-previous-hunk)))

(use-package helm-open-github
  :bind (("C-c g h f" . helm-open-github-from-file)
         ("C-c g h c" . helm-open-github-from-commit)
         ("C-c g h i" . helm-open-github-from-issues)
         ("C-c g h p" . helm-open-github-from-pull-requests)))

(use-package helm-gitlab)

(use-package git-timemachine
  :bind (("C-c g t" . git-timemachine)))


(provide '19_vc)
;;; 19_vc.el ends here
