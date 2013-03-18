;;; girlfriend.local.el --- Platform specific tweaks for OS X

(exec-path-from-shell-initialize)

(defun default-frame-position ()
  ;; laptop runs 1900x1200
  (set-frame-size (selected-frame) 165 82)
  (set-frame-position (selected-frame) 730 0))

(defun set-font-for-host ()
  (setq ns-antialias-text t
        ns-input-font "Menlo"
        ns-input-fontsize 12
        ns-pop-up-frames nil)
  (ns-respond-to-change-font))

;; command is alt in osx
(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta
          mac-option-modifier 'alt))

(provide 'girlfriend.local)
;;; girlfriend.local.el ends here
