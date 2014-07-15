# Scame ChangeLog

## Version 0.7.0 (07/15/2014)

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
- [#18][]: Add go-projectile
- [#13][]: Refactor unit test to creates sandbox to test Scame installation and not use local installation
- Remove [cerbere][]
- Update Python and Go configuration to use [phpunit.el][] and [go-test.el][]

## Version 0.5.0 (04/28/2014)

- Migrate from MIT to GPL-3
- [#16][]: Add C and C++ configuration
- [#14][]: Add sphinx-doc
- Add perspective for projectile
- [#12][]: FIX Key bindings not enabled by default
- Add perspective.el
- Migrate to [cerbere][] mode ([gotest.el][], [phpunit.el][], [tox.el][])
- [#11][]: Add plsense-direx
- [#9][]: Add jedi-direx
- [#8][]: Add go-direx
- [#7][]: Change Scame initialisation filename
- Add unit tests for Scame configuration

## Version 0.4.0 (04/15/2014)

- [#6][]: Update command argument doens't perform a git pull on scame local installation
- [#4][]: Add uniquify configuration
- Add a command top open the Scame user customization file
- Refactoring Scame installation directory
- Migrating to a CLI in Emacs Lisp using [commander.el][]
- [#3][]: configure helm-projectile and key binding
- [#2][]: configure helm-imenu and key binding
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

[#18]: https://github.com/nlamirault/scame/issues/18
[#16]: https://github.com/nlamirault/scame/issues/16
[#14]: https://github.com/nlamirault/scame/issues/14
[#13]: https://github.com/nlamirault/scame/issues/13
[#12]: https://github.com/nlamirault/scame/issues/12
[#11]: https://github.com/nlamirault/scame/issues/11
[#9]: https://github.com/nlamirault/scame/issues/9
[#8]: https://github.com/nlamirault/scame/issues/8
[#7]: https://github.com/nlamirault/scame/issues/7
[#6]: https://github.com/nlamirault/scame/issues/6
[#4]: https://github.com/nlamirault/scame/issues/4
[#3]: https://github.com/nlamirault/scame/issues/3
[#2]: https://github.com/nlamirault/scame/issues/2
