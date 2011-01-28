(load "auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/autocomplete/dict")
(ac-config-default)
(setq ac-auto-start nil)
(setq ac-delay 0)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
(global-set-key "\M-/" 'auto-complete)

;(require 'gccsense)
;(add-hook 'c-mode-common-hook
;         (lambda ()
;           (local-set-key (kbd "\M-/ .") 'ac-complete-gccsense)))