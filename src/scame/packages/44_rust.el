;;; 44_rust.el -- Rust configuration

;; Copyright (C) 2014, 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-rust

  (use-package rust-mode :quelpa
    :mode (("\\.rs\\'" . rust-mode))
    :init (add-hook 'rust-mode-hook 'flycheck-mode)
    :config (setq tab-width 4))

  (use-package cargo :quelpa
    :config (progn
              (add-hook 'rust-mode-hook 'cargo-minor-mode)
              (add-hook 'rust-mode-hook
                        (lambda ()
                          (local-set-key (kbd "C-x r t") 'cargo-test-current-test)
                          (local-set-key (kbd "C-x r f") 'cargo-test-current-file)
                          (local-set-key (kbd "C-x r p") 'cargo-test-current-project)
                          ))))

  (use-package racer :quelpa
    :init (progn
            (setq racer-rust-src-path (getenv "RUST_HOME"))
            (setq racer-cmd (executable-find "racer")))
    :config (add-hook 'rust-mode-hook
                      '(lambda ()
                         (racer-activate)
                         (racer-turn-on-eldoc)
                         (local-set-key (kbd "M-.") #'racer-find-definition)
                         (local-set-key (kbd "TAB") #'racer-complete-or-indent))))

  (use-package flycheck-rust :quelpa
    :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

  (use-package company-racer :quelpa
    :init (set (make-local-variable 'company-backends) '(company-racer)))

  )


(provide '44_rust)
;;; 44_rust.el ends here
