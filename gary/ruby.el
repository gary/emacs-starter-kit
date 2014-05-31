;;; gary/ruby.el

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
;;; gary/ruby.el ends here
