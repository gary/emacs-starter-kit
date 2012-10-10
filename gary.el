;;; gary.el

(setq custom-file (concat esk-user-dir "/custom.el"))

;; FIXME: void variable ido-kill-emacs-hook wtf?
(add-hook 'coding-hook 'turn-on-visual-line-mode)

(provide 'gary-init)
;;; gary.el ends here
