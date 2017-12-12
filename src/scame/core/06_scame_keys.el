;; 06_scame_keys.el --- Scame customization for Emacs

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

;; Scame is a configuration for Emacs.

;;; Code:


(global-set-key (kbd "C-<down>")
                (function (lambda ()
                            (interactive)
                            (scroll-up 1))))

(global-set-key (kbd "C-<up>")
                (function (lambda ()
                            (interactive)
                            (scroll-down 1))))

(defhydra scame-hydra (:color teal)
        "
   ^ Calendars^       ^ Search^            ^ Launcher^          ^ Email^            ^ Help^
  ╭────────────────────────────────────────────────────────────────────────────────────────────────────
   _g_:  google       _G_:  Google          _a_:  application   _O_:  local         _v_:  version
   _w_:  work         _H_:  Github          _m_:  man           _M_:  Gmail         _z_:  customization
   _d_:  diary        _T_:  Twitter         _p_:  packages      _E_:  Exchange      ^ ^
   _o_:  org          _L_: Launchpad         _h_:  proced         ^ ^                  ^ ^
   ^ ^                  _S_:  Stackoverflow  _t_:  term           ^ ^                   ^ ^
   ^ ^                  _W_:  Wikipedia      _r_:  ranger        ^ ^                   ^ ^
   ^ ^                  _R_: RFC              ^ ^                     ^ ^                  ^ ^
  ---------------------------------------------------------------------------------------------------------------
        "
        ("q" nil " quit")

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
        ("t" multi-term nil)
        ("r" ranger nil)

        ("O" scame-mail-local nil)
        ("M" scame-mail-gmail nil)
        ("E" scame-mail-exchange nil)

        ("v" scame-version nil)
        ("z" scame-customization nil)

        )


(defhydra scame-hydra-projectile (:color teal)
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


(defhydra scame-hydra-org (:color teal)
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


(defhydra scame-hydra-zoom (:color teal)
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))



(defhydra scame-hydra-toggle (:color pink :hint nil)
  "
_a_ abbrev-mode:       %`abbrev-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
_h_ highlight          %`highlight-nonselected-windows
_t_ truncate-lines:    %`truncate-lines
_w_ whitespace-mode:   %`whitespace-mode
_l_ org link display:  %`org-descriptive-links
"
  ("a" abbrev-mode)
  ("d" toggle-debug-on-error)
  ("f" auto-fill-mode)
  ("h" (setq highlight-nonselected-windows (not highlight-nonselected-windows)))
  ("t" toggle-truncate-lines)
  ("w" whitespace-mode)
  ("l" org-toggle-link-display)
  ("q" nil "quit"))


(defhydra scame-hydra-insert (:color red :hint nil)
  "
_e_ insert emoji
_a_ insert all the icon
_f_ insert FontAwesome icon
_m_ insert Material icon
_i_ insert Atom File icon
_o_ insert Github Octicon
_w_ insert weather icon
_d_ insert current timestamp
_c_ insert copyright
"
  ("e" emojify-insert-emoji)
  ;; Icons
  ("a" all-the-icons-insert-alltheicon)
  ("f" all-the-icons-insert-faicon)
  ("m" all-the-icons-insert-material)
  ("i" all-the-icons-insert-fileicon)
  ("o" all-the-icons-insert-octicon)
  ("w" all-the-icons-insert-wicon)
  ;; Misc
  ("d" scame-insert-timestamp)
  ("c" scame-insert-copyright)
  ("q" nil "quit"))


(global-set-key (kbd "C-c s SPC") 'scame-hydra/body)
(global-set-key (kbd "C-c s P") 'scame-hydra-projectile/body)
(global-set-key (kbd "C-c s o") 'scame-hydra-org/body)
(global-set-key (kbd "C-c s z") 'scame-hydra-zoom/body)
(global-set-key (kbd "C-c s t") 'scame-hydra-toggle/body)
(global-set-key (kbd "C-c s i") 'scame-hydra-insert/body)


(provide '06_scame_keys)
;;; 06_scame_keys.el ends here
