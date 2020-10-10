(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
;; slime
(require 'slime)
(slime-setup '(slime-asdf slime-repl slime-scratch slime-presentations slime-media))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
;; end slime
(add-to-list 'load-path (expand-file-name "~/.emacs.d/neotree"))
(require 'neotree)
(global-set-key [f7] 'neotree-hidden-file-toggle)
(global-set-key [f8] 'neotree-toggle)

;; ido
(require 'ido)
(ido-mode t)
(icomplete-mode t)
(ido-everywhere t)

;;(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;; bookmarks
(require 'bookmark)
(setq bookmark-save-flag t)
(setq bookmark-default-file (concat user-emacs-directory "bookmarks"))
(when (file-exists-p bookmark-default-file)
  (bookmark-load bookmark-default-file t))
(global-set-key (kbd "<f6>") 'bookmark-delete)
(global-set-key (kbd "<f3>") 'bookmark-set)
(global-set-key (kbd "<f4>") 'bookmark-jump)
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list)

;; prettify-symbols-mode
(setq prettify-symbols-alist
      '(("lambda" . 955)
        ("alambda" . 955)
        ("->" . 8594)
        ("=>" . 8658)))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
(require 'livedown)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/go-mode.el"))
(autoload 'go-mode "go-mode" t nil)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/gocode/emacs"))
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/goflymake"))
(require 'go-flymake)
(require 'go-flycheck)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/my"))
(require 'hooks)
(require 'settings)

;; snippets
;; (require 'yasnippet)
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
;; (add-hook 'lisp-mode-hook #'yas-minor-mode)
;; (add-hook 'slime-repl-mode-hook #'yas-minor-mode)
;; (setq yas-indent-line 'auto)
;; (setq yas-also-auto-indent-first-line t)
;; (setq yas-also-indent-empty-lines t)
;; (yas-reload-all t)

;; browser
;; (add-to-list 'load-path "~/.emacs.d/emacs-application-framework")
;; (require 'eaf)

