
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; color theme
(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-tango"))
(load-theme 'tango-dark 1)

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
			:foundry "apple" 
			:family "Monaco"))
