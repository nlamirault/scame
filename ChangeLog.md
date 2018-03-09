# Scame ChangeLog

## Version 1.6.0

- Refactoring *hydra* menus
- Add *ivy-rich* mode
- Add *all-the-icons-ivy* mode

## Version 1.5.0

- Initialize Scame custom modeline
- Add origami
- Setup xwidget for web browsing
- ``#58``: Add dumb-jump
- Add application launcher
- Add *cask-mode*
- Magit status and log windows in fullscreen
- Update Arduino setup with *PlatformIO*
- Add *counsel-projectile*

## Version 1.4.0

- Setup Arduino development
- Update documentation
- Remove *rustfmt* package (now in *rust-mode*)
- Add *spaceline* for modeline
- Improve UI using *mode-icons*
- Update OCmaml configuration and dependencies
- ``FIX`` CircleCI configuration
- Update Gnus configuration for GMail
- Add *hydra* for golang and python
- ``FIX`` Haskell configuration
- ``FIX`` projectile completion backends

## Version 1.3.0 (10/14/2015)

- Setup CircleCI continuous integration
- ``FIX`` OCaml configuration
- Setup *rust* development environment
- Update modeline

## Version 1.2.0 (30/07/2015)

- Remove Cask dependency
- ``#49``: Add a feature to load only some modules
- Add *ranger*
- Replace guide-key with which-key
- ``#50`` : Error with helm-find-files
- Add *py-yapf* for Python

## Version 1.1.0 (07/09/2015)

- Add *fishshell* mode
- Add *asciidoc* mode
- ``#45``: Error with appoitment
- Update keybindings using Hydra
- ``#47``: Choice of completion backend

## Version 1.0.0 (04/03/2015)

- Update *org-mode* and setup *appointment*
- Add *ace-window*
- Add *swiper*
- Remove *ido* and reconfigure *helm*
- Update *smart-mode-line*
- Update notifications system (*sauron*)
- Refactoring *gnus* and IMAP on localhost
- ``FIX`` Load libraries from vendoring directory
- Add Lua support
- Add *engine-mode* for search providers
- Setup *irony* for c, c++ and objective-c
- ``#41``: Change init-loader to el-init

## Version 0.13.0 (03/02/2015)

- Setup *helm-mt* to manage multi terminals
- Setup calendars using *calfw* (ics, Org, ...)
- Add week numbers in calendar
- Init specify packages version in Cask file
- Add *hydra* to manage key bindings

## Version 0.12.0 (01/20/2015)

- Setup visible bell
- `FIX` Docker image creation
- Replace *w3m* rendering by *shr* in *Gnus*
- ``#30``: Remove *w3m* (due to [Cask-270][])
- Remove Emacs 24.3 support
- Add *helm-occur*

## Version 0.11.0 (01/06/2015)

- Init Scame archive for stable release
- Split unit tests
- `FIX` Common Lisp setup
- `FIX` Cloud tools setup
- `FIX` *ERC* setup
- ``#19``: Refactoring unit tests for using *Overseer*
- ``#36``: Add vendoring directory
- Add *twitterring-mode*
- Setup *bug-reference-mode*

## Version 0.10.0 (12/22/2014)

- ``#35``: Warning after installation with invalid 'load-path'
- Update TravisCI configuration
- Setup music and radio using *EMMS*
- Init continuous integration watcher using *Butler* for Jenkins
- Update *dired* configuration

## Version 0.9.0 (10/24/2014)

- Update Javascript configuration
- Refactoring *php-mode* and *web-mode*
- Init configuration for *elixir*
- ``#22``: Add *discover-my-major*
- ``#32``: Add *go-errcheck* package
- ``#31``: Add *golint* package
- Update GPG And Gnus setup
- Update Linux configuration for offlineimap
- Update IRC and IM configurations
- ``#24``: Add the platinum searcher
- FIX *cider* setup
- Add *pip-requirements* package

## Version 0.8.0 (09/11/2014)

- Update Common Lisp environment from *slime* to *sly*
- Update TravisCI setup
- `FIX` Remove Emacs 23 support
- Configure *BBDB*
- Add *Gnus* configuration
- Add neotree package

## Version 0.7.0 (07/15/2014)

- Add Docker container to launch unit tests
- ``FIX`` unit tests
- Due to Emacs 24.4 required, remove some modules.
- ``FIX`` *anaconda* configuration
- Change *smex* keybindings
- ``FIX`` golang configuration
- ``FIX`` Remove password manager due website down
- Add Rust support

## Version 0.6.0 (06/17/2014)

- Add *toml-mode* mode
- Add Dockerfile to publish a Scame image on the [Docker registry][]
- Update Common lisp and go setup
- `FIX` Enable *global-linum-mode*
- `FIX` UTF-8 encodings
- ``#18``: Add *go-projectile*
- ``#13``: Refactor unit test to creates sandbox to test Scame installation and not use local installation
- Remove *cerbere*
- Update Python and Go configuration to use *phpunit.el* and *go-test.el*

## Version 0.5.0 (04/28/2014)

- Migrate from MIT to GPL-3
- ``#16``: Add C and C++ configuration
- ``#14``: Add *sphinx-doc*
- Add perspective for projectile
- ``#12``: FIX Key bindings not enabled by default
- Add *perspective.el*
- Migrate to *cerbere*  mode (*gotest.el*, *phpunit.el*, *tox.el*)
- ``#11``: Add *plsense-direx*
- ``#9``: Add *jedi-direx*
- ``#8``: Add *go-direx*
- ``#7``: Change Scame initialisation filename
- Add unit tests for Scame configuration

## Version 0.4.0 (04/15/2014)

- ``#6``: Update command argument doens't perform a git pull on scame local installation
- ``#4``: Add *uniquify* configuration
- Add a command top open the Scame user customization file
- Refactoring Scame installation directory
- Migrating to a CLI in Emacs Lisp using [commander.el][]
- ``#3``: configure *helm-projectile* and key binding
- ``#2``: configure *helm-imenu* and key binding
- Allow users to customize Scame default keymap prefix
- Uniform keybindings
- Migrate to *use-package* for packages configuration

## Version 0.3.0 (03/27/2014)

- Add [EVM][] installation
- Add [Cask][] installation

## Version 0.2.0 (03/22/2014)

- Customization in ``$HOME/.config/scame/user.el`` file
- Setup [Drone.io](https://drone.io) build
- FIX Scame's installer

## Version 0.1.0 (03/20/2014)

- Add installer
- Init project


[Cask]: https://github.com/cask/cask
[EVM]: https://github.com/rejeep/evm
