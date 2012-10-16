(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages
  '(starter-kit
    starter-kit-eshell starter-kit-lisp starter-kit-ruby
    browse-kill-ring
    coffee-mode color-theme
    flymake-haml flymake-ruby flymake-sass
    full-ack
    gist
    haml-mode handlebars-mode httpcode
    imgur
    js2-mode
    markdown-mode
    ruby-end
    sass-mode scala-mode scss-mode slime slime-js
    yaml-mode yasnippet yari)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
