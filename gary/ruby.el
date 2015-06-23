;;; gary/ruby.el

(eval-after-load 'rbenv
  (progn
    (global-rbenv-mode)
    (setq enh-ruby-program rbenv-ruby-shim)))
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
(eval-after-load 'ruby-end (ruby-end-mode))

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))

(ad-activate 'rspec-compile)

(add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

(customize-set-variable 'rspec-use-rbenv t)

(setq enh-ruby-program rbenv-ruby-shim)

(provide 'gary/ruby)
;;; gary/ruby.el ends here
