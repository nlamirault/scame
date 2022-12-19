; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.
;
; SPDX-License-Identifier: Apache-2.0

;;; os.el -*- lexical-binding: t; -*-

(defconst linux-p (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux))
  "Are we running on a GNU/Linux system ?")

(defconst darwin-p (eq system-type 'darwin)
  "Are we on OSX ?")

(defconst cygwin-p (eq system-type 'cygwin))

(defvar nt-p (eq system-type 'windows-nt))

(defvar meadow-p (featurep 'meadow))

(defvar windows-p (or cygwin-p nt-p meadow-p)
  "Are we on Windows ?")

(defconst console-p (eq (symbol-value 'window-system) nil)
  "Are we in a console?")

;; UI
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode 1)

(setq x-select-enable-clipboard t)

(add-hook 'nlinum-mode-hook #'nlinum-hl-mode)

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)




(provide 'os)