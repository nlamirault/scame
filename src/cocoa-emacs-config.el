;;
;; Emacs configuration for OSX
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

;; Mac specified setting(Meta key, input method, terminfo)
(setq ns-command-modifier 'meta
      ns-alternate-modifier 'super
      ns-use-native-fullscreen nil ;; Don't use system fullscreen
      default-input-method "MacOSX"
      system-uses-terminfo nil)
