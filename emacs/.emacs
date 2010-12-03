(setq visible-bell t)
(setq inhibit-startup-message t)
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/company")
(add-to-list 'load-path "~/.emacs.d/plugins/styles")
(add-to-list 'load-path "~/.emacs.d/plugins/completion-ui")
;(add-to-list 'load-path "~/.emacs.d/plugins/company")
;(autoload 'company-mode "company" nil t)
;(require 'completion-ui)


(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/adi.hodos/.emacs.d/ac-dict")
(ac-config-default)
(global-set-key "\M-/" 'auto-complete)
(setq ac-auto-start nil)
(setq ac-delay 0)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

;(require 'gccsense)
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-gccsense)))

(line-number-mode 1)
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(require 'zenburn)
(color-theme-zenburn)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-G") 'what-line)

;; move (shift) a line of text up or down like you would do in Eclipse
;; pressing Alt-Up (or Down)
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let ((col (current-column))
        start
        end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (forward-char)
    (setq end (point))
    (let ((line-text (delete-and-extract-region start end)))
      (forward-line n)
      (insert line-text)
      ;; restore point to original column in moved line
      (forward-line -1)
      (forward-char col))))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "<M-up>") 'move-line-up)  ; FIXME M-Up multiply bound!
(global-set-key (kbd "<M-down>") 'move-line-down)

;; undo some previous changes
(global-set-key (kbd "<f11>") 'undo)
(global-set-key (kbd "<S-f1>") 'man-follow)
;; same behavior as woman when manpage is ready
(setq Man-notify-method 'newframe)

;; scroll line by line
(setq scroll-step 1)

;; special words
(setq keywords-critical-pattern
      "\\(BUGS\\|FIXME\\|TODO\\|todo\\|XXX\\|[Ee][Rr][Rr][Oo][Rr]\\|[Mm][Ii][Ss][Ss][Ii][Nn][Gg]\\|[Ii][Nn][Vv][Aa][Ll][Ii][Dd]\\|[Ff][Aa][Ii][Ll][Ee][Dd]\\|[Cc][Oo][Rr][Rr][Uu][Pp][Tt][Ee][Dd]\\)")
(make-face 'keywords-critical)
(set-face-attribute 'keywords-critical nil
                    :foreground "red" :background "yellow"
                    :weight 'bold)
                    
(defun fontify-keywords ()
  (interactive)
;;;   (font-lock-mode -1)
;;;   (font-lock-mode 1)
  (font-lock-add-keywords nil
    `((,keywords-critical-pattern 1 'keywords-critical prepend))))
;; FIXME                        0                  t

;; set up highlighting of special words for selected major modes *and* all
;; major modes derived from them
(dolist (hook '(c++-mode-hook
                c-mode-hook
                change-log-mode-hook
                cperl-mode-hook
                css-mode-hook
                emacs-lisp-mode-hook
                html-mode-hook
                java-mode-hook
                latex-mode-hook
                lisp-mode-hook
                makefile-mode-hook
                message-mode-hook
                php-mode-hook
                python-mode-hook
                sh-mode-hook
                shell-mode-hook
                ssh-config-mode-hook))
  (add-hook hook 'fontify-keywords))    
  
;; delete all the trailing whitespaces and tabs across the current buffer
(defun my-delete-trailing-whitespaces-and-untabify ()
  "Delete all the trailing white spaces, and convert all tabs to multiple
spaces across the current buffer."
  (interactive "*")
  (delete-trailing-whitespace)
  (untabify (point-min) (point-max)))

(global-set-key (kbd "C-c t") 'my-delete-trailing-whitespaces-and-untabify) 

;; show the line number in each mode line
(line-number-mode 1)

;; show the column number in each mode line
(column-number-mode 1)               

(setq my-set-cursor-color-color "")
(setq my-set-cursor-color-buffer "")
(defun my-set-cursor-color-according-to-mode ()
      "Change cursor color according to some minor modes."
      (let ((color
             (if buffer-read-only "purple1"
               (if overwrite-mode "red"
                 "rgb:15/FF/00"))))  ;; insert mode
        (unless (and (string= color my-set-cursor-color-color)
                     (string= (buffer-name) my-set-cursor-color-buffer))
          (set-cursor-color (setq my-set-cursor-color-color color))
          (setq my-set-cursor-color-buffer (buffer-name)))))

(add-hook 'post-command-hook 'my-set-cursor-color-according-to-mode)

(dolist (hook '(c-mode-hook
                c++-mode-hook
                cperl-mode-hook
                shell-mode-hook
                text-mode-hook
                change-log-mode-hook
                makefile-mode-hook
                message-mode-hook
                texinfo-mode-hook))
      (add-hook hook (lambda ()
                       (interactive)
                       (column-marker-1 78)
                       (column-marker-2 79)
                       (column-marker-3 80))))
                       
(global-set-key (kbd "C-c m") 'column-marker-1)      

;; excellent!
(defun answers-define ()
  "Look up the word under cursor in a browser."
  (interactive)
  (browse-url
   (concat "http://social.msdn.microsoft.com/Search/en-US?query="
           (thing-at-point 'word))))
(global-set-key (kbd "<f1>") 'answers-define)    

;; replace current buffer text with the text of the visited file on disk
(defun my-revert-buffer ()
  "Unconditionally revert current buffer."
  (interactive)
  (flet ((yes-or-no-p (msg) t))
    (revert-buffer)))

;; key binding
(global-set-key (kbd "<C-f12>") 'my-revert-buffer)
;; rebind `C-x C-b'
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)      

(defun my-kill-this-buffer ()
  "Kill the current buffer without confirmation (if not modified)."
  (interactive)
;;;   (let ((bufname (buffer-name)))
;;;     (if (or
;;;          (string-equal "*Group*" bufname))
;;;         (bury-buffer bufname)
      (kill-buffer nil))
;;;       ))

;; key binding
(global-set-key (kbd "C-x C-k") 'my-kill-this-buffer)  

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
   (global-set-key (kbd "C-c z") 'w32-restore-frame))

(global-set-key (kbd "C-c z") 'w32-maximize-frame)

(defun w32-restore-frame ()
    "Restore a minimized frame."
     (interactive)
     (w32-send-sys-command 61728)
     (global-set-key (kbd "C-c z") 'w32-maximize-frame))    
     
(mwheel-install)
(menu-bar-mode 0)             
(tool-bar-mode 0)
(defun indent-whole-buffer ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-for-tab-command)))
    
(show-paren-mode t)
(setq scalable-fonts-allowed t)
(modify-all-frames-parameters '((font . "-outline-Consolas-normal-r-normal-normal-20-90-96-96-c-*-iso8859-1"))) 

;; visit a file
(global-set-key (kbd "<f3>") 'find-file)

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
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
