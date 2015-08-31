;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(include-plugin "auctex")
(load "auctex.el" -1 1 1)

 (setq TeX-auto-save t)
 (setq TeX-parse-self t)
 (setq-default TeX-master nil)
 (add-hook 'LaTeX-mode-hook 'visual-line-mode)
 (add-hook 'LaTeX-mode-hook 'flyspell-mode)
 (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
 (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
 (setq reftex-plug-into-AUCTeX t)
 (setq TeX-PDF-mode t)

 (add-hook 'LaTeX-mode-hook (lambda ()
    (push
        '("latexmk" "/usr/texbin/latexmk %t" TeX-run-TeX nil t
              :help "Run latexmk on file")
         TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
       '(("PDF Viewer" "/usr/bin/open -a Preview.app %o")))




(provide 'latex-settings)

