;;; gary/ruby.el

(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

(eval-after-load 'rbenv
  (progn
    (global-rbenv-mode)
    (setq enh-ruby-program rbenv-ruby-shim)))
(eval-after-load 'ruby-end (ruby-end-mode))

(add-hook 'enh-ruby-mode-hook 'ri-bind-key)
(add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)

(setq enh-ruby-program rbenv-ruby-shim)

(provide 'gary/ruby)
;;; gary/ruby.el ends here
