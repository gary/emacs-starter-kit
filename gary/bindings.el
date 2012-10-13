;;; gary/bindings.el --- Overrides and additional, global bindings

;;; starter-kit-bindings

;; It's all about the project.
(global-set-key (kbd "C-c f") 'find-file-in-project)

;; You know, like Readline.
(global-set-key (kbd "C-w") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "<C-SPC>") 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "<C-tab>") 'bury-buffer)

(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key  (kbd "C-h r") 'info-emacs-manual) ; RTFEM

;; starter-kit reversions
(global-unset-key (kbd "C-x C-h")) ; was 'view-url
;; TODO: undo ruby-compilations' clobbering of tranpose-lines (ruby-mode)

(global-set-key (kbd "C-c r") 'revert-buffer)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one

(global-set-key (kbd "C-c t")
                (lambda (arg)
                  (interactive "P")
                  (if (null arg)
                      ;; Start a new eshell even if one is active.
                      (eshell)
                    ;; Start eshell or switch to it if it's active.
                    (eshell t))))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-c T") 'shell)

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'esk-eval-and-replace)

;; M-S-6 is awkward
(global-set-key (kbd "C-c q") 'join-line)

;; So good!
(global-set-key (kbd "C-c g") 'magit-status)

;; This is a little hacky since VC doesn't support git add internally
(eval-after-load 'vc
  (define-key vc-prefix-map "i"
    '(lambda () (interactive)
       (if (not (eq 'Git (vc-backend buffer-file-name)))
           (vc-register)
         (shell-command (format "git add %s" buffer-file-name))
         (message "Staged changes.")))))

;; Vi-style newline insertion when at bol
(global-set-key (kbd "C-o") 'vi-open-next-line)

;; Emacs overrides
(global-set-key (kbd "M-x") 'ispell-word)
(global-set-key (kbd "C-o") 'vi-open-next-line)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)
(global-set-key (kbd "<C-return>") 'set-mark-command)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "M-/") 'redo)

;; More precise character zapping
(global-set-key (kbd "C-M-z") 'zap-to-char)

;; Visualize the kill ring
(global-set-key (kbd "M-y") 'browse-kill-ring)

;; Insert skeleton pairs by default
;; TODO: refine per-mode
(global-set-key (kbd "C-c k") 'delete-pair)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

;; Frame opacity
(global-set-key (kbd "C-8") '(lambda () ; decrease
                               (interactive)
                               (opacity-modify t)))
(global-set-key (kbd "C-9") '(lambda () ; increase
                               (interactive)
                               (opacity-modify)))
(global-set-key (kbd "C-0") '(lambda ()
                               (interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

;; Prefer ack over grep
(global-set-key (kbd "C-c C-k C-a") 'ack)

;; Escape all recursive edits
(global-set-key (kbd "C-c ^") 'top-level)

;; Gisting
(global-set-key (kbd "C-c C-g g") (lambda (arg)
                                    (interactive "P")
                                    (if (null arg)
                                        (gist-region-or-buffer)
                                      (gist-region-or-buffer-private))))
(global-set-key (kbd "C-c C-g f") 'gist-fetch)

;; Time tracking
(global-set-key (kbd "C-c C-k i") 'timeclock-in)
(global-set-key (kbd "C-c C-k o") 'timeclock-out)
(global-set-key (kbd "C-c C-k c") 'timeclock-change)
(global-set-key (kbd "C-c C-k v") 'timeclock-visit-timelog)

(global-set-key [S-f12] 'swap-windows)
(global-set-key [C-f12] 'swap-split)    ; FIXME

;; Indentation help
(global-set-key (kbd "C-c <tab>") 'indent-relative)

;; Smex, bringing ido to execute-extended-command
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex-major-mode-commands)

;; Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-c C-u")
                (lambda (arg)
                  (interactive "P")
                  (if (null arg)
                      (browse-url-at-point (thing-at-point-url-at-point))
                    (view-url))))

(provide 'gary/bindings)
;;; gary/bindings.el ends here
