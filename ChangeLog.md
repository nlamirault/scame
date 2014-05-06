# Scame ChangeLog

## Version 0.6.0 (IN PROGRESS)

- Remove [cerbere][]
- Update Python and Go configuration to use [phpunit.el][] and [go-test.el][]

## Version 0.5.0 (04/28/2014)

- Migrate from MIT to GPL-3
- [#16](https://github.com/nlamirault/scame): Add C and C++ configuration
- [#14](https://github.com/nlamirault/scame): Add sphinx-doc
- Add perspective for projectile
- [#12](https://github.com/nlamirault/scame): FIX Key bindings not enabled by default
- Add perspective.el
- Migrate to [cerbere][] mode ([gotest.el][], [phpunit.el][], [tox.el][])
- [#11](https://github.com/nlamirault/scame): Add plsense-direx
- [#9](https://github.com/nlamirault/scame): Add jedi-direx
- [#8](https://github.com/nlamirault/scame): Add go-direx
- [#7](https://github.com/nlamirault/scame): Change Scame initialisation filename
- Add unit tests for Scame configuration

## Version 0.4.0 (04/15/2014)

- [#6](https://github.com/nlamirault/scame): Update command argument doens't perform a git pull on scame local installation
- [#4](https://github.com/nlamirault/scame): Add uniquify configuration
- Add a command top open the Scame user customization file
- Refactoring Scame installation directory
- Migrating to a CLI in Emacs Lisp using [commander.el][]
- [#3](https://github.com/nlamirault/scame): configure helm-projectile and key binding
- [#2](https://github.com/nlamirault/scame): configure helm-imenu and key binding
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
