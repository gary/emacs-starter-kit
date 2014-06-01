;;; gary/mode-alists.el -- Mode alists missed by the modes

(mapc (lambda (mode-alist)
        (add-to-list 'auto-mode-alist mode-alist))

      '(("\\.applescript$" . applescript-mode)
        ("\\.scpt$"        . applescript-mode)
        ("\\.mdown$"       . markdown-mode)
        ("\\.mkdn$"        . markdown-mode)
        ("\\.mkd$"         . markdown-mode)
        ("\\mdwn$"         . markdown-mode)
        ("builder$"        . ruby-mode)
        ("Guardfile"       . ruby-mode)
        ("Procfile"        . ruby-mode)
        ("Puppetfile"      . ruby-mode)
        ("\\.zsh$"         . shell-script-mode)))

(provide 'gary/mode-alists)
