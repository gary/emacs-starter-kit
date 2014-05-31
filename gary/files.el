;;; gary/files.el --- Central point for managing components' files/dirs

;; More precise temporary file management
(setq backup-by-copying-when-linked t
      delete-old-versions t
      kept-new-versions 16
      kept-old-versions 2
      version-control t)

(let ((var-directory (concat user-emacs-directory "var/")))
  (setq backup-directory-alist     `(("." . ,(concat var-directory "backups")))
        bookmark-default-file        (concat var-directory "emacs.bmk")
        custom-file                  (concat var-directory "custom.el")
        deft-directory               (expand-file-name "Dropbox/PlainText")
        emacs-download-dir           (concat var-directory "downloads/")
        ido-save-directory-list-file (concat var-directory "ido.last")
        ispell-personal-dictionary   (concat var-directory "ispell_english")
        recentf-save-file            (concat var-directory "recentf")
        save-place-file              (concat var-directory "places")
        slime-repl-history-file      (concat var-directory "slime-history.eld")
        smex-save-file               (concat var-directory "smex-items")
        tramp-persistency-file-name  (concat var-directory "tramp")
        xkcd-cache-dir               (concat var-directory "xkcd/")
        xkcd-cache-latest            (concat xkcd-cache-dir "latest")
        ))

(provide 'gary/files)
;;; gary/files.el ends here
