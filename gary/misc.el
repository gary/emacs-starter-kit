;;; gary/misc.el --- Things that don't fit anywhere else

(ansi-color-for-comint-mode-on)

;; Enable select, disabled features
(put 'narrow-to-region 'disabled nil)   ; narrow enabled
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)      ; change case enabled
(put 'eval-expression 'disabled nil)    ; allow eval commands

(setq ack-prompt-for-directory t
      auto-save-default nil
      browse-url-browser-function 'browse-url-default-macosx-browser
      deft-use-filename-as-title t
      ffap-require-prefix t
      ido-confirm-unique-completion t
      ido-default-buffer-method 'selected-window
      ido-use-filename-at-point t
      initial-scratch-message nil
      minibuffer-max-depth nil
      solarized-distinct-fringe-background t
      solarized-high-contrast-mode-line t
      skeleton-pair t
      uniquify-after-kill-buffer-p t
      uniquify-buffer-name-style 'reverse
      uniquify-ignore-buffers-re "^\\*"
      uniquify-separator "|"
      yank-pop-change-selection t
      )

;; Replace the contents of a selection with typed text
(delete-selection-mode t)

;; Incremental minibuffer completion
(icomplete-mode 1)

(ido-everywhere t)

;; Chrome integration
(edit-server-start)

(eval-after-load 'yasnippet
  (yas-global-mode 1))
(add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)

;; Keep and trash selected buffers
(midnight-delay-set 'midnight-delay 4400)
(add-to-list 'clean-buffer-list-kill-never-buffer-names "*msg*")
(add-to-list 'clean-buffer-list-kill-never-regexps "^\\*shell-")
(append clean-buffer-list-kill-buffer-names '("*Shell Command Output*"
                                              "*Completions*"
                                              "*Occur*"
                                              "*Bookmark List*"
                                              "*Ediff Registry*"
                                              "*ack*"
                                              "ri `"
                                              "*markdown-output*"))
(add-to-list 'clean-buffer-list-kill-regexps "\\.rb$")
(add-to-list 'clean-buffer-list-kill-regexps "\\.el$")

(provide 'gary/misc)
;;; gary/misc.el ends here
