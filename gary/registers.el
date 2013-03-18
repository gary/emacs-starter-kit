;;; gary/registers.el --- Set up registers

;; Registers allow you to jump to a file or other location
;; quickly. Use C-x r j followed by the letter of the register (i for
;; init.el, r for this file) to jump to it.

(dolist (r `((?i (file . ,(concat user-emacs-directory "init.el")))
             (?b (file . ,(concat esk-user-dir "/bindings.el")))
             (?d (file . ,(concat "~/.homesick/repos/" user-login-name
                                  "/dotfiles/home/.zshrc")))
             (?m (file . ,(concat esk-user-dir "/misc.el")))
             (?r (file . ,(concat esk-user-dir "/registers.el")))))
  (set-register (car r) (cadr r)))

(provide 'gary/registers)
;;; gary/registers.el ends here
