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
    ack-and-a-half
    browse-kill-ring
    coffee-mode csv-mode
    deft dictionary
    edit-server enh-ruby-mode exec-path-from-shell
    feature-mode flymake-coffee flymake-go flymake-haml flymake-puppet
    flymake-sass
    gist git-commit-mode gitconfig-mode gitignore-mode go-mode
    haml-mode handlebars-mode httpcode
    imgur inf-ruby
    js2-mode
    key-chord
    markdown-mode multi-term
    puppet-mode
    rbenv rhtml-mode rspec-mode rubocop ruby-end
    sass-mode scala-mode scss-mode slim-mode slime slime-js solarized-theme
    textile-mode
    wgrep-ack
    xkcd
    yaml-mode yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
