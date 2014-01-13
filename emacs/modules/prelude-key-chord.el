;;; prelude-key-chord.el --- Key chord setup
;;
;; Copyright © 2011-2013 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure key-chord key bindings.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(prelude-require-package 'key-chord)

(require 'key-chord)

(key-chord-define-global "vv" 'evil-normal-state)
(key-chord-define-global "jk" 'save-buffer)
(key-chord-define-global "jl" 'save-buffers-kill-terminal)
(key-chord-define-global "j;" 'kill-emacs)

(key-chord-define-global "qq" 'ace-jump-word-mode)
(key-chord-define-global "ee" 'ace-jump-line-mode)
(key-chord-define-global "rr" 'ace-jump-char-mode)
(key-chord-define-global "JJ" 'prelude-switch-to-previous-buffer)
(key-chord-define-global "uu" 'undo-tree-visualize)
(key-chord-define-global "xx" 'execute-extended-command)
(key-chord-define-global ";;" 'browse-kill-ring)

(key-chord-mode +1)

(provide 'prelude-key-chord)

;;; prelude-key-chord.el ends here
