# gotest.el

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






## Development

### Cask

``gotest.el`` use [Cask][] for dependencies management. Install it and
retrieve dependencies :

    $ curl -fsSkL https://raw.github.com/cask/cask/master/go | python
    $ export PATH="$HOME/.cask/bin:$PATH"
    $ cask


### Testing

* Launch unit tests from shell

    $ make clean test

* Using [overseer][] :

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c , t</kbd>   | launch unit tests from buffer
<kbd>C-c , b</kbd>   | launch unit tests
<kbd>C-c , g</kbd>   | launch unit tests with tag (find, regexp, ...)

* Tips:

If you want to launch a single unit test, add a specify tag :

```lisp
(ert-deftest test-foobar ()
  :tags '(current)
  ```

And launch it using : <kbd>C-c , g</kbd> and specify tag : *current*


## Support / Contribute

See [here](CONTRIBUTING.md)


## Changelog

A changelog is available [here](ChangeLog.md).


## License

See [LICENSE](LICENSE).


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
