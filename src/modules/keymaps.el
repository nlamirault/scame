;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;; SPDX-License-Identifier: Apache-2.0

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

;;; keymaps.el -*- lexical-binding: t; -*-

(use-package which-key
  :straight t
  :init
   (which-key-mode)
   (setq which-key-popup-type 'side-window)
   (setq which-key-side-window-max-width 0.33)
   (setq which-key-side-window-max-height 0.25)
   (setq which-key-idle-delay 0.3)
   (which-key-setup-minibuffer))



(provide 'keymaps)
