(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(include-plugin "auctex")
(load "auctex.el" -1 1 1)
(load "preview-latex.el" -1 1 1)
(if (system-is-mac)
    (require 'tex-site)
    (require 'font-latex)
    (setq TeX-view-program-list
          (quote
           (("Preview"
             (concat "/Applications/Preview.app/Contents/MacOS/Preview"
                     " %n %o %b")))))
    (setq TeX-view-program-selection
          (quote (((output-dvi style-pstricks) "dvips and gv")
                  (output-dvi "open")
                  (output-pdf "Preview")
                  (output-html "open")))))
; always start the server for inverse search
(setq-default TeX-source-correlate-start-server 0)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (tex-pdf-mode 1)
            (TeX-source-correlate-mode 1)))
(provide 'latex-settings)

