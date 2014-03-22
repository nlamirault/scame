# Scame

[![Build Status](https://drone.io/github.com/nlamirault/scame/status.png)](https://drone.io/github.com/nlamirault/scame/latest)

An Emacs configuration.

## Dependencies

- [Emacs 24](http://wikemacs.org/wiki/Installing_Emacs)
- [Cask](https://github.com/cask/cask)


## Installation

## Automated

You can install via the command line with curl:

	curl -L https://raw.github.com/nlamirault/scame/master/scame | python


### Manual

    $ git clone https://github.com/nlamirault/scame
    $ ./scame


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
