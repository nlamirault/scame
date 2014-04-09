# Scame

[![Build Status](https://drone.io/github.com/nlamirault/scame/status.png)](https://drone.io/github.com/nlamirault/scame/latest)

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

- [projectile](https://github.com/bbatsov/projectile)
- [project-explorer](https://github.com/sabof/project-explorer)

Python :
- [jedi](https://github.com/tkf/emacs-jedi)
- [elpy](https://github.com/jorgenschaefer/elpy)
- [virtualenvwrapper](https://github.com/porterjamesj/virtualenvwrapper.el)
- [tox]()

Go:
- [go-mode](http://melpa.milkbox.net/#/go-mode)
- [go-play](https://github.com/dominikh/go-play.el)
- [go-autocomplete](https://github.com/nsf/gocode)
- [go-eldoc](https://github.com/syohex/emacs-go-eldoc)

Php:
- [web-mode](http://www.web-mode.org)
- [phpunit.el](https://github.com/nlamirault/phpunit.el)

Clojure:
- [cider](http://melpa.milkbox.net/#/cider)

Scheme:
- [Geiser](https://github.com/jaor/geiser)

Cloud:
- [puppet-mode](https://github.com/lunaryorn/puppet-mode)
- [dockerfile-mode](https://github.com/spotify/dockerfile-mode)
- [vagrant](https://github.com/ottbot/vagrant.el)

Syntax :
- [flycheck](https://github.com/flycheck/flycheck)

Productivity:
- [Org](http://orgmode.org)
- [calfw](https://github.com/kiwanami/emacs-calfw)

Misc:
- [helm]()
- [auto-complete](http://cx4a.org/software/auto-complete/)
- [company-mode](http://company-mode.github.io/)
- [sr-speedbar](http://www.emacswiki.org/emacs/SrSpeedbar)
- [lice.el](https://github.com/buzztaiki/lice-el)
- [prodigy.el](https://github.com/rejeep/prodigy.el)
- [swoop](https://github.com/ShingoFukuyama/emacs-swoop)
- [powerline](https://github.com/milkypostman/powerline)
- [direx.el](https://github.com/m2ym/direx-el)


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
<kbd>C-x C-j</kbd>   | direx:jump-to-directory
<kbd>C-x M-f</kbd>   | helm-find-files
<kbd>C-x b</kbd>     | helm-buffer-list
<kbd>C-x t</kbd>     | launch-term
<kbd>M-x</kbd>       | smex
<kbd>M-X</kbd>       | smex-major-mode-commands

### Python-mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x t</kbd>     | tox-current-test
<kbd>C-x c</kbd>     | tox-current-class

### Go mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c C-r</kbd>   | go-remove-unused-imports
<kbd>C-c i</kbd>     | go-goto-imports


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

### Scame mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c s v</kbd>   | Display Scame version
<kbd>C-c s c</kbd>   | Show Scame changelog


If you ever forget any of Scame's keybindings just do a:
<kbd>C-c s C-h</kbd>

You can change the default keymap prefix C-c p like this:

```lisp
(setq scame-keymap-prefix (kbd "C-c C-s"))
```

## Customization

If file `$HOME/.config/scame/user.el` exists, *scame* will be loaded.
Example of customization :

```lisp
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")
(load-theme 'monokai t)
```


## Support / Contribute

See [here](CONTRIBUTING.md)


## License

Scame is released under the [MIT License](LICENSE)


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
