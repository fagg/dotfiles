(require 'erc)
(require 'tls)

(defun erc-freenode ()
  (interactive)
  (erc-tls :server "irc.freenode.net" :port 7000 :nick "ashf" :full-name "A"))

(add-hook 'erc-after-connect
          '(lambda (SERVER NICK)
             (cond
               ((string-match "freenode\\.net" SERVER)
                (erc-message "PRIVMSG" "NickServ IDENTIFY BackDoor0")
                (sit-for 10)
                (erc-join-channel "##C")
                (erc-join-channel "##C++")
                (erc-join-channel "#space")))))

(provide 'erc-private)
