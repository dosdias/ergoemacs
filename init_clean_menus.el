;-*- coding: utf-8 -*-

;; the purpose of this file is to create a more clean menu.
;; Rationale:
;; • Emacs's Menu Usability Problem
;;   http://xahlee.org/emacs/modernization_menu.html

;; file menu

;; get rid of the whole default File menu
(define-key global-map [menu-bar file] nil)

;; create new File menu
(define-key
  global-map
  [menu-bar file]
  (cons "File" (make-sparse-keymap "hoot hoot")) ;; the hoot hoot is there because i wasn't clear what exactly that string technically is.
  )

(define-key global-map [menu-bar file exit-emacs] '("Quit" . save-buffers-kill-emacs))
(define-key global-map [menu-bar file separator5] '("--"))
(define-key global-map [menu-bar file one-window] '("Unsplit Window" . delete-other-windows))
(define-key global-map [menu-bar file split-window-leftright] '("Split Window left/right" . split-window-horizontally))
(define-key global-map [menu-bar file split-window] '("Split Window" . split-window-vertically))
(define-key global-map [menu-bar file separator4] '("--"))
(define-key global-map [menu-bar file ps-print-buffer-faces] '("Print (font+color)" . ps-print-buffer-faces))
(define-key global-map [menu-bar file print-buffer] '("Print" . print-buffer))
(define-key global-map [menu-bar file separator3] '("--"))

;; add a language modes menu
(define-key global-map [menu-bar file lang-modes] (cons "Language Modes" (make-sparse-keymap "major modes")))

(define-key global-map [menu-bar file lang-modes bash] '("Bash" . sh-mode))
(define-key global-map [menu-bar file lang-modes tcl] '("TCL" . tcl-mode))
(define-key global-map [menu-bar file lang-modes ruby] '("Ruby" . ruby-mode))
(define-key global-map [menu-bar file lang-modes python] '("Python" . python-mode))
(define-key global-map [menu-bar file lang-modes php] '("PHP" . php-mode))
(define-key global-map [menu-bar file lang-modes perl] '("Perl" . cperl-mode))
(define-key global-map [menu-bar file lang-modes separator1] '("--"))
(define-key global-map [menu-bar file lang-modes haskell] '("Haskell" . haskell-mode))
(define-key global-map [menu-bar file lang-modes ocaml] '("OCaml" . tuareg-mode))
(define-key global-map [menu-bar file lang-modes elisp] '("Emacs Lisp" . emacs-lisp-mode))
(define-key global-map [menu-bar file lang-modes separator2] '("--"))
(define-key global-map [menu-bar file lang-modes latex] '("LaTeX" . latex-mode))
(define-key global-map [menu-bar file lang-modes js] '("Javascript" . js2-mode))
(define-key global-map [menu-bar file lang-modes xml] '("XML (xml-mode)" . xml-mode))
(define-key global-map [menu-bar file lang-modes nxml] '("XML (nxml-mode)" . nxml-mode))
(define-key global-map [menu-bar file lang-modes html] '("HTML" . html-mode))
(define-key global-map [menu-bar file lang-modes css] '("CSS" . css-mode))
(define-key global-map [menu-bar file lang-modes separator3] '("--"))
(define-key global-map [menu-bar file lang-modes java] '("Java" . java-mode))
(define-key global-map [menu-bar file lang-modes c++] '("C++" . c++-mode))
(define-key global-map [menu-bar file lang-modes c] '("C" . c-mode))

(define-key global-map [menu-bar file separator2] '("--"))
(define-key global-map [menu-bar file revert-buffer] '("Revert" . revert-buffer))
(define-key global-map [menu-bar file write-file] '("Save As…" . write-file))
(define-key global-map [menu-bar file save-buffer] '("Save" . save-buffer))
(define-key global-map [menu-bar file separator1] '("--"))
(define-key global-map [menu-bar file kill-buffer] '("Close" . close-current-buffer))
(define-key global-map [menu-bar file open-file] '("Open…" . find-file))
(define-key global-map [menu-bar file make-frame] '("New Frame" . make-frame-command))
(define-key global-map [menu-bar file new-file] '("New" . new-empty-buffer))

;; edit menu
(define-key global-map [menu-bar edit search search-forward] nil)
(define-key global-map [menu-bar edit search search-backward] nil)
(define-key global-map [menu-bar edit search re-search-forward] nil)
(define-key global-map [menu-bar edit search re-search-backward] nil)
(define-key global-map [menu-bar edit search repeat-search-fwd] nil)
(define-key global-map [menu-bar edit search repeat-search-back] nil)

(define-key global-map [menu-bar edit goto go-to-pos] nil)
(define-key global-map [menu-bar edit goto beg-of-buf] nil)
(define-key global-map [menu-bar edit goto end-of-buf] nil)

;; options menu

; remove stuff
(define-key global-map [menu-bar options cua-mode] nil)
(define-key global-map [menu-bar options transient-mark-mode] nil)

(define-key global-map [menu-bar options blink-cursor-mode] nil)
(define-key global-map [menu-bar options debug-on-error] nil)
(define-key global-map [menu-bar options debug-on-quit] nil)

(define-key global-map [menu-bar options showhide showhide-tool-bar] nil)
(define-key global-map [menu-bar options showhide showhide-scroll-bar] nil)
(define-key global-map [menu-bar options showhide showhide-fringe] nil)

(define-key global-map [menu-bar options showhide mac-font-panel-mode] nil)
(define-key global-map [menu-bar options showhide showhide-battery] nil)
(define-key global-map [menu-bar options showhide showhide-date-time] nil)
(define-key global-map [menu-bar options showhide size-indication-mode] nil)

(define-key global-map (kbd "<S-down-mouse-1>") nil)

;; add a command to toggle by cursor move by visual line.
;; todo: need to make the menu reflect current state
(define-key global-map [menu-bar options line-move-visual] '("Toggle ↑↓ Move by Visual Line" . toggle-line-move-visual))

;; add font scale change
(define-key global-map [menu-bar options zoom-in] '("Zoom In" . text-scale-increase))
(define-key global-map [menu-bar options zoom-out] '("Zoom Out" . text-scale-decrease))
(define-key global-map [menu-bar options zoom-reset] '("Zoom Reset" . text-scale-normal-size))

;; • need to group the zoom in/out/reset menu into a submenu

;; buffers menu
(define-key global-map [menu-bar buffer next-buffer] '("Next User Buffer" . next-user-buffer))
(define-key global-map [menu-bar buffer previous-buffer] '("Previous User Buffer" . previous-user-buffer))
(define-key global-map [menu-bar buffer next-emacs-buffer] '("Next Emacs Buffer" . next-emacs-buffer))
(define-key global-map [menu-bar buffer previous-emacs-buffer] '("Previous Emacs Buffer" . previous-emacs-buffer))

(define-key global-map [menu-bar buffer list-all-buffers] '("List All Buffers" . ibuffer))

;; tools menu
(define-key global-map [menu-bar tools gnus] nil)
(define-key global-map [menu-bar tools rmail] nil)
(define-key global-map [menu-bar tools compose-mail] nil)
(define-key global-map [menu-bar tools games] nil)

;; obsolete, outdated contents. Much replaced by web.
(define-key global-map [menu-bar help-menu getting-new-versions] nil)
(define-key global-map [menu-bar help-menu describe-distribution] nil)

(define-key global-map [menu-bar help-menu external-packages] nil) (define-key global-map [menu-bar help-menu more] nil)

(define-key global-map [menu-bar help-menu emacs-known-problems] nil)
(define-key global-map [menu-bar help-menu emacs-problems] nil)
(define-key global-map [menu-bar help-menu find-emacs-packages] nil)

;; outdated humor and tech
(define-key global-map [menu-bar help-menu eliza] nil) (define-key global-map [menu-bar help-menu emacs-psychotherapist] nil)

;; antiquated tutorial. If it needs a tutorial, something is wrong with UI.
(define-key global-map [menu-bar help-menu emacs-tutorial] nil)
(define-key global-map [menu-bar help-menu emacs-tutorial-language-specific] nil)
(define-key global-map [menu-bar help-menu emacs-faq] nil)
(define-key global-map [menu-bar help-menu search-documentation emacs-terminology] nil)

;; remove FSF propaganda. (already linked in About Emacs)
(define-key global-map [menu-bar help-menu about-gnu-project] nil)
(define-key global-map [menu-bar help-menu describe-copying] nil)
(define-key global-map [menu-bar help-menu describe-no-warranty] nil)
(define-key global-map [menu-bar help-menu more-manuals order-emacs-manuals] nil)
(define-key global-map [menu-bar help-menu manuals order-emacs-manuals] nil)
(define-key global-map [menu-bar help-menu about-gnu-project] nil)

;; TODO: 

;; • possibly add menu that shows the current minor modes in effect. (To implement, probably just call describe-mode. ) We might need this since we made C-h m to be describe-major-mode instead of describe-mode. But again maybe not since minor-modes is rather very technical specific to emacs, a concept and feature not in most editors.

;; • re-create menus from scratch, instead of piggy back to remove add. (done for the File menu) Because piggy back is difficult to do and manage and subject to emacs changes. 

;; • move incremental search menus one level up.
;; • remove redundant dividers
;; • reorg the help menu and submenu.

;; • when recentf-mode minor mode is on, it adds a Open Recent menu item under File at bottom after Quit. Needs to be after Open. Looking at the code, it uses easymenu.el to do things. Need fix.

;; • the code can be improved. Right now it uses define-key repeatedly. It can be just a key map.