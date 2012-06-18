;;; gary/ruby.el --- My Ruby codes are perfect.  Kidding.

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-h r") 'ri)
     (define-key ruby-mode-map (kbd "C-c C-e") 'ruby-insert-end)))

(add-to-list 'auto-mode-alist '("builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Guardfile$" . ruby-mode))

;;; ruby-mode 1.0 relic
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(add-hook 'ruby-mode-hook 'idle-highlight)

(load-library (concat esk-user-dir
                      "/snippets/contrib/yasnippets-rspec/setup.el"))
(load-library (concat esk-user-dir
                      "/snippets/contrib/yasnippets-rails/setup.el"))

(provide 'ruby)
;; gary/ruby.el ends here
