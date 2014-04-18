# Scame

[![Build Status](https://drone.io/github.com/nlamirault/scame/status.png)](https://drone.io/github.com/nlamirault/scame/latest)

[![Build Status](https://travis-ci.org/nlamirault/scame.svg?branch=master)](https://travis-ci.org/nlamirault/scame)

*Scame* is a 'Starter Kit' for Emacs.
This mode needs [GNU Emacs 24](http://wikemacs.org/wiki/Installing_Emacs). It will not work with GNU Emacs 23 and below,
or with other flavors of Emacs (e.g. XEmacs).

These tools are used to perform the *scame* installation :

- [Cask](https://github.com/cask/cask) (>= 0.6.0)
- [EVM](https://github.com/rejeep/evm)


## Installation

* Clone the repository :

        $ git clone https://github.com/nlamirault/scame

* Help

		$ ./scame -h
		usage: scame [options]

		An Emacs installation tool.

		optional arguments:
			-h, --help     show this help message and exit
			--init         Initialize Scame
			--cmd CMD      Scame CLI commands
			--emacs EMACS  Specify the version of Emacs to install

* Initialize Scame :

        $ ./scame --init

* Using Scame :

        $ ./scame --cmd=cleanup
		$ ./scame --cmd=install
		$ ./scame --cmd=update


## Packages

Collections of packages installed by *Scame*:

- [cask](https://github.com/cask/cask)
- [init-loader](https://github.com/emacs-jp/init-loader)

Project managment :
- [projectile](https://github.com/bbatsov/projectile)
- [project-explorer](https://github.com/sabof/project-explorer)
- [nav](https://code.google.com/p/emacs-nav/)
- [lice.el](https://github.com/buzztaiki/lice-el)
- [cerbere](https://github.com/nlamirault/cerbere)
- [perspective](https://github.com/nex3/perspective-el)

Python :
- [jedi](https://github.com/tkf/emacs-jedi)
- [elpy](https://github.com/jorgenschaefer/elpy)
- [virtualenvwrapper](https://github.com/porterjamesj/virtualenvwrapper.el)
- [anaconda-mode](https://github.com/proofit404/anaconda-mode)

Go:
- [go-mode](http://melpa.milkbox.net/#/go-mode)
- [go-play](https://github.com/dominikh/go-play.el)
- [go-autocomplete](https://github.com/nsf/gocode)
- [go-eldoc](https://github.com/syohex/emacs-go-eldoc)

Emacs lisp:
- [elisp-slime-nav](https://github.com/purcell/elisp-slime-nav)
- [erefactor](https://github.com/mhayashi1120/Emacs-erefactor)

Ruby:
- [ruby-mode](http://www.emacswiki.org/emacs/RubyMode)
- [rvm](https://github.com/senny/rvm.el)
- [rhtml-mode](https://github.com/eschulte/rhtml)
- [ruby-tools](https://github.com/rejeep/ruby-tools.el)
- [inf-ruby](https://github.com/nonsequitur/inf-ruby)
- [company-inf-ruby](https://github.com/company-mode/company-inf-ruby)

Php:
- [web-mode](http://www.web-mode.org)
- [emacsagist](https://github.com/echosa/emacsagist)

Clojure:
- [cider](http://melpa.milkbox.net/#/cider)

Scheme:
- [Geiser](https://github.com/jaor/geiser)

Erlang:
- [Erlang](https://github.com/erlang/otp)

Haskell:
- [Haskell-mode](https://github.com/haskell/haskell-mode)
- [flycheck-haskell](https://github.com/flycheck/flycheck-haskell)

Cloud:
- [puppet-mode](https://github.com/lunaryorn/puppet-mode)
- [dockerfile-mode](https://github.com/spotify/dockerfile-mode)
- [vagrant](https://github.com/ottbot/vagrant.el)

Syntax :
- [flycheck](https://github.com/flycheck/flycheck)

Productivity:
- [Org](http://orgmode.org)
- [calfw](https://github.com/kiwanami/emacs-calfw)

Completion:
- [helm]()
- [auto-complete](http://cx4a.org/software/auto-complete/)
- [company-mode](http://company-mode.github.io/)
- [helm-company](https://github.com/yasuyk/helm-company)

I/O:
- [direx.el](https://github.com/m2ym/direx-el)
- [dired-imenu](https://github.com/DamienCassou/dired-imenu)

VC:
- [magit](https://github.com/magit/magit)

Misc:
- [sr-speedbar](http://www.emacswiki.org/emacs/SrSpeedbar)
- [prodigy.el](https://github.com/rejeep/prodigy.el)
- [swoop](https://github.com/ShingoFukuyama/emacs-swoop)
- [powerline](https://github.com/milkypostman/powerline)
- [multi-term](http://www.emacswiki.org/emacs/multi-term.el)


## Keymap

### Global

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c l</kbd>     | List packages from Melpa.
<kbd>C-down</kbd>    | Scroll line down
<kbd>C-up </kbd>     | Scroll line up
<kbd>C-c w</kbd>     | Launch eww
<kbd>C-o</kbd>       | Swoop
<kbd>C-M-o</kbd>     | Swoop-multi
<kbd>M-o</kbd>       | Swoop-pcre-regexp
<kbd>C-c C-j</kbd>   | direx:jump-to-directory
<kbd>C-c M-f</kbd>   | helm-find-files
<kbd>C-c b</kbd>     | helm-buffer-list
<kbd>C-c t</kbd>     | launch-term
<kbd>M-x</kbd>       | smex
<kbd>M-X</kbd>       | smex-major-mode-commands
<kbd>C-.</kbd>       | imenu-anywhere

### Python-mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x t</kbd>     | tox-current-test
<kbd>C-x c</kbd>     | tox-current-class

### Go mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x C-r</kbd>   | go-remove-unused-imports
<kbd>C-x i</kbd>     | go-goto-imports
<kbd>C-x t</kbd>     | go-test-current-test
<kbd>C-x c</kbd>     | go-test-current-file

### PHP Mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x t</kbd>     | php-current-test
<kbd>C-x c</kbd>     | php-current-class
<kbd>C-x p</kbd>     | php-current-project

### Magit

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c g s</kbd>   | magit-status
<kbd>C-c g d</kbd>   | magit-pull
<kbd>C-c g p</kbd>   | magit-push
<kbd>C-c g l</kbd>   | magit-log
<kbd>C-c g b</kbd>   | magit-branch-manager

### Org

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c o a</kbd>   | org-agenda
<kbd>C-c o b</kbd>   | org-iswitchb
<kbd>C-c o l</kbd>   | org-store-link

### Perspective (Default key bindings)

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x x s</kbd>   | persp-switch
<kbd>C-x x n</kbd>   | persp-next
<kbd>C-x x p</kbd>   | persp-prev
<kbd>C-x x c</kbd>   | persp-kill

### Scame mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c s v</kbd>   | Display Scame version
<kbd>C-c s c</kbd>   | Show Scame changelog
<kbd>C-c s z</kbd>   | Open the Scame user customization file


If you ever forget any of Scame's keybindings just do a:
<kbd>C-c s C-h</kbd>

You can change the default keymap prefix C-c p like this:

```lisp
(setq scame-keymap-prefix (kbd "C-c C-s"))
```

## Customization

If file `$HOME/.config/scame/scame-user.el` exists, *scame* will be loaded.
Example of customization :

```lisp
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")
(load-theme 'monokai t)
```

## Debug

You could keep track of where time is being spent during Emacs startup in
order to optimize startup times with [benchmark-init](https://github.com/dholm/benchmark-init-el).

```lisp
M-x benchmark-init/show-durations-tree
Benchmark results

╼►[benchmark-init/root nil 0ms]
  ├─[vc-git load 20ms]
  ├─[company-dabbrev require 6ms]
  ├─[company-capf require 5ms]
  ├─[company-cmake require 5ms]
  ├─[company-ropemacs require 5ms]
  ├─[company-clang require 6ms]
  ├─[company-eclim require 5ms]
  │ ╰─[company-template require 5ms]
  ├─[default load 11ms]
  ├─[~/.config/scame/scame-user.el load 491ms]
  ├─[linux-config load 1ms]
  ├─[99_global_keys load 1ms]
  ...
```


## Support / Contribute

See [here](CONTRIBUTING.md)


## License

Scame is released under the [MIT License](LICENSE)


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
