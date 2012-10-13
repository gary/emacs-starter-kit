;;; gary/misc.el --- Things that don't fit anywhere else

;; Additional autoloads
(add-to-list 'auto-mode-alist '("\\.applescript$" . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.scpt$"        . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(ansi-color-for-comint-mode-on)

;; Enable select, disabled features
(put 'narrow-to-region 'disabled nil)   ; narrow enabled
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)      ; change case enabled
(put 'eval-expression 'disabled nil)    ; allow eval commands

(setq yank-pop-change-selection t
      ffap-require-prefix t
      skeleton-pair t
      auto-save-default nil
      minibuffer-max-depth nil
      uniquify-buffer-name-style 'reverse
      uniquify-separator "|"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; Replace the contents of a selection with typed text
(delete-selection-mode t)

;; Incremental minibuffer completion
(icomplete-mode 1)

(when (> emacs-major-version 21)
  (ido-everywhere t)
  (setq ido-confirm-unique-completion t
        ido-default-buffer-method 'selected-window
        ido-use-filename-at-point t))

;; ack
(setq ack-prompt-for-directory t)

(eval-after-load 'yasnippet
  (yas-global-mode 1))
(add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)

;; More precise temporary file management
(setq version-control t
      kept-new-versions 16
      kept-old-versions 2
      delete-old-versions t
      backup-by-copying-when-linked t)

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

;; Chrome integration
(let ((edit-server (concat esk-user-dir "/../tmp/edit-server.el")))
     (if (file-exists-p edit-server)
         (progn
           (load-file edit-server)
           (edit-server-start))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun swap-split () ; TODO: broken as of 23; rewrite
  "Swaps the orientation of two split windows."
  (interactive)
  (save-excursion
    (let ((b2 (window-buffer (second (window-list))))
          (side-by-side (not (window-split-horizontally-p))))
      (if (one-window-p)
          (message "You need exactly 2 windows to do this.")
        (delete-other-windows)
        (if side-by-side
            (progn
              (split-window-vertically)         ; spatial
              (message "Swapped horizontally")) ; visual!
          (split-window-horizontally (/ (third (window-edges)) 2))
          (message "Swapped vertically")))
      (display-buffer b2 t nil))))

(defun swap-windows ()
 "If you have 2 windows, it swaps them."
 (interactive)
 (cond ((not (= (count-windows) 2))
        (message "You need exactly 2 windows to do this."))
       (t
        (let* ((w1 (first (window-list)))
               (w2 (second (window-list)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)))))

(defun vi-open-next-line (arg)
  "Move to the next line (like vi) and then opens a line."
  (interactive "p")
  (if (looking-at "^")
      (open-line arg)
    (end-of-line)
    (open-line arg)
    (next-line 1)
    (indent-according-to-mode)))

(defun zap-up-to-char (arg char)
  "Kill up to and excluding ARG'th occurrence of CHAR.
Goes backward if ARG is negative; error if CHAR not found."
  (interactive "*p\ncZap up to char: ")
  (kill-region (point)
               (progn
                 (search-forward
                  (char-to-string char) nil nil arg)
                 (progn (goto-char
                         (if (> arg 0) (1- (point)) (1+ (point))))
                        (point)))))

(provide 'gary/misc)
;;; gary/misc.el ends here
