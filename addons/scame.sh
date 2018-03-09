#!/bin/bash

# Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

EMACS_DIR="/tmp/scame/"
rm -fr ${EMACS_DIR} && mkdir -p ${EMACS_DIR}
cp -r src/* ${EMACS_DIR}
cp addons/init.el ${EMACS_DIR}
cd ${EMACS_DIR}
emacs -q --no-site-file --no-site-lisp --no-x-resources -l ${EMACS_DIR}/init.el --debug-init
