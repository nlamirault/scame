;;; scame-gnus-gpg.el --- Gnus Encrypt tools

;; Copyright (C) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:


(require 'epg-config)

(setq mml2015-use 'epg
      mml2015-verbose t
      mml2015-encrypt-to-self t
      mml2015-always-trust nil
      mml2015-cache-passphrase t
      mml2015-passphrase-cache-expiry '36000
      mml2015-sign-with-sender t)

(setq gnus-message-replyencrypt t
      gnus-message-replysign t
      gnus-message-replysignencrypted t
      gnus-treat-x-pgp-sig t
      mm-sign-option nil ; 'guided
      mm-encrypt-option nil ;'guided
      mm-verify-option 'known ;'always
      mm-decrypt-option 'known) ;'always)

(setq gnus-buttonized-mime-types
      '("multipart/alternative"
        "multipart/encrypted"
        "multipart/signed"))

(setq epg-debug t) ;;  then read the *epg-debug*" buffer

;; Sign messages by default.
(add-hook 'message-setup-hook 'mml-secure-message-sign)

(provide 'scame-gnus-gpg)
;;; scame-gnus-gpg.el ends here
