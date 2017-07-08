;--------------------------------;
;;; General or Global Settings ;;;
;--------------------------------;

;(defun set-exec-path-from-shell-PATH ()
;  (let ((path-from-shell (replace-regexp-in-string
;                          "[ \t\n]*$"
;                          ""
;                          (shell-command-to-string "$SHELL -i -c 'echo $PATH'"))))
;    (setenv "PATH" path-from-shell)
;    (setq eshell-path-env path-from-shell)
;    (setq exec-path (split-string path-from-shell path-separator))
;    (setq exec-path (append exec-path '("/Library/TeX/texbin")))))

(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)

;(when window-system (set-exec-path-from-shell-PATH))

; language
(setq current-language-environment "English")

; don't show the startup screen
(setq inhibit-startup-screen 1)

; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode 0)

; don't show the scroll bar
(if window-system (scroll-bar-mode -1))

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode 1)

; number of characters until the fill column 
(setq-default fill-column 70)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq-default truncate-lines 1)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows 1)

; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(width . 180)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

; window modifications
;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)

; make end and home keys go to the start/end of buffers
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key global-map (kbd "RET") 'newline-and-indent)
; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
; indentation styles
(setq c-basic-offset 8)
(setq c-default-style (quote (
    (c-mode . "bsd") 
    (java-mode . "java") 
    (awk-mode . "awk") 
    (other . "gnu"))))
 
; ignore case when searching
(setq-default case-fold-search 1)

; set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

; require final newlines in files when they are saved
(setq require-final-newline 1)
; add a new line when going to the next line
(setq next-line-add-newlines t)

; show the current line and column numbers in the stats bar as well
(line-number-mode 1)
(column-number-mode 1)

; don't blink the cursor
(blink-cursor-mode 0)

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode 1)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

; text decoration
(require 'font-lock)
;(setq font-lock-maximum-decoration 1)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)
(setq jit-lock-contextually 1)
(setq jit-lock-stealth-verbose 1)

(size-indication-mode 0)

; disable backup
(setq backup-inhibited t)

; disable auto save
(setq auto-save-default nil)

; disable some annoying stuff
(fset 'yes-or-no-p 'y-or-n-p)

(setq display-time-mode nil)
;(setq display-time-default-load-average nil)
;(setq display-time-day-and-date nil)
;(setq display-time-24hr-format nil)
;(display-time)

(server-start)
; make mutt play nice
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
  (add-hook
      'mail-mode-hook
         (lambda ()
               (define-key mail-mode-map [(control c) (control c)]
                       (lambda ()
                                 (interactive)
                                          (save-buffer)
                                                   (server-edit)))))

(provide 'general-settings)






