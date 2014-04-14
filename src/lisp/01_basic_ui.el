;;; 01_basic_ui.el --- Emacs basic UI

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:

(setq-default fill-column 120)

(global-linum-mode t)
(setq column-number-mode t)

(require 'tool-bar)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(use-package tool-bar
  :config (tool-bar-mode -1))

; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode nil)

(when (display-graphic-p)
  (setq x-select-enable-clipboard t))

(provide '01_basic_ui)
;;; 01_basic_ui.el ends here
