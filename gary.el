;;; gary.el

;; FIXME: void variable ido-kill-emacs-hook wtf?
(add-hook 'coding-hook 'turn-on-visual-line-mode)
(setq initial-scratch-message "(smex-initialize)\n;;; drag GUI to 163 x 73")

(provide 'gary-init)
;;; gary.el ends here
