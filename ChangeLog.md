# Scame ChangeLog

## Version 0.11.0 (06/01/2015)

- Init Scame archive for stable release
- Split unit tests
- `FIX` Common Lisp setup
- `FIX` Cloud tools setup
- `FIX` ERC setup
- Refactoring unit tests for using `Overseer`
- [GH-36] : Add vendoring directory
- Add twitterring-mode
- Setup `bug-reference-mode`

## Version 0.10.0 (22/12/2014)

- [GH-35]: Warning after installation with invalid 'load-path'
- Update TravisCI configuration
- Setup music and radio using EMMS
- Init continuous integration watcher using Butler for Jenkins
- Update dired configuration

## Version 0.9.0 (10/24/2014)

- Update Javascript configuration
- Refactoring php-mode and web-mode
- Init configuration for Elixir
- [GH-22]: Add discover-my-major
- [GH-32]: Add go-errcheck package
- [GH-31]: Add golint package
- Update GPG And Gnus setup
- Update Linux configuration for offlineimap
- Update IRC and IM configurations
- [GH-24]: Add the platinum searcher
- FIX cider setup
- Add pip-requirements package

## Version 0.8.0 (09/11/2014)

- Update Common Lisp environment from SLIME to SLY
- Update TravisCI setup
- `FIX` Remove Emacs 23 support
- Configure [BBDB][]
- Add [Gnus][] configuration
- Add neotree package

## Version 0.7.0 (07/15/2014)

- Add Docker container to launch unit tests
- ``FIX`` unit tests
- Due to Emacs 24.4 required, remove some modules.
- ``FIX`` Anaconda configuration
- Change Smex keybindings
- ``FIX`` golang configuration
- ``FIX`` Remove password manager due website down
- Add Rust support

## Version 0.6.0 (06/17/2014)

- Add toml-mode mode
- Add Dockerfile to publish a Scame image on the [Docker registry][]
- Update Common lisp and go setup
- `FIX` Enable global-linum-mode
- `FIX` UTF-8 encodings
- [GH-18]: Add go-projectile
- [GH-13]: Refactor unit test to creates sandbox to test Scame installation and not use local installation
- Remove [cerbere][]
- Update Python and Go configuration to use [phpunit.el][] and [go-test.el][]

## Version 0.5.0 (04/28/2014)

- Migrate from MIT to GPL-3
- [GH-16]: Add C and C++ configuration
- [GH-14]: Add sphinx-doc
- Add perspective for projectile
- [GH-12]: FIX Key bindings not enabled by default
- Add perspective.el
- Migrate to [cerbere][] mode ([gotest.el][], [phpunit.el][], [tox.el][])
- [GH-11]: Add plsense-direx
- [GH-9]: Add jedi-direx
- [GH-8]: Add go-direx
- [GH-7]: Change Scame initialisation filename
- Add unit tests for Scame configuration

## Version 0.4.0 (04/15/2014)

- [GH-6]: Update command argument doens't perform a git pull on scame local installation
- [GH-4]: Add uniquify configuration
- Add a command top open the Scame user customization file
- Refactoring Scame installation directory
- Migrating to a CLI in Emacs Lisp using [commander.el][]
- [GH-3]: configure helm-projectile and key binding
- [GH-2]: configure helm-imenu and key binding
- Allow users to customize Scame default keymap prefix
- Uniform keybindings
- Migrate to [use-package][] for packages configuration

## Version 0.3.0 (03/27/2014)

- Add [EVM][] installation
- Add [Cask][] installation

## Version 0.2.0 (03/22/2014)

- Customization in ``$HOME/.config/scame/user.el`` file
- Setup [Drone.io](https://drone.io) build
- FIX Scame's installer

## Version 0.1.0 (03/20/2014)

- Add installer
- Init project from [Divona][]


[use-package]: https://github.com/jwiegley/use-package
[commander.el]: https://github.com/rejeep/commander.el

[go-test.el]: https://github.com/nlamirault/gotest.el
[phpunit.el]: https://github.com/nlamirault/phpunit.el
[tox.el]: https://github.com/chmouel/tox.el
[cerbere]: https://github.com/nlamirault/cerbere
[divona]: https://github.com/nlamirault/divona
[Cask]: https://github.com/cask/cask
[EVM]: https://github.com/rejeep/evm
[Gnus]: http://www.gnus.org/
[BBDB]: https://github.com/emacsmirror/bbdb

[GH-35]: https://github.com/nlamirault/scame/issues/36
[GH-35]: https://github.com/nlamirault/scame/issues/35
[GH-32]: https://github.com/nlamirault/scame/issues/32
[GH-31]: https://github.com/nlamirault/scame/issues/31
[GH-24]: https://github.com/nlamirault/scame/issues/24
[GH-22]: https://github.com/nlamirault/scame/issues/22
[GH-18]: https://github.com/nlamirault/scame/issues/18
[GH-16]: https://github.com/nlamirault/scame/issues/16
[GH-14]: https://github.com/nlamirault/scame/issues/14
[GH-13]: https://github.com/nlamirault/scame/issues/13
[GH-12]: https://github.com/nlamirault/scame/issues/12
[GH-11]: https://github.com/nlamirault/scame/issues/11
[GH-9]: https://github.com/nlamirault/scame/issues/9
[GH-8]: https://github.com/nlamirault/scame/issues/8
[GH-7]: https://github.com/nlamirault/scame/issues/7
[GH-6]: https://github.com/nlamirault/scame/issues/6
[GH-4]: https://github.com/nlamirault/scame/issues/4
[GH-3]: https://github.com/nlamirault/scame/issues/3
[GH-2]: https://github.com/nlamirault/scame/issues/2
