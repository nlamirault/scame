# Scame

[![Build Status](https://drone.io/github.com/nlamirault/scame/status.png)](https://drone.io/github.com/nlamirault/scame/latest)

*Scame* is a 'Starter Kit' for Emacs.
This mode needs [GNU Emacs 24](http://wikemacs.org/wiki/Installing_Emacs). It will not work with GNU Emacs 23 and below,
or with other flavors of Emacs (e.g. XEmacs).

These tools are used to perform the *scame* installation :

- [Cask](https://github.com/cask/cask)
- [EVM](https://github.com/rejeep/evm)


## Installation

### Automated

By default, *Scame* install a git snapshot version of Emacs.
You can install via the command line with curl:

	curl -L https://raw.github.com/nlamirault/scame/master/scame | python


### Manual

Using command line arguments, you can specify another version of Emacs.

    $ git clone https://github.com/nlamirault/scame
    $ ./scame -h
	usage: scame [options]
	An Emacs installation tool.
	optional arguments:
		-h, --help     show this help message and exit
		--version      show program's version number and exit
		--cleanup      Destroy or not Scame, Evm and Cask directories
		--emacs EMACS  Specify the version of Emacs to install

## Packages

Collections of packages installed by *Scame*:

- [cask](https://github.com/cask/cask)
- [init-loader](https://github.com/emacs-jp/init-loader)

- [projectile](https://github.com/bbatsov/projectile)
- [project-explorer](https://github.com/sabof/project-explorer)

Python :
- [jedi](https://github.com/tkf/emacs-jedi)
- [dlpy](https://github.com/jorgenschaefer/elpy)
- [virtualenvwrapper](https://github.com/porterjamesj/virtualenvwrapper.el)
- [tox]()

Go:
- [go-mode](http://melpa.milkbox.net/#/go-mode)
- [go-play](https://github.com/dominikh/go-play.el)
- [go-autocomplete](https://github.com/nsf/gocode)
- [go-eldoc](https://github.com/syohex/emacs-go-eldoc)

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
<kbd>C-<down></kbd>  | Scroll line down
<kbd>C-<up></kbd>    | Scroll line up
<kbd>C-c w</kbd>     | Launch eww


### Scame mode

<kbd>C-c v</kbd>     | Display Scame version
<kbd>C-c c</kbd>     | Show Scame changelog


## Customization

If file `$HOME/.config/scame/user.el` exists, *scame* will be loaded.
Example of customization :

```lisp
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")
(load-theme 'monokai t)
```


## Support / Contribute

Feel free to ask question or make suggestions in the [issue tracker](https://github.com/nlamirault/scame/issues)


## License

Scame is released under the [MIT License](LICENSE)


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
