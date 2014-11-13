; color theme
(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-midnight"))
(color-theme-midnight)

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
                        :foundry "apple" 
                        :family "Monaco"))

(provide 'theme-settings)
