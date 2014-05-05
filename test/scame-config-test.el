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
;;(require 'cask)
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
  ;; 	  (should (not mode)))
  ;; 	'(menu-bar-mode scroll-bar-mode tool-bar-mode)))
  )


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


;; Emacs server

(ert-deftest test-scame-emacs-server ()
  (should (server-running-p)))


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
  (let ((puppet-file (f-join scame-test/test-path "var/puppet/init.pp")))
    (with-current-buffer (find-file-noselect puppet-file)
      (should (featurep 'puppet-mode)))))

(ert-deftest test-scame-vagrant ()
  (let ((vagrant-file (f-join scame-test/test-path "var/vagrant/Vagrantfile")))
    (with-current-buffer (find-file-noselect vagrant-file)
      (should (featurep 'ruby-mode))))
  (require 'vagrant)
  (should (featurep 'vagrant)))

(ert-deftest test-scame-dockerfile-mode ()
  (let ((docker-file (f-join scame-test/test-path "var/docker/Dockerfile")))
    (with-current-buffer (find-file-noselect docker-file)
      (should (featurep 'dockerfile-mode)))))


;; Helm

(ert-deftest test-scame-helm ()
  (should (featurep 'helm-mode))
  (should (eql 'helm-find-files
	       (key-binding (kbd "C-c M-f"))))
  (should (eql 'helm-for-files
	       (key-binding (kbd "C-c f"))))
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
  (should (eql 'smex (key-binding (kbd "M-x"))))
  (should (eql 'smex-major-mode-commands (key-binding (kbd "M-X")))))


;; vc

(ert-deftest test-scame-magit ()
  (require 'magit)
  (should (featurep 'magit))
  (should (eql 'magit-status (key-binding (kbd "C-c g s"))))
  (should (eql 'magit-pull (key-binding (kbd "C-c g d"))))
  (should (eql 'magit-push (key-binding (kbd "C-c g p"))))
  (should (eql 'magit-log (key-binding (kbd "C-c g l"))))
  (should (eql 'magit-branch-manager (key-binding (kbd "C-c g b")))))


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

(ert-deftest test-scame-project-explorer ()
  (should (require 'project-explorer)))


;; Python

(defconst testsuite-python-filename
  (f-join scame-test/test-path "var/hello.py")
  "File name for testing python setup.")

(ert-deftest test-scame-python ()
  (with-current-buffer (find-file-noselect testsuite-python-filename)
    (should (= 4 python-indent-offset))
    (should (eql nil indent-tabs-mode))))

(ert-deftest test-scame-anaconda ()
  (with-current-buffer (find-file-noselect testsuite-python-filename)
    (should (featurep 'anaconda-mode))
    (should (featurep 'anaconda-eldoc))
    ))
;; FIXME: why not present ?
;; (should (featurep 'company-anaconda))))

;; FIXME
;; (ert-deftest test-scame-jedi-direx ()
;;   (should (require 'jedi-direx))
;;   (with-temp-buffer
;;     (python-mode)
;;     (should (eql 'jedi-direx:pop-to-buffer
;; 		 (key-binding (kbd "C-x j"))))))

;; FIXME
(ert-deftest test-scame-sphinx-doc ()
  (with-current-buffer (find-file-noselect testsuite-python-filename)
    (should (eql 'sphinx-doc
                 (key-binding (kbd "C-c M-d"))))))

;; Common Lisp

(ert-deftest test-scame-slime ()
  (should (string-equal "/usr/bin/sbcl" inferior-lisp-program)))


;; Go lang

(defconst testsuite-go-filename
  (f-join scame-test/test-path "var/hello.go")
  "File name for testing Golang setup.")

(ert-deftest test-scame-golang ()
  (with-current-buffer (find-file-noselect testsuite-go-filename)
    (should (eql 'go-remove-unused-imports
		 (key-binding (kbd "C-x M-r"))))
    (should (eql 'go-goto-imports
		 (key-binding (kbd "C-x i"))))
    (should (eql 'godef-jump
		 (key-binding (kbd "M-."))))))


(ert-deftest test-scame-go-direx ()
  (with-current-buffer (find-file-noselect testsuite-go-filename)
    (should (eql 'go-direx-pop-to-buffer
		 (key-binding (kbd "C-x j"))))))

(ert-deftest test-scame-go-projectile ()
  (with-current-buffer (find-file-noselect testsuite-go-filename)
    (projectile-mode)
    (should (eql 'go-projectile-get
		 (key-binding (kbd "C-c p N"))))))

;; Erlang

(ert-deftest test-scame-erlang ()
  (let ((erlang-file (f-join scame-test/test-path "var/hello.erl")))
    (with-current-buffer (find-file-noselect erlang-file)
      (should (featurep 'erlang)))))


;; OCaml

(ert-deftest test-scame-ocaml ()
  ;;(should (require 'tuareg)))
  (let ((ocaml-file (f-join scame-test/test-path "var/hello.ml")))
    (with-current-buffer (find-file-noselect ocaml-file)
      (should (featurep 'tuareg)))))


;; PHP

(ert-deftest test-scame-php ()
  ;;(should (require 'web-mode)))
  (let ((php-file (f-join scame-test/test-path "var/hello.php")))
    (with-current-buffer (find-file-noselect php-file)
      (should (featurep 'web-mode)))))


;; Scheme

(ert-deftest test-scame-scheme ()
  (let ((guile-file (f-join scame-test/test-path "var/hello.scm")))
    (with-current-buffer (find-file-noselect guile-file)
      (should (featurep 'geiser)))))


;; Perl

(defconst testsuite-perl-filename
  (f-join scame-test/test-path "var/hello.pl")
  "File name for testing python setup.")

(ert-deftest test-scame-perl ()
  (with-current-buffer (find-file-noselect testsuite-perl-filename)
    (should (featurep 'cperl-mode))))

(ert-deftest test-scame-plsense-direx ()
  (with-current-buffer (find-file-noselect testsuite-perl-filename)
    (should (eql 'plsense-direx:open-explorer-key
		 (key-binding (kbd "C-x j"))))))

;; Elisp

(ert-deftest test-scame-elisp ()
  ;;(should (require 'elisp))
  (let ((elisp-file (f-join scame-test/test-path "var/hello.el")))
    (with-current-buffer (find-file-noselect elisp-file)
      (should (featurep 'eldoc))
      (should (featurep 'elisp-slime-nav))
      (should (featurep 'ielm))
      (should (featurep 'erefactor)))))


;; Haskell

(ert-deftest test-scame-haskell ()
  (let ((haskell-file (f-join scame-test/test-path "var/hello.hs")))
    (with-current-buffer (find-file-noselect haskell-file)
      (should (featurep 'haskell-mode)))))


;; Clojure

(ert-deftest test-scame-clojure ()
  (let ((clojure-file (f-join scame-test/test-path "var/hello.clj")))
    (with-current-buffer (find-file-noselect clojure-file)
      (should (featurep 'cider))
      (should (featurep 'company-cider))
      (should (featurep 'clj-refactor)))))


;; Ruby

(ert-deftest test-scame-ruby ()
  (let ((ruby-file (f-join scame-test/test-path "var/hello.rb")))
    (with-current-buffer (find-file-noselect ruby-file)
      (should (featurep 'rvm))
      (should (featurep 'ruby-tools))
      (should (featurep 'inf-ruby))
      (should (featurep 'ruby-mode))
      (should (featurep 'company-inf-ruby))
      (should (eql 'inf-ruby (key-binding (kbd "C-c r r")))))))


;; C/C++

(ert-deftest test-scame-c ()
  (let ((c-file (f-join scame-test/test-path "var/hello.c")))
    (with-current-buffer (find-file-noselect c-file)
      (should (featurep 'google-c-style))
      (should (featurep 'auto-complete-c-headers))
      (should (featurep 'c-eldoc))
      (should (= 4 c-basic-offset))
      (should (string-equal "google" c-indentation-style))
      (should (= 120 c-eldoc-buffer-regenerate-time)))))

(ert-deftest test-scame-cpp ()
  (let ((cpp-file (f-join scame-test/test-path "var/hello.cpp")))
    (with-current-buffer (find-file-noselect cpp-file)
      (should (featurep 'google-c-style))
      (should (featurep 'auto-complete-c-headers))
      (should (featurep 'c-eldoc))
      (should (= 2 c-basic-offset))
      (should (string-equal "google" c-indentation-style))
      (should (= 120 c-eldoc-buffer-regenerate-time)))))

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
