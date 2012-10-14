;;; gary/daemon.el --- Daemon-specific functionality

(add-hook 'after-make-frame-functions 'init-ui)

(if (daemonp)
    (progn
      (global-unset-key (kbd "C-x C-c"))
      (global-unset-key (kbd "C-z"))
      (global-unset-key (kbd "C-x C-z"))))

(provide 'gary/daemon)
;;; gary/daemon.el ends here
