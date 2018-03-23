;;; scame-modeline.el --- Mode-line configuration

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package moody
  :ensure t
  :pin melpa
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package minions
  :ensure t
  :pin melpa
  :config (progn
            (minions-mode 1)
            (setq minions-mode-line-lighter "#")))

;; (setq powerline-default-separator 'wave)


;; (use-package spaceline :ensure t
;;   :config
;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))


;; (use-package spaceline-config :ensure spaceline
;;   :config
;;   (spaceline-toggle-buffer-position-off)
;;   (spaceline-toggle-hud-off)
;;   (spaceline-toggle-projectile-root-on)
;;   (spaceline-toggle-minor-modes-off)
;;   (spaceline-toggle-flycheck-error-on)
;;   (spaceline-toggle-flycheck-warning-on)
;;   (spaceline-toggle-flycheck-info-on)
;;   (spaceline-toggle-which-function-on))

;; (setq-default
;;  powerline-height 20
;;  spaceline-workspace-numbers-unicode 't
;;  spaceline-window-numbers-unicode 't
;;  spaceline-separator-dir-left '(right . right)
;;  spaceline-separator-dir-right '(left . left))


;; TODO ?
;; (use-package spaceline-all-the-icons
;;   :ensure t
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-all-the-icons--setup-neotree)
;;   (setq spaceline-all-the-icons-clock-always-visible nil)
;;   (setq spaceline-all-the-icons-flycheck-alternate 1)
;;   ;; (setq spaceline-all-the-icons-slim-render 1)
;;   (setq spaceline-all-the-icons-separator-type 'none)
;;   ;; (setq spaceline-all-the-icons-icon-set-flycheck-slim 'outline)
;;   (spaceline-toggle-all-the-icons-time-off)
;;   (spaceline-toggle-all-the-icons-buffer-path-off)
;;   (spaceline-toggle-all-the-icons-eyebrowse-workspace-on)
;;   (spaceline-toggle-all-the-icons-projectile-on)
;;   (spaceline-toggle-all-the-icons-hud-off)
;;   (spaceline-toggle-all-the-icons-modified-on)
;;   (spaceline-toggle-all-the-icons-process-on)
;;   ;; (setq spaceline-separator-dir-left '(left . left))
;;   ;; (setq spaceline-separator-dir-right '(right . right))
;;   )



(provide 'scame-modeline)
;;; scame-modeline.el ends here
