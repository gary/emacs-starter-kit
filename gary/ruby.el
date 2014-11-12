;;; gary/ruby.el

(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

;;; ruby-mode 1.0 relic
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(eval-after-load 'rbenv
  (progn
    (global-rbenv-mode)
    (setq enh-ruby-program rbenv-ruby-shim)))

(add-hook 'enh-ruby-mode-hook 'ri-bind-key)
(add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)

(setq enh-ruby-program rbenv-ruby-shim)

(provide 'gary/ruby)
;;; gary/ruby.el ends here
