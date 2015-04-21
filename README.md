# Scame

[![License GPL 3][badge-license]][LICENSE]
[![travis][badge-travis]][travis]
[![drone][badge-drone]][drone]
[![Coverage Status](https://coveralls.io/repos/nlamirault/scame.el/badge.png?branch=master)](https://coveralls.io/r/nlamirault/scame.el?branch=master)

[Scame][] is a 'Starter Kit' for [GNU Emacs][] 24 (>= 24.4). It will not work
with [GNU Emacs][] 23 and below, or with other flavors of Emacs (e.g. XEmacs).

These tools are used to perform the [Scame][] installation :

- [Cask][] (>= 0.6.0)
- [EVM][]

The current version has been tested on Linux and Mac OS X.


- [Installation](#installation)
  - [Release file](#from-release-file)
  - [Source](#from-source)
  - [Docker](#from-docker)
- [Keymap](#keymap)
- [Mail](#mail)
- [Calendars](#calendars)
- [Customization](#customization)
- [Vendoring](#vendoring)
- [Debug](#debug)
- [Support](#support)
- [Contribute](#contribute)
- [Development](#development)
- [License](#license)
- [ChangeLog](#changelog)
- [Contact](#contact)

## Installation

### From release file

* Download archive :

        $ wget https://github.com/nlamirault/scame/releases/download/1.0.0/scame-1.0.0.tar.gz

* Installation :

        $ tar zxvf scame-1.0.0.tar.gz
        $ cp -r scame-1.0.0/* ~/.emacs.d


### From source

* Clone the repository :

        $ rm -r ~/.emacs.d && mkdir -p ~/.emacs.d/scame
        $ git clone https://github.com/nlamirault/scame

* Installation :

        $ cp -r scame/src/* ~/.emacs.d/
        $ cd ~/.emacs.d && cask install

### From Docker

* Search from registry the Scame image :

        $ docker search scame

* Download the Scame image :

        $ docker pull nlamirault/scame:1.0.0

* Launch Scame image :

        $ docker run -it --rm=true nlamirault/scame:1.0.0 -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix emacs-snapshot


## Keymap

### UI

Keybinding             | Description
-----------------------|------------------------------------------------------------
<kbd>C-down</kbd>      | Scroll line down
<kbd>C-up </kbd>       | Scroll line up
<kbd>C-c <left></kbd>  | Select the window to the left of the current one
<kbd>C-c <right></kbd> | Select the window to the right of the current one
<kbd>C-c <up></kbd>    | Select the window to the up of the current one
<kbd>C-c <down></kbd>  | Select the window to the down of the current one


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
<kbd>C-c p s w</kbd> | projectile-persp-switch-project

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
<kbd>C-c s SPC</kbd>  | Hydra Scame keybindings
<kbd>C-c s P</kbd>    | Hydra projectile
                      |
<kbd>C-c s v</kbd>    | Display Scame version
<kbd>C-c s z</kbd>    | Open the Scame user customization file
<kbd>C-c s G</kbd>    | Search on Google
<kbd>C-c s H</kbd>    | Search on Github
<kbd>C-c s T</kbd>    | Search on Twitter
<kbd>C-c s S</kbd>    | Search on Stackoverflow
<kbd>C-c s W</kbd>    | Search on Wikipedia
<kbd>C-c s R</kbd>    | Search on RFCs
<kbd>C-c s M</kbd>    | Mail (Gnus) using GMail setup
<kbd>C-c s E</kbd>    | Mail (Gnus) using Exchange setup
<kbd>C-c s L</kbd>    | Mail (Gnus) using local IMAP server
<kbd>C-c s a</kbd>    | Launch calc
<kbd>C-c s t</kbd>    | Launch terminal
<kbd>C-c s h</kbd>    | Launch proced (htop)
<kbd>C-c s p</kbd>    | Launch list MELPA packages using Paradox
<kbd>C-c s m</kbd>    | Launch man page
<kbd>C-c s g</kbd>    | Display Google calendar
<kbd>C-c s w</kbd>    | Display work calendar
<kbd>C-c s d</kbd>    | Display diary calendar
<kbd>C-c s o</kbd>    | Display Org calendar


If you ever forget any of Scame's keybindings just do a:
<kbd>C-c s C-h</kbd>

You can change the default keymap prefix <kbd>C-c s</kbd> like this:

```el
(setq scame-keymap-prefix (kbd "C-c C-s"))
```


## Mail

[Scame][] provides a Gmail configuration for IMAP access.


## Calendars

To setup a Google calendars set the `google-ical-calendars` variable using
private ics URI.

```el
(setq google-ical-calendars
      '(("https://www.google.com/calendar/ical/xxxxxxxxx/basic.ics"
         "Mine"
         "LightBlue")
        ("https://www.google.com/calendar/ical/xxxxxxxxxx/basic.ics"
         "Family"
         "Yellow")
        ("https://www.google.com/calendar/ical/xxxxxxxxx/basic.ics"
         "Work"
         "White")))
```


## Customization

If file `$HOME/.config/scame/scame-user.el` exists, [Scame][] load it.
Example of customization :

```el
;; User
(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")

;; Calendars
(setq google-ical-calendar
      (setq google-ical-calendars
      '(("https://www.google.com/calendar/ical/.../basic.ics" "Mine" "LightBlue")
        ("https://www.google.com/calendar/ical/.../basic.ics" "Family" "Yellow")
        ("https://www.google.com/calendar/ical/.../basic.ics" "Work" "Green")))

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



## Support

Feel free to ask question or make suggestions in our [Issue Tracker][].


## Contribute

See [here](CONTRIBUTING.md)


## Development

The `test` command download dependencies using [Cask][] and launch unit tests:

    $ make test


## License

See [LICENSE][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>





[scame]: https://github.com/nlamirault/scame

[badge-license]: https://img.shields.io/badge/license-GPL_2-green.svg?style=flat
[LICENSE]: https://github.com/nlamirault/scame/blob/master/LICENSE
[travis]: https://travis-ci.org/nlamirault/scame
[badge-travis]: http://img.shields.io/travis/nlamirault/scame.svg?style=flat
[badge-drone]: https://drone.io/github.com/nlamirault/scame/status.png
[drone]: https://drone.io/github.com/nlamirault/scame/latest

[COPYING]: https://github.com/nlamirault/scame/blob/master/COPYING
[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[Issue tracker]: https://github.com/nlamirault/scame/issues

[Cask]: http://cask.github.io/
[Evm]: https://github.com/rejeep/evm
[overseer]: https://github.com/tonini/overseer.el
