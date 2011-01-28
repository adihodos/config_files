;;
;; disable beep + startup messages
(setq visible-bell t)
(setq inhibit-startup-message t)

;;
;; Show line + column info
(line-number-mode 1)
(column-number-mode 1)

(setq-default indent-tabs-mode nil)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-G") 'what-line)

;;
;; Man
(global-set-key (kbd "<S-f1>") 'man-follow)
(setq Man-notify-method 'newframe)

;; scroll line by line
(setq scroll-step 1)

;; enlarge or shrink windows more easily than with `C-x {' and the like
(global-set-key (kbd "<C-S-up>") 'enlarge-window)
(global-set-key (kbd "<C-S-down>") 'shrink-window)
(global-set-key (kbd "<C-S-left>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-S-right>") 'shrink-window-horizontally)

;; make all visible windows the same height (approximately)
(global-set-key (kbd "<C-f6>") 'balance-windows)    

(defun w32-maximize-frame ()
   "Maximize the current frame."
   (interactive)
   (w32-send-sys-command 61488)
   (global-set-key (kbd "C-c Z") 'w32-restore-frame))

(global-set-key (kbd "C-c z") 'w32-maximize-frame)

(defun w32-restore-frame ()
    "Restore a minimized frame."
     (interactive)
     (w32-send-sys-command 61728)
     (global-set-key (kbd "C-c z") 'w32-maximize-frame))
     
(mwheel-install)
(menu-bar-mode 0)             
(tool-bar-mode 0)

(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-foreground 'show-paren-match-face "#FFFFFF")
(set-face-background 'show-paren-match-face "#FF7A00")
(set-face-attribute 'show-paren-match-face nil 
        :weight 'bold :underline nil :overline nil :slant 'normal)
        
(set-face-foreground 'show-paren-mismatch-face "red") 
(set-face-attribute 'show-paren-mismatch-face nil 
                    :weight 'bold :underline t :overline nil :slant 'normal)        

(setq scalable-fonts-allowed t)
;;(set-default-font "Liberation Mono-14")
(set-default-font "Dina-14")

;; open my Emacs init file
(defun my-open-dot-emacs ()
  "Opening `~/.emacs'."
  (interactive)
  (find-file "~/.emacs"))
(global-set-key (kbd "<S-f3>") 'my-open-dot-emacs)

(global-hl-line-mode 1)
(global-hl-line-highlight)
(scroll-bar-mode -1)
(global-linum-mode 1)

