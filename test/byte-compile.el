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

;(require 'eglot)
(require 'find-lisp)

(let ((files (find-lisp-find-files-internal
              "."
              (lambda (file dir)
                (and (not (file-directory-p (expand-file-name file dir)))
                    (string-match "\\.el$" file)
                     (not (member file '(".dir-locals.el"
                                         "package-quickstart.el"
                                         "custom-set-variables.el"
                                         "early-init.el")))))
              (lambda (dir parent)
                (member dir '("src"))))))
  (dolist (file files)
    (message "Compiling %s" file)
    (byte-compile-file file)))

(provide 'byte-compile)
