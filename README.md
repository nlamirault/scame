# Scame

[![travis][badge-travis]][travis]
[![drone][badge-drone]][drone]
[![Coverage Status](https://coveralls.io/repos/nlamirault/scame/badge.png)](https://coveralls.io/r/nlamirault/scame)

The current version has been tested on Linux and Mac OS X.

- [Installation](#installation)
  - [Release file](#from-release-file)
  - [Source](#from-source)
  - [Docker](#from-docker)
- [Packages](#packages)
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

        $ wget https://github.com/nlamirault/scame/releases/download/0.13.0/scame-0.13.0.tar.gz

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
<kbd>C-c s s s</kbd>  | Search on Stackoverflow
<kbd>C-c s s w</kbd>  | Search on Wikipedia
<kbd>C-c s s r</kbd>  | Search on RFCs
<kbd>C-c s m g</kbd>  | Mail (Gnus) using GMail setup
<kbd>C-c s m e</kbd>  | Mail (Gnus) using Exchange setup
<kbd>C-c s m o</kbd>  | Mail (Gnus) using offlineimap
<kbd>C-c s m m</kbd>  | Mail (Gnus) using offlineimap for GMail
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

See [doc/Mail.md][].

### GMail: Imap

Using <kbd>C-c s m g</kbd>, Gnus is starting using a GMail configuration
(IMAP)

### Exchange

Using <kbd>C-c s m e</kbd>, Gnus is starting using for a Microsoft Exchange
mail account.

### Offlineimap / MSMTP

Using <kbd>C-c s m o</kbd>, Gnus is starting using your `offlineimap` and `msmtp`
configuration.

You

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
`̀`


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
