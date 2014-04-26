;;; scame-config-test.el --- Unit tests for Scame configuration.

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

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
	'(column-number-mode line-number-mode))
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
  (require 'puppet-mode)
  (should (featurep 'puppet-mode)))

(ert-deftest test-scame-vagrant ()
  (require 'vagrant)
  (should (featurep 'vagrant)))

(ert-deftest test-scame-dockerfile-mode ()
  (require 'dockerfile-mode)
  (should (featurep 'dockerfile-mode)))


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

(ert-deftest test-scame-python ()
  (should (require 'python))
  (with-temp-buffer
    (python-mode)
    (should (= 4 python-indent-offset))
    (should (eql nil indent-tabs-mode))))

(ert-deftest test-scame-anaconda ()
  (should (require 'anaconda-mode))
  (should (require 'anaconda-eldoc))
  (should (require 'company-anaconda)))

;; FIXME
;; (ert-deftest test-scame-jedi-direx ()
;;   (should (require 'jedi-direx))
;;   (with-temp-buffer
;;     (python-mode)
;;     (should (eql 'jedi-direx:pop-to-buffer
;; 		 (key-binding (kbd "C-x j"))))))

;; FIXME
(ert-deftest test-scame-sphinx-doc ()
  (should (require 'sphinx-doc))
  (with-temp-buffer
    (python-mode)
    (should (eql 'sphinx-doc
                 (key-binding (kbd "C-c M-d"))))))

;; Common Lisp

(ert-deftest test-scame-slime ()
  (should (string-equal "/usr/bin/sbcl" inferior-lisp-program)))


;; Erlang

(ert-deftest test-scame-erlang ()
  (should (require 'erlang))
  (should (require 'erlang-start)))


;; Go lang

(ert-deftest test-scame-golang ()
  (should (require 'go-mode))
  (should (require 'go-eldoc))
  (should (require 'go-mode-load))
  (with-temp-buffer
    (go-mode)
    (should (eql 'go-remove-unused-imports
		 (key-binding (kbd "C-x M-r"))))
    (should (eql 'go-goto-imports
		 (key-binding (kbd "C-x i"))))
    (should (eql 'godef-jump
		 (key-binding (kbd "M-."))))))


(ert-deftest test-scame-go-direx ()
  (should (require 'go-direx))
  (with-temp-buffer
    (go-mode)
    (should (eql 'go-direx-pop-to-buffer
		 (key-binding (kbd "C-x j"))))))



;; OCaml

(ert-deftest test-scame-ocaml ()
  (should (require 'tuareg)))


;; PHP

(ert-deftest test-scame-web-mode ()
  (should (require 'web-mode)))


;; Scheme

(ert-deftest test-scame-scheme ()
  (should (require 'geiser)))


;; Perl

(ert-deftest test-scame-perl ()
  (should (require 'cperl-mode)))

(ert-deftest test-scame-plsense-direx ()
  (should (require 'plsense-direx))
  (with-temp-buffer
    (cperl-mode)
    (should (eql 'plsense-direx:open-explorer-key
		 (key-binding (kbd "C-x j"))))))



;; Elisp

(ert-deftest test-scame-elisp ()
  ;;(should (require 'elisp))
  (should (require 'eldoc))
  (should (require 'elisp-slime-nav))
  (should (require 'ielm))
  (should (require 'erefactor)))


;; Haskell

(ert-deftest test-scame-haskell ()
(should (require 'haskell-mode)))


;; Clojure

(ert-deftest test-scame-clojure ()
  (should (require 'cider))
  (should (require 'company-cider))
  (should (require 'clj-refactor)))


;; Ruby

(ert-deftest test-scame-ruby ()
  (should (require 'rvm))
  (should (require 'rhtml-mode))
  (should (require 'ruby-tools))
  (should (require 'inf-ruby))
  (should (require 'ruby-mode))
  (should (require 'company-inf-ruby))
  (with-temp-buffer
    (ruby-mode)
    (should (eql 'inf-ruby (key-binding (kbd "C-c r r"))))))


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
