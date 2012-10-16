;;; gary/ruby.el --- My Ruby codes are perfect.  Kidding.

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c C-e") 'ruby-insert-end)))

(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

(add-to-list 'auto-mode-alist '("builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Guardfile$" . ruby-mode))

;;; ruby-mode 1.0 relic
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'ri-bind-key)

(provide 'gary/ruby)
;; gary/ruby.el ends here
