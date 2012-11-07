;;; girlfriend.local.el --- Platform specific tweaks for OS X

(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))

(when window-system
  (progn (setq ns-antialias-text t
                   ns-input-font "Inconsolata"
                   ns-input-fontsize 14
                   ns-pop-up-frames nil)
             (ns-respond-to-change-font)))

(defun default-frame-position ()
  (progn
    ;; laptop runs 1440x900
    (set-frame-size (selected-frame) 165 65)
    (set-frame-position (selected-frame) 400 0)))

;; command is alt in osx
(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta
          mac-option-modifier 'alt))

(provide 'girlfriend.local)
;;; girlfriend.local.el ends here
