;;; gary/defuns.el --- Tweaking the look and feel of Emacs

;; Daemonization

(if (daemonp)
    (progn
      (defun spartan-gui ()
        "Restore the look and feel that running in daemon mode cannot account
for when attached via a GUI client."
        (interactive)
        (setq ns-command-modifier 'meta)

        ;; FIXME: blows the daemon up when called twice
        ;; (setq ns-antialias-text t
        ;;       ns-input-font "Inconsolata"
        ;;       ns-input-fontsize 14
        ;;       ns-pop-up-frames nil)
        ;; (ns-respond-to-change-font)

        ;; restore look and feel
        (color-theme-blackboard)
        (opacity-modify t)
        (set-frame-width (selected-frame) 161) ; 2 frames @ 80 chars + fringe
        (set-frame-height (selected-frame) 71))

      (defun spartan-cli ()
        "Restore the look and feel that running in daemon mode cannot account
for when attached via a CLI client"
        (interactive)
        ;; dark in a tty, tolerable in the gui
        (color-theme-zenburn))))

(provide 'defuns)
;;; gary/defuns.el ends here
