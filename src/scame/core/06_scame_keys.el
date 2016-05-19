;; 06_scame_keys.el --- Scame customization for Emacs

;; Copyright (c) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Scame is a configuration for Emacs.

;;; Code:

(defhydra hydra-scame (:color teal)
        "
   ^Calendars^          ^Search^               ^Launcher^        ^Email^            ^Help^
  ╭────────────────────────────────────────────────────────────────────────────────────────────────────
   _g_: google          _G_: Google            _a_: application  _O_: local         _v_: version
   _w_: work            _H_: Github            _m_: man          _M_: Gmail         _z_: customization
   _d_: diary           _T_: Twitter           _p_: packages     _E_: Exchange      ^ ^
   _o_: org             _L_: Launchpad         _h_: proced       ^ ^                ^ ^
   ^ ^                  _S_: Stackoverflow     _t_: term         ^ ^                ^ ^
   ^ ^                  _W_: Wikipedia         _r_: ranger       ^ ^                ^ ^
   ^ ^                  _R_: RFC               ^ ^               ^ ^                ^ ^
  ---------------------------------------------------------------------------------------------------------------
        "
        ("q" nil "quit")

        ("g" scame-google-calendar nil)
        ("w" scame-work-calendar nil)
        ("d" scame-diary-calendar nil)
        ("o" scame-org-calendar nil)

        ("G" engine/search-google nil)
        ("H" engine/search-github nil)
        ("T" engine/search-twitter nil)
        ("L" engine/search-launchpad nil)
        ("S" engine/search-stackoverflow nil)
        ("W" engine/search-wikipedia nil)
        ("R" engine/search-rfcs nil)

        ("a" counsel-linux-app nil)
        ("m" man nil)
        ("p" paradox-list-packages nil)
        ("h" proced nil)
        ("t" helm-mt nil)
        ("r" ranger nil)

        ("O" scame-mail-local nil)
        ("M" scame-mail-gmail nil)
        ("E" scame-mail-exchange nil)

        ("v" scame-version nil)
        ("z" scame-customization nil)

        )

;; (defhydra hydra-scame-ng (:color blue :columns 4)
;;   "Scame hydra."

;;   ("g" scame-google-calendar nil)
;;   ("w" scame-work-calendar nil)
;;   ("d" scame-diary-calendar nil)
;;   ("o" scame-org-calendar nil)

;;   ("a" calc nil)
;;   ("m" man nil)
;;   ("p" paradox-list-packages nil)
;;   ("h" proced nil)
;;   ("t" helm-mt nil)
;;   ("r" ranger nil)

;;   ("O" scame-mail-local nil)
;;   ("M" scame-mail-gmail nil)
;;   ("E" scame-mail-exchange nil)

;;   ("v" scame-version nil)
;;   ("z" scame-customization nil)
;;   ("q" nil "cancel"))


(defhydra hydra-scame-projectile (:color teal)
  "

    Files             Search          Buffer             Do
  ╭──────────────────────────────────────────────────────────────────────────
    [_f_] file          [_a_] ag          [_b_] switch         [_g_] magit
    [_l_] file dwim     [_A_] grep        [_v_] show all       [_p_] commander
    [_r_] recent file   [_s_] occur       [_V_] ibuffer        [_i_] info
    [_d_] dir           [_S_] replace     [_K_] kill all
    [_o_] other         [_t_] find tag
    [_u_] test file     [_T_] make tags
    [_h_] root

    Other Window      Run             Cache              Do
  ╭──────────────────────────────────────────────────╯ ╭────────────────────────
    [_F_] file          [_U_] test        [_kc_] clear         [_x_] TODO & FIXME
    [_L_] dwim          [_m_] compile     [_kk_] add current   [_X_] toggle
    [_D_] dir           [_c_] shell       [_ks_] cleanup
    [_O_] other         [_C_] command     [_kd_] remove
    [_B_] buffer
  --------------------------------------------------------------------------------
        "
        ("<tab>" hydra-master/body "back")
        ("<ESC>" nil "quit")
        ("a"   projectile-ag)
        ("A"   projectile-grep)
        ("b"   projectile-switch-to-buffer)
        ("B"   projectile-switch-to-buffer-other-window)
        ("c"   projectile-run-async-shell-command-in-root)
        ("C"   projectile-run-command-in-root)
        ("d"   projectile-find-dir)
        ("D"   projectile-find-dir-other-window)
        ("f"   projectile-find-file)
        ("F"   projectile-find-file-other-window)
        ("g"   projectile-vc)
        ("h"   projectile-dired)
        ("i"   projectile-project-info)
        ("kc"  projectile-invalidate-cache)
        ("kd"  projectile-remove-known-project)
        ("kk"  projectile-cache-current-file)
        ("K"   projectile-kill-buffers)
        ("ks"  projectile-cleanup-known-projects)
        ("l"   projectile-find-file-dwim)
        ("L"   projectile-find-file-dwim-other-window)
        ("m"   projectile-compile-project)
        ("o"   projectile-find-other-file)
        ("O"   projectile-find-other-file-other-window)
        ("p"   projectile-commander)
        ("r"   projectile-recentf)
        ("s"   projectile-multi-occur)
        ("S"   projectile-replace)
        ("t"   projectile-find-tag)
        ("T"   projectile-regenerate-tags)
        ("u"   projectile-find-test-file)
        ("U"   projectile-test-project)
        ("v"   projectile-display-buffer)
        ("V"   projectile-ibuffer)
        ("X"   fixmee-mode)
        ("x"   fixmee-view-listing))



(defhydra hydra-scame-org (:color teal)
  "

    Timer           Clock               Capture
  ╭──────────────────────────────────────────────────────────────────────────
    [_s_] start     [_i_] clock in      [_c_] capture
    [_S_] stop      [_o_] clock out     [_l_] last capture
    [_r_] reset     [_g_] clock goto
    [_p_] print

  --------------------------------------------------------------------------------
        "
  ("s" org-timer-start)
  ("S" org-timer-stop)
  ;; Need to be at timer
  ("r" org-timer-set-timer)
  ;; Print timer value to buffer
  ("p" org-timer)
  ("i" (org-clock-in '(4)))
  ("o" org-clock-out)
  ;; Visit the clocked task from any buffer
  ("g" org-clock-goto)
  ("c" org-capture)
  ("l" org-capture-goto-last-stored))


(defhydra hydra-scame-zoom (:color teal)
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))


(global-set-key (kbd "C-c s SPC") 'hydra-scame/body)
;; (global-set-key (kbd "C-c s i") 'hydra-scame-ng/body)
(global-set-key (kbd "C-c s P") 'hydra-scame-projectile/body)
(global-set-key (kbd "C-c s o") 'hydra-scame-org/body)
(global-set-key (kbd "C-c s z") 'hydra-scame-zoom/body)



(provide '06_scame_keys)
;;; 06_scame_keys.el ends here
