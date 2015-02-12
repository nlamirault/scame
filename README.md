# Scame

[![License GPL 3][badge-license]][COPYING]
![Version][badge-release]
[![travis][badge-travis]][travis]
[![drone][badge-drone]][drone]
[![Coverage Status](https://coveralls.io/repos/nlamirault/scame/badge.png)](https://coveralls.io/r/nlamirault/scame)

[Scame][] is a 'Starter Kit' for [GNU Emacs][] 24 (>= 24.4). It will not work
with [GNU Emacs][] 23 and below, or with other flavors of Emacs (e.g. XEmacs).

These tools are used to perform the [Scame][] installation :

- [Cask][] (>= 0.6.0)
- [EVM][]

The current version has been tested on Linux and Mac OS X.


## Installation

### From release file

* Download archive :

        $ wget https://github.com/nlamirault/scame/releases/download/0.12.0/scame-0.12.0.tar.gz

* Installation :

        $ tar zxvf scame-0.12.0.tar.gz
        $ cp -r scame-0.12.0/* ~/.emacs.d


### From Docker

* Run using Docker :

        $ docker pull nlamirault/scame:0.12.0
        $ docker run -it --rm=true nlamirault/scame:0.12.0 -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix emacs-snapshot


### From source

* Clone the repository :

        $ rm -r ~/.emacs.d && mkdir -p ~/.emacs.d/scame
        $ git clone https://github.com/nlamirault/scame

* Installation :

        $ cp -r scame/src/* ~/.emacs.d/
        $ cd ~/.emacs.d && cask install

### Using Docker

* Search from registry the Scame image :

        $ docker search scame

* Download the Scame image :

        $ docker pull nlamirault/scame

* Launch Scame image :

        $ docker run -i -t nlamirault/scame


## Packages

Collections of packages installed:

- [cask](https://github.com/cask/cask)
- [use-package](https://github.com/jwiegley/use-package)
- [init-loader](https://github.com/emacs-jp/init-loader)
- [paradox](https://github.com/Bruce-Connor/paradox)

Interface Enhancement:
- [helm](https://github.com/emacs-helm/helm)
- [smex](https://github.com/nonsequitur/smex)
- [guide-key](https://github.com/kai2nenobu/guide-key)

File manager:
- [direx.el](https://github.com/m2ym/direx-el)
- [dired-imenu](https://github.com/DamienCassou/dired-imenu)
- [dired-filter](https://github.com/Fuco1/dired-hacks)
- [dired-open](https://github.com/Fuco1/dired-hacks)
- [dired-subtree](https://github.com/Fuco1/dired-hacks)
- [sr-speedbar](http://www.emacswiki.org/emacs/SrSpeedbar)
- [neotree](http://www.emacswiki.org/emacs/NeoTree)

Navigation:
- [imenu-anywhere](https://github.com/vitoshka/imenu-anywhere)
- [helm-swoop](https://github.com/ShingoFukuyama/helm-swoop)

Project managment :
- [projectile][]
- [persp-projectile](https://github.com/bbatsov/projectile)
- [project-explorer](https://github.com/sabof/project-explorer)
- [nav](https://code.google.com/p/emacs-nav/)
- [lice.el](https://github.com/buzztaiki/lice-el)
- [perspective][]
- [prodigy.el](https://github.com/rejeep/prodigy.el)

Python :
- [jedi](https://github.com/tkf/emacs-jedi)
- [jedi-direx](https://github.com/tkf/emacs-jedi-direx)
- [elpy](https://github.com/jorgenschaefer/elpy)
- [virtualenvwrapper](https://github.com/porterjamesj/virtualenvwrapper.el)
- [anaconda-mode](https://github.com/proofit404/anaconda-mode)
- [sphinx-doc](https://github.com/naiquevin/sphinx-doc.el)
- [tox.el](https://github.com/chmouel/tox.el)

Common Lisp:
- [sly](https://github.com/capitaomorte/sly)

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

Error checking:
- [flycheck](https://github.com/flycheck/flycheck)

Productivity:
- [Org](http://orgmode.org)
- [calfw](https://github.com/kiwanami/emacs-calfw)

Completion:
- [auto-complete](http://cx4a.org/software/auto-complete/)
- [company-mode](http://company-mode.github.io/)
- [helm-company](https://github.com/yasuyk/helm-company)

Version Control:
- [magit](https://github.com/magit/magit)

Search:
- [helm-ack](https://github.com/syohex/emacs-helm-ack)
- [helm-ag](https://github.com/syohex/emacs-helm-ag)

Appearence:
- [powerline](https://github.com/milkypostman/powerline)

Console:
- [multi-term](http://www.emacswiki.org/emacs/multi-term.el)

Mail
- [gnus](http://www.gnus.org/)
- [bbdb](https://github.com/emacsmirror/bbdb)
- [google-contacts](https://julien.danjou.info/projects/emacs-packages#google-contacts)

Theme:
- [moe-theme](https://github.com/kuanyui/moe-theme.el)
- [zenburn-theme](https://github.com/bbatsov/zenburn-emacs)
- [color-theme-sanityinc-tomorrow]()
- [noctilux-theme](https://github.com/stafu/noctilux-theme)
- [afternoon-theme](https://github.com/osener/emacs-afternoon-theme)
- [ample-theme](https://github.com/jordonbiondo/ample-theme)
- [subatomic-theme](https://github.com/cryon/subatomic)
- [monokai-theme](https://github.com/oneKelvinSmith/monokai-emacs)

## Keymap

### Global

Keybinding             | Description
---------------------  |------------------------------------------------------------
<kbd>C-c l</kbd>       | List packages from Melpa.
<kbd>C-c w</kbd>       | Launch eww
<kbd>C-c C-j</kbd>     | direx:jump-to-directory
<kbd>C-.</kbd>         | imenu-anywhere
<kbd>C-c t</kbd>       | launch terminal
<kbd>C-x r</kbd>       | key bindings are automatically popped up after a short delay
<kbd>C-c <left></kbd>  | Select the window to the left of the current one
<kbd>C-c <right></kbd> | Select the window to the right of the current one
<kbd>C-c <up></kbd>    | Select the window to the up of the current one
<kbd>C-c <down></kbd>  | Select the window to the down of the current one

### UI

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-down</kbd>    | Scroll line down
<kbd>C-up </kbd>     | Scroll line up


### Helm

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x h F</kbd>   | helm-find-files
<kbd>C-x h f</kbd>   | helm-for-files
<kbd>C-x h b</kbd>   | helm-buffers-list
<kbd>C-x h x</kbd>   | helm-M-x
<kbd>C-x h y</kbd>   | helm-show-kill-ring
<kbd>C-x h i</kbd>   | helm-imenu

### Swoop

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-o</kbd>       | Swoop
<kbd>C-M-o</kbd>     | Swoop-multi
<kbd>M-o</kbd>       | Swoop-pcre-regexp

### Smex

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x M-x</kbd>   | smex
<kbd>C-x M-X</kbd>   | smex-major-mode-commands


### Projectile

See [projectile][] for default keybindings

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c p h</kbd>   | helm-projectile

### Python-mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x y t</kbd>   | launch current unit test
<kbd>C-x y f</kbd>   | launch tests in current file
<kbd>C-c M-d</kbd>   | generate Sphinx documentation for current function
<kbd>C-c ! C-c</kbd> | check syntax in the current buffer
<kbd>C-x y d</kbd>   | helm-pydoc

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
<kbd>C-c C-a<kbd>    | prompt you for an import path

### PHP Mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x p t</kbd>   | launch current unit test
<kbd>C-x p f</kbd>   | launch tests in current file
<kbd>C-x p p</kbd>   | launch tests in all project


### Perl Mode

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-x e d</kbd>   | helm-perldoc


### Ruby

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-'</kbd>       | Convert symbol to simple quote string
<kbd>C-"</kbd>       | Convert symbol to double quote string
<kbd>C-:</kbd>       | Convert string to symbol
<kbd>C-;</kbd>       | Clear string content

### Git

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c g s</kbd>   | magit-status
<kbd>C-c g d</kbd>   | magit-pull
<kbd>C-c g p</kbd>   | magit-push
<kbd>C-c g l</kbd>   | magit-log
<kbd>C-c g b</kbd>   | magit-branch-manager
<kbd>C-c g m</kbd>   | Turn on/off git-gutter+-mode globally
<kbd>C-c g <</kbd>   | git-gutter+-previous-hunk
<kbd>C-c g ></kbd>   | git-gutter+-next-hunk

### Perspective

See [perspective][]

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

### Gnus / BBDB

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c m g</kbd>   | Launch Gnus using GMail setup
<kbd>C-c m e</kbd>   | Launch Gnus using Exchange setup
<kbd>C-c m o</kbd>   | Launch Gnus using offlineimap
<kbd>C-c d s</kbd>   | bbdb
<kbd>C-c d n</kbd>   | bbdb-search-name
<kbd>C-c d m</kbd>   | bbdb-search-mail
<kbd>C-c d h</kbd>   | helm-bbdb

### IRC / IM

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c i c</kbd>   | Launch IRC mode
<kbd>C-c i j</kbd>   | Jabber connect all
<kbd>C-c i o</kbd>   | Jabber disconnect
<kbd>C-c i i</kbd>   | Jabber chat with
<kbd>C-c i r</kbd>   | Jabber display roster

### Org

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c o a</kbd>   | org-agenda
<kbd>C-c o b</kbd>   | org-iswitchb
<kbd>C-c o l</kbd>   | org-store-link

### Encryption

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c c f</kbd>   | Encrypt file
<kbd>C-c c F</kbd>   | Decrypt file
<kbd>C-c c r</kbd>   | Encrypt region
<kbd>C-c c R</kbd>   | Decrypt region
<kbd>C-c c l</kbd>   | List keys

### Scame mode

Keybinding            | Description
----------------------|------------------------------------------------------------
<kbd>C-c s v</kbd>    | Display Scame version
<kbd>C-c s z</kbd>    | Open the Scame user customization file
<kbd>C-c s s g</kbd>  | Search on Google
<kbd>C-c s s h</kbd>  | Search on Github
<kbd>C-c s s t</kbd>  | Search on Twitter
<kbd>C-c s s a</kbd>  | Search on Arch AUR
<kbd>C-c s l c</kbd>  | Launch calc
<kbd>C-c s l t</kbd>  | Launch terminal
<kbd>C-c s l h</kbd>  | Launch proced (htop)
<kbd>C-c s l p</kbd>  | Launch list MELPA packages using Paradox
<kbd>C-c s l m</kbd>  | Launch man page
<kbd>C-c s c g</kbd>  | Display Google calendar
<kbd>C-c s c w</kbd>  | Display work calendar
<kbd>C-c s c d</kbd>  | Display diary calendar
<kbd>C-c s c o</kbd>  | Display Org calendar


If you ever forget any of Scame's keybindings just do a:
<kbd>C-c s C-h</kbd>

You can change the default keymap prefix C-c p like this:

```el
(setq scame-keymap-prefix (kbd "C-c C-s"))
```

## Mail

### GMail: Imap

Using <kbd>C-c m g</kbd>, Gnus is starting using a GMail configuration
(IMAP)

### Exchange

Using <kbd>C-c m e</kbd>, Gnus is starting using for a Microsoft Exchange
mail account.

### Offlineimap / MSMTP

Using <kbd>C-c m o</kbd>, Gnus is starting using your `offlineimap` and `msmtp`
configuration.


## Calendars

To setup a Google calendar set the `google-ical-calendar` variable using
private ics URI.


## Customization

If file `$HOME/.config/scame/scame-user.el` exists, [Scame][] load it.
Example of customization :

```el
;; User
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")

;; Calendars
(setq google-ical-calendar "https://www.google.com/calendar/ical/........")

;; UI
(load-theme 'monokai t)

;; Fonts
(custom-set-faces
 '(default ((t (:family "Bitstream Vera Sans Mono"
                        :foundry "bitstream"
                        :slant normal
                        :weight normal
                        :height 81
                        :width normal)))))

```

## Vendoring

If directory `$HOME/.emacs.d/vendor` exists, [Scame][] will add to load-path
each directory in this directory.


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

The `local-test` command use your Scame installation and current dependencies t

    $ make local-test

The `test` command download dependencies using [Cask][] and use your personal Emacs configuration :

    $ make test

The integration tests make an Emacs sandbox, install all dependencies using [Cask][], and launch tests :

    $ make integration-test

A [Docker][] container could be used to launch unit tests:

    $ make docker-build docker-test


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
[badge-release]: https://img.shields.io/github/release/nlamirault/scame.svg
[travis]: https://travis-ci.org/nlamirault/scame
[badge-travis]: http://img.shields.io/travis/nlamirault/scame.svg?style=flat
[badge-drone]: https://drone.io/github.com/nlamirault/scame/status.png
[drone]: https://drone.io/github.com/nlamirault/scame/latest

[COPYING]: https://github.com/nlamirault/scame/blob/master/COPYING
[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[Cask]: http://cask.github.io/
[Evm]: https://github.com/rejeep/evm
[Issue tracker]: https://github.com/nlamirault/scame/issues

[projectile]: https://github.com/bbatsov/projectile
[perspective]: https://github.com/nex3/perspective-el
[Docker]: http://www.docker.com
