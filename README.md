# Scame

[![License GPL 3][badge-license]][LICENSE]
[![GitHub version](https://badge.fury.io/gh/nlamirault%2Fscame.svg)](https://badge.fury.io/gh/nlamirault%2Fscame)


Master :
* [![Circle CI](https://circleci.com/gh/nlamirault/scame/tree/master.svg?style=svg)](https://circleci.com/gh/nlamirault/scame/tree/master)

Develop:
* [![Circle CI](https://circleci.com/gh/nlamirault/scame/tree/develop.svg?style=svg)](https://circleci.com/gh/nlamirault/scame/tree/develop)


[Scame][] is a 'Starter Kit' for [GNU Emacs][] 24 (>= 24.4). It will not work
with [GNU Emacs][] 23 and below, or with other flavors of Emacs (e.g. XEmacs).

The current version has been tested on Linux and Mac OS X.

You could find documentation [here](http://nlamirault.github.io/scame/scame.html)


## Support

Feel free to ask question or make suggestions in our [Issue Tracker][].


## Contribute

See [here](CONTRIBUTING.md)


## Development

The `test` command download dependencies using [Cask][] and launch unit tests:

    $ make test

You could lau some unit tests using tags :

    $ make test-tag tag=config


## License

See [LICENSE][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[scame]: https://github.com/nlamirault/scame
[badge-license]: https://img.shields.io/badge/license-GPL_2-green.svg?style=flat
[LICENSE]: https://github.com/nlamirault/scame/blob/master/LICENSE

[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[Issue tracker]: https://github.com/nlamirault/scame/issues

[overseer]: https://github.com/tonini/overseer.el
