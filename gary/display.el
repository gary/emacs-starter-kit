;;; gary/display.el --- Perfecting Emacs's veneer

(if (eq emacs-major-version 24)
    (load-theme 'solarized-dark t))

(blink-cursor-mode 1)

(defun init-ui (&optional frame)
  "Sets the GUI's size and position on the display."
  (interactive)
  (if frame
      (select-frame frame))
  (if (window-system)
      (cond
       ((= 1600 (display-pixel-height)) ; 30" display
        (set-frame-size (selected-frame) 163 103)
        (set-frame-position (selected-frame) 1385 0))
       (t
        (default-frame-position))))
  (split-window-horizontally)

  (set-font-for-host)

  (set-cursor-color "deeppink")

  (when window-system (opacity-modify t)))

(add-hook 'emacs-startup-hook 'init-ui)

;; Prefer vertically split window layout
(setq split-height-threshold nil)

(if (not (eq window-system nil))
    ;; Vertical fringes of 1 pixel for each window
    ;; minimal?
    (set-fringe-style 1))

;; Show buffer boundaries on the left-hande side of the fringe
(setq-default indicate-buffer-boundaries 'left)

;; Make unkempt whitespace painfully annoying
(global-whitespace-mode t)
(setq show-trailing-whitespace t)

(setq visible-bell nil
      display-time-24hr-format t
      whitespace-style '(trailing
                         lines
                         indentation
                         tabs
                         space-before-tab
                         space-after-tab)
      whitespace-line-column 79)

;; Modeline preferences
(display-time-mode)
(when (string< emacs-version "24")
         (timeclock-modeline-display))
(size-indication-mode 1)

(set-default 'truncate-lines t)

;; Highlight other instances of the symbol at point
(global-hi-lock-mode t)

(provide 'gary/display)
;;; gary/display.el ends here
