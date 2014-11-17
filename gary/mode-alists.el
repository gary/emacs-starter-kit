;;; gary/mode-alists.el -- Mode alists missed by the modes

(mapc (lambda (mode-alist)
        (add-to-list 'auto-mode-alist mode-alist))

      '(("\\.applescript$" . applescript-mode)
        ("\\.scpt$"        . applescript-mode)
        ("Brewfile"        . conf-unix-mode)
        ("\\.mdown$"       . markdown-mode)
        ("\\.mkdn$"        . markdown-mode)
        ("\\.mkd$"         . markdown-mode)
        ("\\mdwn$"         . markdown-mode)
        ("builder$"        . enh-ruby-mode)
        ("\\.ru$"          . enh-ruby-mode)
        ("\\.rake$"        . enh-ruby-mode)
        ("\\.thor$"        . enh-ruby-mode)
        ("Capfile"         . enh-ruby-mode)
        ("Gemfile\\'"      . enh-ruby-mode)
        ("Thorfile$"       . enh-ruby-mode)
        ("Guardfile$"      . enh-ruby-mode)
        ("Procfile$"       . enh-ruby-mode)
        ("Puppetfile$"     . enh-ruby-mode)
        ("Vagrantfile$"    . enh-ruby-mode)
        ("\\.zsh$"         . shell-script-mode)))

(provide 'gary/mode-alists)
