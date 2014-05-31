;;; gary/magit.el

(customize-save-variable 'magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
(customize-save-variable 'magit-use-overlays nil)

(provide 'gary/magit)
;;; gary/magit.el ends here
