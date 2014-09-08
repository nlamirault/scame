;;; scame-config-test.el --- Unit tests for Scame configuration.

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(require 'test-helper)
(require 'f)


;; Init file

(ert-deftest test-scame-init-file ()
  (mapc (lambda (mode)
	  (should (featurep mode)))
	'(init-loader cask use-package)))

(ert-deftest test-scame-global-mode-is-loaded ()
  (should (scame-mode)))


;; UI tests

(ert-deftest test-scame-ui-minor-mode ()
  (mapc (lambda (mode)
	  (should mode))
	'(column-number-mode global-linum-mode line-number-mode))
   ;; (mapc (lambda (mode)
   ;; 	  (should-not mode))
   ;;       '(menu-bar-mode scroll-bar-mode tool-bar-mode)))
  )

;; Disable
;; (ert-deftest test-scame-golden-radio ()
;;   (should (golden-radio-mode)))


;; Check encodings

(ert-deftest test-scame-encodings ()
  (should (eql 'utf-8 default-terminal-coding-system))
  (should (eql 'utf-8-unix keyboard-coding-system))
  (should (string-equal "UTF-8" current-language-environment)))


;; Completion

;; FIXME: Why company-mode is not loaded
;; (ert-deftest test-scame-completion-mode ()
;;   (should (featurep 'company-mode)))


;; Ido

(ert-deftest test-scame-ido ()
  (should (featurep 'ido)))


;; Buffers

(ert-deftest test-scame-uniquify ()
  (require 'uniquify)
  (should (featurep 'uniquify)))

(ert-deftest test-scame-ag ()
  (require 'ag)
  (should (featurep 'ag)))

(ert-deftest test-scame-swoop ()
  (require 'swoop)
  (should (featurep 'swoop))
  (should (eql 'swoop (key-binding (kbd "C-o"))))
  (should (eql 'swoop-multi (key-binding (kbd "C-M-o"))))
  )
  ;; FIXME
  ;; (should (eql 'swoop-pcre-regexp (key-binding (kbd "M-o"))))
  ;; (should (eql 'swoop-back-to-last-position (key-binding (kbd "C-S-o")))))

(ert-deftest test-scame-ace-jump-mode ()
  (require 'ace-jump-mode)
  (should (featurep 'ace-jump-mode))
  (should (eql 'ace-jump-mode (key-binding (kbd "C-c SPC")))))


(ert-deftest test-scame-imenu-anywhere ()
  (require 'imenu-anywhere)
  (should (featurep 'imenu-anywhere))
  (should (eql 'imenu-anywhere (key-binding (kbd "C-.")))))

(ert-deftest test-scame-recentf ()
  (should (featurep 'recentf))
  (should (string-equal (f-join (getenv "HOME") ".emacs.d/.recentf")
			recentf-save-file)))


;; Crypto

(ert-deftest test-scame-epa ()
  (should (featurep 'epa-file)))


;; Directories

(ert-deftest test-scame-direx ()
  (should (featurep 'direx))
  (should (eql 'direx:jump-to-directory
	       (key-binding (kbd "C-x M-j")))))

(ert-deftest test-scame-dired-filter ()
  (should (featurep 'dired-filter)))

(ert-deftest test-scame-dired-filter ()
  (should (featurep 'dired-open)))

(ert-deftest test-scame-dired-filter ()
  (should (featurep 'dired-rainbow)))

(ert-deftest test-scame-dired-filter ()
  (should (featurep 'dired-subtree)))


;; Powerline

(ert-deftest test-scame-powerline ()
  (should (featurep 'powerline)))


;; Cloud

(ert-deftest test-scame-puppet ()
  (with-current-file "var/puppet/init.pp"
      (should (featurep 'puppet-mode))))

(ert-deftest test-scame-vagrant ()
  ;; (let ((vagrant-file (f-join scame-test/test-path "var/vagrant/Vagrantfile")))
  ;;   (with-current-buffer (find-file-noselect vagrant-file)
  (with-current-file "var/vagrant/Vagrantfile"
      (should (featurep 'ruby-mode)))
  (require 'vagrant)
  (should (featurep 'vagrant)))

(ert-deftest test-scame-dockerfile-mode ()
  ;; (let ((docker-file (f-join scame-test/test-path "var/docker/Dockerfile")))
  ;;   (with-current-buffer (find-file-noselect docker-file)
  (with-current-file "var/docker/Dockerfile"
      (should (featurep 'dockerfile-mode))))


;; Helm

(ert-deftest test-scame-helm ()
  (should (featurep 'helm-mode))
  (should (eql 'helm-find-files
	       (key-binding (kbd "C-c M-f"))))
  (should (eql 'helm-for-files
	       (key-binding (kbd "C-c f"))))
  (should (eql 'helm-M-x
               (key-binding (kbd "C-c M-x"))))
  (should (eql 'helm-show-kill-ring
               (key-binding (kbd "M-y"))))
  (should (eql 'helm-buffers-list
	       (key-binding (kbd "C-c b")))))

(ert-deftest test-scame-helm-imenu ()
  (require 'helm-imenu)
  (should (featurep 'helm-imenu))
  (should (eql 'helm-imenu
	       (key-binding (kbd "C-x C-i")))))


;; shell

(ert-deftest test-scame-multi-term ()
  (require 'multi-term)
  (should (featurep 'multi-term))
  (should (string-equal "/bin/bash" multi-term-program))
  (should (eql 'scame-launch-term
	       (key-binding (kbd "C-c t")))))


;; smex

(ert-deftest test-scame-smex ()
  (should (featurep 'smex))
  (should (eql 'smex (key-binding (kbd "C-x M-x"))))
  (should (eql 'smex-major-mode-commands (key-binding (kbd "C-x M-X")))))


;; vc

(ert-deftest test-scame-magit ()
  (require 'magit)
  (should (featurep 'magit))
  (should (eql 'magit-status (key-binding (kbd "C-c g s"))))
  (should (eql 'magit-pull (key-binding (kbd "C-c g d"))))
  (should (eql 'magit-push (key-binding (kbd "C-c g p"))))
  (should (eql 'magit-log (key-binding (kbd "C-c g l"))))
  (should (eql 'magit-branch-manager (key-binding (kbd "C-c g b")))))

;; FIXME: #27
;; (ert-deftest test-scame-git-gutter+ ()
;;   (should (eql 'global-git-gutter+-mode (key-binding (kbd "C-c g m"))))
;;   (should (eql 'git-gutter+-next-hunk (key-binding (kbd "C-c g >"))))
;;   (should (eql 'git-gutter+-previous-hunk (key-binding (kbd "C-c g <")))))


;; perspective

;; FIX: Issue 25
;; (ert-deftest test-perspective ()
;;   (with-current-file "var/hello.php"
;;     (should (require 'perspective))
;;     (should (eql 'persp-switch (key-binding (kbd "C-x x s"))))
;;     (should (eql 'persp-remove-buffer (key-binding (kbd "C-x x k"))))
;;     (should (eql 'persp-kill (key-binding (kbd "C-x x c"))))
;;     (should (eql 'persp-rename (key-binding (kbd "C-x x r"))))
;;     (should (eql 'persp-add-buffer (key-binding (kbd "C-x x a"))))
;;     (should (eql 'persp-import (key-binding (kbd "C-x x i"))))
;;     (should (eql 'persp-next (key-binding (kbd "C-x x n"))))
;;     (should (eql 'persp-prev (key-binding (kbd "C-x x p"))))))


;; Commons dev

;; FIXME
;; (ert-deftest test-scame-development-commons ()
;;   (should (eql nil indent-tabs-mode)))

(ert-deftest test-scame-fill-column ()
  (should (= 120 fill-column)))

(ert-deftest test-scame-changelog-mode ()
  (with-temp-buffer
    (change-log-mode)
    (should (eql nil indent-tabs-mode))))

(ert-deftest test-scame-projectile ()
  (should (require 'projectile))
  (should (eql 'projectile-find-file
	       projectile-switch-project-action)))

(ert-deftest test-scame-helm-projectile ()
  (should (require 'helm-projectile))
  (should (eql 'helm-projectile (key-binding (kbd "C-c h")))))

;; (ert-deftest test-scame-project-explorer ()
;;   (should (require 'project-explorer)))


;; Python

(defconst testsuite-python-filename
  "var/hello.py"
  "File name for testing python setup.")

(ert-deftest test-scame-python ()
  (with-current-file testsuite-python-filename
    (should (= 4 python-indent-offset))
    (should (eql nil indent-tabs-mode))))

(ert-deftest test-scame-anaconda ()
  (with-current-file testsuite-python-filename
    (should (featurep 'anaconda-mode))
    ;; FIXME
    ;;(should (featurep 'eldoc-mode))
    ))

(ert-deftest test-scame-tox ()
  (with-current-file testsuite-python-filename
    (should (eql 'tox-current-test
                 (key-binding (kbd "C-x y t"))))
    (should (eql 'tox-current-class
                 (key-binding (kbd "C-x y f"))))))

;; FIXME: why not present ?
;; (should (featurep 'company-anaconda))))

;; FIXME: jedi ??
;; (ert-deftest test-scame-jedi-direx ()
;;   (with-current-file testsuite-python-filename
;;     (should (eql 'jedi-direx:pop-to-buffer
;; 		 (key-binding (kbd "C-x y x"))))))

(ert-deftest test-scame-sphinx-doc ()
  (with-current-file testsuite-python-filename
    (should (eql 'sphinx-doc
                 (key-binding (kbd "C-c M-d"))))))

;; FIXME: doesn't works on unit tests, works on Emacs instance
;; (ert-deftest test-scame-helm-pydoc ()
;;   (with-current-file testsuite-python-filename
;;     (should (eql 'helm-pydoc
;;                  (key-binding (kbd "C-x y d"))))))


;; Common Lisp

(ert-deftest test-scame-slime ()
  (should (string-equal "/usr/bin/sbcl" inferior-lisp-program)))


;; Go lang

(defconst testsuite-go-filename
  "var/hello.go"
  "File name for testing Golang setup.")

(ert-deftest test-scame-golang ()
  (with-current-file testsuite-go-filename
    (should (featurep 'go-mode))
    (should (eql 'go-remove-unused-imports
        	 (key-binding (kbd "C-x g r"))))
    (should (eql 'go-goto-imports
        	 (key-binding (kbd "C-x g i"))))
    (should (eql 'godef-jump
        	 (key-binding (kbd "C-x g j"))))
    (should (eql 'godoc
                 (key-binding (kbd "C-x g d"))))
    (should (eql 'go-test-current-test
                 (key-binding (kbd "C-x g t"))))
    (should (eql 'go-test-current-file
                 (key-binding (kbd "C-x g f"))))
    (should (eql 'go-test-current-project
                 (key-binding (kbd "C-x g p"))))))

;; (ert-deftest test-scame-go-direx ()
;;   (with-current-file testsuite-go-filename
;;     (should (eql 'go-direx-pop-to-buffer
;; 		 (key-binding (kbd "C-x g x"))))))

;; (ert-deftest test-scame-go-projectile ()
;;   (with-current-file testsuite-go-filename
;;     (projectile-mode)
;;     (should (eql 'go-projectile-get
;; 		 (key-binding (kbd "C-c p N"))))))

;; Erlang

(ert-deftest test-scame-erlang ()
  (with-current-file "var/hello.erl"
      (should (featurep 'erlang))))


;; OCaml

(ert-deftest test-scame-ocaml ()
  (with-current-file "var/hello.ml"
      (should (featurep 'tuareg))))


;; PHP

(ert-deftest test-scame-php ()
  (with-current-file "var/hello.php"
      (should (featurep 'web-mode))
      (should (eql 'phpunit-current-test
                 (key-binding (kbd "C-x p t"))))
      (should (eql 'phpunit-current-class
                   (key-binding (kbd "C-x p f"))))
      (should (eql 'phpunit-current-project
                   (key-binding (kbd "C-x p p"))))))

;; Scheme

(ert-deftest test-scame-scheme ()
  (with-current-file "var/hello.scm"
      (should (featurep 'geiser))))


;; Perl

(defconst testsuite-perl-filename
  "var/hello.pl"
  "File name for testing Perl setup.")

(ert-deftest test-scame-perl ()
  (with-current-file testsuite-perl-filename
    (should (featurep 'perl-mode))))

;; (ert-deftest test-scame-plsense-direx ()
;;   (with-current-file testsuite-perl-filename
;;     (should (eql 'plsense-direx:open-explorer-key
;; 		 (key-binding (kbd "C-x j"))))))

(ert-deftest test-scame-helm-perldoc ()
  (with-current-file testsuite-perl-filename
    (should (eql 'helm-perldoc
		 (key-binding (kbd "C-x e d"))))))

;; Elisp

(ert-deftest test-scame-elisp ()
  (with-current-file "var/hello.el"
      (should (featurep 'eldoc))
      (should (featurep 'elisp-slime-nav))
      (should (featurep 'ielm))
      (should (featurep 'erefactor))))


;; Haskell

(ert-deftest test-scame-haskell ()
  (with-current-file "var/hello.hs"
      (should (featurep 'haskell-mode))))


;; Clojure

(ert-deftest test-scame-clojure ()
  (with-current-file "var/hello.clj"
      (should (featurep 'cider))
      (should (featurep 'company-cider))
      (should (featurep 'clj-refactor))))


;; Ruby

(ert-deftest test-scame-ruby ()
  (with-current-file "var/hello.rb"
      (should (featurep 'rvm))
      (should (featurep 'ruby-tools))
      (should (featurep 'inf-ruby))
      (should (featurep 'ruby-mode))
      (should (featurep 'company-inf-ruby))
      (should (eql 'inf-ruby (key-binding (kbd "C-c r r"))))
      (should (eql 'ruby-tools-to-single-quote-string
                   (key-binding (kbd "C-'"))))
      (should (eql 'ruby-tools-to-double-quote-string
                   (key-binding (kbd "C-\""))))
      (should (eql 'ruby-tools-to-symbol
                   (key-binding (kbd "C-:"))))
      (should (eql 'ruby-tools-clear-string
                   (key-binding (kbd "C-;"))))))



;; C/C++

(ert-deftest test-scame-c ()
  (with-current-file "var/hello.c"
      (should (featurep 'google-c-style))
      (should (featurep 'auto-complete-c-headers))
      (should (featurep 'c-eldoc))
      (should (= 4 c-basic-offset))
      (should (string-equal "google" c-indentation-style))
      (should (= 120 c-eldoc-buffer-regenerate-time))))

(ert-deftest test-scame-cpp ()
  (with-current-file "var/hello.cpp"
      (should (featurep 'google-c-style))
      (should (featurep 'auto-complete-c-headers))
      (should (featurep 'c-eldoc))
      (should (= 2 c-basic-offset))
      (should (string-equal "google" c-indentation-style))
      (should (= 120 c-eldoc-buffer-regenerate-time))))

;; Rust

(ert-deftest test-scame-rust ()
  (with-current-file "var/hello.rs"
      (should (featurep 'rust-mode))))

;; Markup text

(ert-deftest test-markdown-mode ()
  (with-current-file "var/readme.md"
      (should (featurep 'markdown-mode)))
  (with-current-file "var/readme.markdown"
      (should (featurep 'markdown-mode))))

(ert-deftest test-fountain-mode ()
  (with-current-file "var/scame.fountain"
      (should (featurep 'fountain-mode))))


(ert-deftest test-toml-mode ()
  (with-current-file "var/scame.toml"
      (should (featurep 'toml-mode))))


(ert-deftest test-fixmee-mode ()
  (with-current-file "var/hello.py"
      (should fixmee-mode)
      (should (eql 'fixmee-view-listing
                   (key-binding (kbd "C-c v"))))


;; TDD

;; FIXME
;; (ert-deftest test-scame-cerbere-python ()
;;   (should (require 'cerbere))
;;   (with-temp-buffer
;;     (jedi:install-server)
;;     (python-mode)
;;     (cerbere-mode)
;;     (should (require 'cerbere-tox))
;;     (should (eql 'cerbere-current-test
;;                  (key-binding (kbd "C-c c t"))))
;;     (should (eql 'cerbere-current-file
;;                  (key-binding (kbd "C-c c f"))))
;;     (should (eql 'cerbere-current-project
;;                  (key-binding (kbd "C-c c p"))))))


;; IRC

(ert-deftest test-scame-erc ()
  (should (require 'erc)))


;; Org

(ert-deftest test-scame-org ()
  (should (require 'org))
  (should (string-equal (f-join (getenv "HOME") "Org")
			org-directory))
  (should (eql 'org-capture
	       (key-binding (kbd "C-c o c")))))

;; Weather

(ert-deftest test-scame-weather ()
  (should (require 'weather-metno)))


;; Packages

(ert-deftest test-scame-packages ()
  (should (require 'paradox)))


(provide 'scame-config-test)
;;; scame-config-test.el ends here
