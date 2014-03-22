;;
;; Emacs configuration for OSX
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

;; Mac specified setting(Meta key, input method, terminfo)

;; (setq ns-command-modifier 'meta
;;       ns-alternate-modifier 'super
;;       ns-use-native-fullscreen nil ;; Don't use system fullscreen
;;       default-input-method "MacOSX"
;;       system-uses-terminfo nil)

;; Switch the Cmd and Meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
