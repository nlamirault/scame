;; 51_arduino.el --- Arduino configuration

;; Copyright (C) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-iot

  (use-package arduino-mode
    :mode (("\\.ino\\'" . arduino-mode)))

  ;; Test it
  ;; (use-package company-arduino)

  (use-package platformio-mode
    :init (add-hook 'c++-mode-hook 'platformio-mode)
    :mode (("\\.ino\\'" . arduino-mode))
    :config (platformio-setup-compile-buffer))

  (use-package company-arduino
    :init (require #'company-arduino)
    :config (add-to-list 'company-backends 'company-arduino))

  )

(provide '51_arduino)
;;; 51_arduino.el ends here
