;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
(include-plugin "magit")
(require 'magit)

(include-plugin "evil")
(require 'evil)
(evil-mode 1)

;-----------;
;;; Modes ;;;
;-----------;

;; Markdown mode
(require 'markdown-settings)

;; LaTeX and Auctex
;;(require 'latex-settings)

;; Matlab mode
(require 'matlab-settings)



;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
