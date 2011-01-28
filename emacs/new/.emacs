;;
;; doxymacs
(add-to-list 'load-path "~/.emacs.d/plugins/doxymacs")
(load "doxymacs-init.el")

;;
;; autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/autocomplete")
(load "autocomplete-init.el")

;;
;; color-theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(load "color-theme-init.el")
(color-theme-inkpot)

;;
;; python crap
(add-to-list 'load-path "~/.emacs.d/plugins/python")
(load "python-stuff-init.el")

;;
;; misc stuff
(add-to-list 'load-path "~/.emacs.d/plugins/misc")
(load "misc-stuff-init.el")

;;
;; google0-style
;;(require 'google-c-style)
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;
;; If you want the RETURN key to go to the next line and space over
;; to the right place, add this to your .emacs right after the load-file:
;;
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
