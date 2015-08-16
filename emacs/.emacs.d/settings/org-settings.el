(setq org-directory "~/Dropbox/org")
(setq org-agenda-files '("~/Dropbox/org/"))
(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "DELAYED(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "orange" :weight bold))
        ("STARTED" . (:foreground "light blue" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELLED" . (:foreground "red" :weight bold))
        ("DELAYED" . (:foreground "yellow" :weight bold))))

(provide 'org-settings)
