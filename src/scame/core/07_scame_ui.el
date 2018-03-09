;;; 07_scame_ui.el --- Scame UI configuration

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


(setq-default fill-column 120)

(setq visible-bell t)

(global-linum-mode 1)
(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode nil)

;; Window moves
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Window resize
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;; http://www.lunaryorn.com/2016/04/28/fullscreen-magit-status.html

(defun lunaryorn-display-buffer-fullframe (buffer alist)
  "Display BUFFER in fullscreen.

ALIST is a `display-buffer' ALIST.

Return the new window for BUFFER."
  (let ((window
         (or (display-buffer-use-some-window buffer alist)
             (display-buffer-pop-up-window buffer alist))))
    (when window
      (delete-other-windows window))
    window))

(add-to-list 'display-buffer-alist
             `(,(rx "*magit: ")
               (lunaryorn-display-buffer-fullframe)
               (reusable-frames . nil)))

(add-to-list 'display-buffer-alist
             `(,(rx "*magit-log: ")
               (lunaryorn-display-buffer-fullframe)
               (reusable-frames . nil)))

(add-to-list 'display-buffer-alist
             `(,(rx "*Compilation*")
               (lunaryorn-display-buffer-fullframe)
               (reusable-frames . nil)))

(add-to-list 'display-buffer-alist
             `(,(rx "*Go Test*")
               (lunaryorn-display-buffer-fullframe)
               (reusable-frames . nil)))


;; Xwidget

(when (require 'xwidget nil 'noerror)
  (add-hook 'xwidget-webkit-mode-hook
            (lambda ()
              (define-key xwidget-webkit-mode-map [mouse-4] 'xwidget-webkit-scroll-down)
              (define-key xwidget-webkit-mode-map [mouse-5] 'xwidget-webkit-scroll-up)
              (define-key xwidget-webkit-mode-map (kbd "<up>") 'xwidget-webkit-scroll-down)
              (define-key xwidget-webkit-mode-map (kbd "<down>") 'xwidget-webkit-scroll-up)
              (define-key xwidget-webkit-mode-map (kbd "M-w") 'xwidget-webkit-copy-selection-as-kill)
              (define-key xwidget-webkit-mode-map (kbd "C-c") 'xwidget-webkit-copy-selection-as-kill)

              ;; make xwidget default browser (not for now... maybe in the future!)
              ;; (setq browse-url-browser-function (lambda (url session)
              ;;                                     (other-window 1)
              ;;                                     (xwidget-browse-url-no-reuse url)))

              ;; adapt webkit according to window configuration change automatically
              ;; without this hook, every time you change your window configuration,
              ;; you must press 'a' to adapt webkit content to new window size
              (add-hook 'window-configuration-change-hook
                        (lambda ()
                          (when (equal major-mode 'xwidget-webkit-mode)
                            (xwidget-webkit-adjust-size-dispatch))))

              ;; by default, xwidget reuses previous xwidget window,
              ;; thus overriding your current website, unless a prefix argument
              ;; is supplied
              ;;
              ;; This function always opens a new website in a new window
              (defun xwidget-browse-url-no-reuse (url &optional sessoin)
                (interactive (progn
                               (require 'browse-url)
                               (browse-url-interactive-arg "xwidget-webkit URL: "
                                                           )))
                (xwidget-webkit-browse-url url t)))

            ))


;; Fonts
;; -------

(require 'dash)

;; Fira code ligatures. Fira Code Symbol is a different font than Fira Code!
;; You can use any font you wish with just the ligatures
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")

(defun set-icon-fonts (code-font-alist)
  "Utility to associate many unicode points with specified fonts."
  (--each code-font-alist
    (-let (((font . codes) it))
      (--each codes
        (set-fontset-font t `(,it . ,it) font)))))

;; The icons you see are not the correct icons until this is evaluated!
(set-icon-fonts
 '(("fontawesome"
    ;;                         
    #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101)

   ("all-the-icons"
    ;;    
    #xe907 #xe928)

   ("github-octicons"
    ;;                          
    #xf091 #xf059 #xf076 #xf075 #xe192  #xf016)

   ("material icons"
    ;;        
    #xe871 #xe918 #xe3e7)

   ("Symbola"
    ;; 𝕊    ⨂      ∅      ⟻    ⟼     ⊙      𝕋       𝔽
    #x1d54a #x2a02 #x2205 #x27fb #x27fc #x2299 #x1d54b #x1d53d
    ;; 𝔹    𝔇       𝔗
    #x1d539 #x1d507 #x1d517)))


(provide '07_scame_ui)
;;; 07_scame_ui.el ends here
