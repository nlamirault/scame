;;; 14_cloud.el --- Cloud configuration

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Puppet files

(when scame-cloud

  (use-package puppet-mode
    :ensure t
    :pin melpa
    :mode (("\\.pp\\'" . puppet-mode))
    :config (add-hook 'puppet-mode-hook
                      (lambda ()
                        (make-local-variable 'indent-tabs-mode)
                        (setq indent-tabs-mode nil))))

  ;; Ansible

  (use-package ansible
    :ensure t
    :pin melpa
    :config (add-hook 'yaml-mode-hook
                      (lambda ()
                        (ansible 1))))

  (use-package ansible-doc
    :ensure t
    :pin melpa
    :config (add-hook 'yaml-mode-hook 'ansible-doc-mode))

  ;; Vagrant files
  (use-package vagrant
    :ensure t
    :pin melpa
    :mode (("Vagrantfile" . ruby-mode)))

  ;; Docker files
  (use-package dockerfile-mode
    :ensure t
    :pin melpa
    :mode (("Dockerfile" . dockerfile-mode)))

  ;; Terraform
  (use-package terraform-mode
    :ensure t
    :pin melpa
    :config (setq terraform-indent-level 2))

  (use-package salt-mode
    :ensure t
    :pin melpa
    :mode (("\\.sls\\'" . salt-mode))
    ;; :bind
    ;; (("" . salt-mode-browse-doc)
    ;;  ("" . salt-mode-backward-state-function)
    ;;  ("" . salt-mode-forward-state-function)))
    )
  )

(provide '14_cloud)
;;; 14_cloud.el ends here
