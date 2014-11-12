;;; gary/multi-term.el

;; TODO:
;;   * make multi-term-dedicated mimic visor
;;   * use multi-term-dedicated-window-p to set cwd on startup?
;;   * multi-term-dedicated-toggle
;;   * make multi-term-dedicated-handle-other-window-advice toggle
;;     dedicated beneath all open windows, not just current

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000
                  term-prompt-regexp "[a-z]+@[a-z]+ \\(\\w\\|\\W\\)+ [#$%>] *"
                  )

            (auto-fill-mode -1)
            (compilation-shell-minor-mode 1)
            (make-local-variable 'transient-mark-mode)
            (setq skeleton-pair nil
                  tab-width 8
                  transient-mark-mode nil
                  yas-dont-activate t
                  )

            ;; toggle raw/cooked sub modes
            (define-key term-mode-map (kbd "C-j") 'term-char-mode)
            (define-key term-raw-map (kbd "C-j") 'term-line-mode)

            ;; rebinds
            (add-to-list 'term-unbind-key-list "M-N")
            (add-to-list 'term-bind-key-alist
                         '("C-w" . term-send-backward-kill-word))
            (add-to-list 'term-unbind-key-list "M-M")
            (add-to-list 'term-bind-key-alist
                         '("M-d" . term-send-forward-kill-word))

            (add-to-list 'term-bind-key-alist '("C-a" . term-bol))
            (add-to-list 'term-bind-key-alist '("C-e" . end-of-line))
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            ))
; (multi-term-dedicated-handle-other-window-advice nil)
(provide 'gary/multi-term)
;;; gary/multi-term.el ends here
