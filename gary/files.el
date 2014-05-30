;;; gary/files.el --- Central point for managing components' files/dirs

(let ((var-directory (concat user-emacs-directory "var/")))
  (setq bookmark-default-file        (concat var-directory "emacs.bmk")
        ido-save-directory-list-file (concat var-directory "ido.last")
        ispell-personal-dictionary   (concat var-directory "ispell_english")
        recentf-save-file            (concat var-directory "recentf")
        save-place-file              (concat var-directory "places")
        server-auth-dir              (concat var-directory "server/")
        slime-repl-history-file      (concat var-directory "slime-history.eld")
        smex-save-file               (concat var-directory "smex-items")
        tramp-persistency-file-name  (concat var-directory "tramp")
        ))

(provide 'gary/files)
;;; gary/files.el ends here
