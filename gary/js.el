;;; gary/js.el

(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

(provide 'js)
;;; gary/js.el ends here
