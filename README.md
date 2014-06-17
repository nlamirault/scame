
# Scame

[![License GPL 3][badge-license]][COPYING]
[![travis][badge-travis]][travis]
[![drone][badge-drone]][drone]

[Scame][] is a 'Starter Kit' for [GNU Emacs][] 24. It will not work with [GNU Emacs][] 23 and below, or with other flavors of Emacs (e.g. XEmacs).

These tools are used to perform the [Scame][] installation :

- [Cask][] (>= 0.6.0)
- [EVM][]


## Installation

### From source

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

* Initialize [Scame][] :

        $ ./scame --init

* Using [Scame][] :

        $ ./scame --cmd=cleanup
		$ ./scame --cmd=install
		$ ./scame --cmd=update


### Using Docker

* Search from registry the Scame image :

        $ docker search scame

* Download the Scame image :

        $ docker pull scame

* Launch Scame image :

        $ docker run -i -t scame


## Packages

Collections of packages installed:

- [cask](https://github.com/cask/cask)
- [use-package](https://github.com/jwiegley/use-package)
- [init-loader](https://github.com/emacs-jp/init-loader)

Project managment :
- [projectile](https://github.com/bbatsov/projectile)
- [persp-projectile](https://github.com/bbatsov/projectile)
- [project-explorer](https://github.com/sabof/project-explorer)
- [nav](https://code.google.com/p/emacs-nav/)
- [lice.el](https://github.com/buzztaiki/lice-el)
- [perspective](https://github.com/nex3/perspective-el)

Python :
- [jedi](https://github.com/tkf/emacs-jedi)
- [jedi-direx](https://github.com/tkf/emacs-jedi-direx)
- [elpy](https://github.com/jorgenschaefer/elpy)
- [virtualenvwrapper](https://github.com/porterjamesj/virtualenvwrapper.el)
- [anaconda-mode](https://github.com/proofit404/anaconda-mode)
- [sphinx-doc](https://github.com/naiquevin/sphinx-doc.el)
- [tox.el](https://github.com/chmouel/tox.el)

Go:
- [go-mode](http://melpa.milkbox.net/#/go-mode)
- [go-play](https://github.com/dominikh/go-play.el)
- [go-autocomplete](https://github.com/nsf/gocode)
- [go-eldoc](https://github.com/syohex/emacs-go-eldoc)
- [go-direx](https://github.com/syohex/emacs-go-direx)
- [go-test.el](https://github.com/nlamirault/gotest.el)
- [go-projectile](https://github.com/dougm/go-projectile)
- [company-go](https://github.com/nsf/gocode/tree/master/emacs-company)

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
- [phpunit.el](https://github.com/nlamirault/phpunit.el)

Clojure:
- [cider](http://melpa.milkbox.net/#/cider)

Scheme:
- [Geiser](https://github.com/jaor/geiser)

Erlang:
- [Erlang](https://github.com/erlang/otp)

Haskell:
- [Haskell-mode](https://github.com/haskell/haskell-mode)
- [flycheck-haskell](https://github.com/flycheck/flycheck-haskell)

Perl:
- [plsense-direx](https://github.com/aki2o/plsense-direx)

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
- [dired-filter](https://github.com/Fuco1/dired-hacks)
- [dired-open](https://github.com/Fuco1/dired-hacks)
- [dired-subtree](https://github.com/Fuco1/dired-hacks)

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
<kbd>C-x y t</kbd>   | launch current unit test
<kbd>C-x y f</kbd>   | launch tests in current file
<kbd>C-c M-d</kbd>   | generate Sphinx documentation for current function
<kbd>C-c ! C-c</kbd> | check syntax in the current buffer

### Go mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x g r</kbd>   | go-remove-unused-imports
<kbd>C-x g i</kbd>   | go-goto-imports
<kbd>C-x g j</kbd>   | godef-jump
<kbd>C-x g d</kbd>   | show the go documentation for a given package
<kbd>C-x g t</kbd>   | launch current unit test
<kbd>C-x g f</kbd>   | launch tests in current file
<kbd>C-x g p</kbd>   | launch tests in all project
<kbd>C-x g x</kbd>   | display source code in tree style viewer

### PHP Mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x p t</kbd>   | launch current unit test
<kbd>C-x p f</kbd>   | launch tests in current file
<kbd>C-x p p</kbd>   | launch tests in all project

### Ruby

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-'</kbd>       | Convert symbol to simple quote string
<kbd>C-"</kbd>       | Convert symbol to double quote string
<kbd>C-:</kbd>       | Convert string to symbol
<kbd>C-;</kbd>       | Clear string content

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
<kbd>C-x x k</kbd>   | persp-remove-buffer
<kbd>C-x x a</kbd>   | persp-add-buffer
<kbd>C-x x i</kbd>   | persp-import
<kbd>C-x x r</kbd>   | persp-rename

### Scame mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c s v</kbd>   | Display Scame version
<kbd>C-c s c</kbd>   | Show Scame changelog
<kbd>C-c s z</kbd>   | Open the Scame user customization file


If you ever forget any of Scame's keybindings just do a:
<kbd>C-c s C-h</kbd>

You can change the default keymap prefix C-c p like this:

```el
(setq scame-keymap-prefix (kbd "C-c C-s"))
```

## Customization

If file `$HOME/.config/scame/scame-user.el` exists, [Scame][] load it.
Example of customization :

```el
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")
(load-theme 'monokai t)
```

## Debug

You could keep track of where time is being spent during Emacs startup in
order to optimize startup times with [benchmark-init](https://github.com/dholm/benchmark-init-el).

```el
M-x benchmark-init/show-durations-tree
```

And results :

```el
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


## Support

Feel free to ask question or make suggestions in our [Issue Tracker][].


## Contribute

See [here](CONTRIBUTING.md)


## Development

The unit tests use your personal Emacs configuration (in `$HOME/.emacs.d`).
To run the unit tests:

    $ make test

The integration tests make an Emacs sandbox, install all dependencies using [Cask][], and launch tests.
To run the integration tests:

    $ make integration-test


## License

Scame is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Scame is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

See [COPYING][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[Scame]: https://github.com/nlamirault/scame
[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg?style=flat
[COPYING]: https://github.com/nlamirault/scame/blob/master/COPYING
[travis]: https://travis-ci.org/nlamirault/scame
[badge-travis]: http://img.shields.io/travis/nlamirault/scame.svg?style=flat
[badge-drone]: https://drone.io/github.com/nlamirault/scame/status.png
[drone]: https://drone.io/github.com/nlamirault/scame/latest
[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[Cask]: http://cask.github.io/
[Evm]: https://github.com/rejeep/evm
[Issue tracker]: https://github.com/nlamirault/scame/issues
