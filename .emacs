(setq inhibit-startup-message t)
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))
(color-theme-tango)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq indent-tabs-mode t) ;indent using tabs
(setq tab-width 2) ;tab width
(show-paren-mode t)
