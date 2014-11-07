;;; 96_music.el --- Music player

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package emms
  :init (progn
          (define-prefix-command 'scame-emms-map)
          (global-set-key (kbd "C-x e") 'scame-emms-map))
  :config (progn
            (require 'emms-setup)
            (emms-all)
            (emms-default-players)
            (setq emms-mode-line-icon-color "white")
            (emms-mode-line-toggle)
            (setq emms-playlist-buffer-name "*Music*")
            (setq emms-browser-default-browse-type 'info-album)
            (emms-add-directory-tree "~/Music"))
  :bind (("C-x e s" . emms-start)
         ("C-x e SPC" . emms-pause)
         ("C-x e k" . emms-stop)
         ("C-x e n" . emms-next)
         ("C-x e p" . emms-previous)))

(use-package emms-info-libtag)

(use-package emms-browser)

(use-package emms-cache)

(use-package emms-info)

(use-package emms-tag-editor)

(use-package emms-volume
  :bind (("C-x e ." . emms-volume-mode-plus)
         ("C-x e ," . emms-volume-mode-minus)))

(use-package emms-player-vlc
  :config (define-emms-simple-player vlc '(file url)
            (concat "\\`\\(https?\\|mms\\)://\\|"
                    (emms-player-simple-regexp
                     "ogg" "mp3" "wav" "mpg" "mpeg" "wmv" "wma"
                     "mov" "avi" "divx" "ogm" "ogv" "asf" "mkv"
                     "rm" "rmvb" "mp4" "flac" "vob" "m4a" "ape"))
            "vlc" "--intf=rc"))

;; (use-package emms-player-mpd
;;   :config (add-to-list 'emms-player-list 'emms-player-mpd))

(use-package emms-mode-line
  :config (emms-mode-line 1))

(use-package emms-playing-time
  :config (emms-playing-time 1))

(use-package emms-streams
  :config (setq emms-stream-list
                '(("Nova" "http://broadcast.infomaniak.net/radionova-high.mp3" 1 url)
                  ("France Inter" "http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u" 1 url)
                  ("France Info" "http://www.tv-radio.com/station/france_info/france_info.m3u" 1 url))))

(use-package helm-emms
  :bind (("C-x e r" . helm-emms)))

(use-package bongo)


(provide '96_music)
;;; 96_music.el ends here
