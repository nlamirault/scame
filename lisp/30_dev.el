;;
;; Commons configurations for development
;;

;; From : http://batsov.com/projectile/

(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)
(require 'project-explorer)
