(require 'erc)
(require 'tls)
(require 'erc-services nil t)

;;;-------VISUAL SETTINGS--------;;;
;; Prompt should show the channel name
(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients)
                            (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">")
                                       'read-only t
                                       'rear-nonsticky t
                                       'front-nonsticky t)
                     (erc-propertize (concat "ERC>")
                                     'read-only t
                                     'read-nonsticky t
                                     'front-nonsticky t))))

;; This configures the behaviour of the time stamps.
(setq erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "[%H:%M] "
      erc-fill-prefix "    "
      erc-insert-timestamp-function 'erc-insert-timestamp-left)

;; This configures the buffer indenting and column width
(add-hook 'window-configuration-change-hook 
	   '(lambda ()
	      (setq erc-fill-column (- (window-width) 2))))

;;;------ NOTIFICATION AND TRACKING-----;;;
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(setq erc-auto-query 'window-noselect)
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face))
(setq erc-track-priority-faces-only 'all)

;; Buffer highlighting settings
(setq erc-current-nick-highlight-type 'all)


(defvar erc-terminal-notifier-command nil "The path to terminal-notifier.")
(setq erc-terminal-notifier-command (executable-find "terminal-notifier"))

(defun erc-terminal-notifier-notify (title message)
  "Show a message with `terminal-notifier-command`."
  (start-process "terminal-notifier"
                 "*terminal-notifier*"
                 erc-terminal-notifier-command
                 "-title" title
                 "-message" message
                 "-activate" "org.gnu.Emacs"
                 "-sender" "org.gnu.Emacs"))

(defun erc-terminal-notifier-text-matched (match-type nick message)
  "Show a notification, when user's nick is mentioned."
  (when (eq match-type 'current-nick)
    (unless (posix-string-match "^\\** *Users on #" message)
      (erc-terminal-notifier-notify
       (concat "ERC " (buffer-name (current-buffer)))
       (concat "\\<" (nth 0 (erc-parse-user nick)) "> " message)))))

(if (eq system-type 'darwin)
    (add-hook 'erc-text-matched-hook 'erc-terminal-notifier-text-matched))

(require 'erc-private) ;; these are my private settings

(provide 'erc-settings)

