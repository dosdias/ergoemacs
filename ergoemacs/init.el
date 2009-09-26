; -*- coding: utf-8 -*-

(add-to-list 'load-path (file-name-directory (or load-file-name buffer-file-name)))
(add-to-list 'load-path 
	     (concat (file-name-directory (or load-file-name buffer-file-name)) "../packages"))

;; Tool-bar has to be turned-off as soon as possible so the user cannot see it
(tool-bar-mode 0) ;; Not sure we should have this on. The way it is right now, is rather useless for anyone who would use emacs, and i don't think it really provide any UI improvement because there's the menu already. The icons are rather very ugly. Possibly we can improve the icons, and or add a Close button to it.

;; Load ergoemacs minor mode
(load "ergoemacs-keybindings/ergoemacs-mode")

;; ErgoEmacs configuration
(load "init_version")
(load "init_functions")
(load "init_keybinding")
(load "init_load_packages")
(load "init_settings")

;; The ergoemacs mode is the last thing to be initialized (so we can hook all packages, like iswitchb)
(ergoemacs-mode 1)

;; After initializing ergoemacs mode, we can clean menus (so ergoemacs keybindings are shown)
(load "init_clean_menus")

;; (server-start) ; this keeps emacs running just one instance. For example, a user double clicks a file, it'll just switch to a existing instance. Not sure this is best approach.
