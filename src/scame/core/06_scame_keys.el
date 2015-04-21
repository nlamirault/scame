;; 06_scame_keys.el --- Scame customization for Emacs

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
   _g_: google          _G_: Google            _a_: calc         _O_: local         _v_: version
   _w_: work            _H_: Github            _m_: man          _M_: Gmail         _z_: customization
   _d_: diary           _T_: Twitter           _p_: packages     _E_: Exchange      ^ ^
   _o_: org             _L_: Launchpad         _h_: proced       ^ ^                ^ ^
   ^ ^                  _S_: Stackoverflow     _t_: term         ^ ^                ^ ^
   ^ ^                  _W_: Wikipedia         ^ ^               ^ ^                ^ ^
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

        ("a" calc nil)
        ("m" man nil)
        ("p" paradox-list-packages nil)
        ("h" proced nil)
        ("t" helm-mt nil)

        ("O" scame-mail-local nil)
        ("M" scame-mail-gmail nil)
        ("E" scame-mail-exchange nil)

        ("v" scame-version nil)
        ("z" scame-customization nil)

        )

(defhydra hydra-scame-projectile (:color teal)
      "
Find File          Search/Tags       Buffers                  Cache
------------------------------------------------------------------------------------------
^^_f_: file dwim       _a_: ag             ^^_i_: Ibuffer               _c_: cache clear
^^_r_: recent file     _g_: update gtags   ^^_K_: Kill all buffers      _x_: remove known project
^^_d_: dir             _o_: multi-occur    ^^_X_: cleanup non-existing  _z_: cache current
Operate On
---------------------
^^_D_: Dired
^^_m_: Magit
^^_e_: Eshell
"
      ("a"   projectile-ag                      nil)
      ("c"   projectile-invalidate-cache        nil)
      ("d"   projectile-find-dir                nil)
      ("e"   (eshell '(4))                      nil)
      ("D"   projectile-dired                   nil)
      ("f"   projectile-find-file-dwim          nil)
      ("g"   projectile-regenerate-tags         nil)
      ("i"   projectile-ibuffer                 nil)
      ("K"   projectile-kill-buffers            nil)
      ("m"   (magit-status (projectile-project-root)) nil)
      ("o"   projectile-multi-occur             nil)
      ("p"   projectile-switch-project          nil)
      ("r"   projectile-recentf                 nil)
      ("x"   projectile-remove-known-project    nil)
      ("X"   projectile-cleanup-known-projects  nil)
      ("z"   projectile-cache-current-file      nil)
      ("q"   nil                                "cancel" :color blue)
      )


(global-set-key (kbd "C-c s SPC") 'hydra-scame/body)
(global-set-key (kbd "C-c s P") 'hydra-scame-projectile/body)


(provide '06_scame_keys)
;;; 06_scame_keys.el ends here
