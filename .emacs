(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(require 'ido)
;; slime
(require 'slime)
(slime-setup '(slime-asdf slime-repl slime-scratch slime-presentations slime-media))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
;; end slime
(add-to-list 'load-path (expand-file-name "~/.emacs.d/neotree"))
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f7] 'neotree-hidden-file-toggle)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (wombat))
 '(display-line-numbers t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(explicit-shell-file-name "/bin/zsh")
 '(ident-tab-mode nil)
 '(ido-mode t nil (ido))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "sbcl" t)
 '(lisp-body-ident 2)
 '(livedown-autostart nil)
 '(livedown-browser nil)
 '(livedown-open t)
 '(livedown-port 1337)
 '(menu-bar-mode nil)
 '(neo-smart-open t)
 '(package-selected-packages
   (quote
    (flycheck markdown-mode swank-cdt auto-complete paredit slime)))
 '(query-replace-highlight nil)
 '(redisplay-dont-pause t t)
 '(ring-bell-function (quote ignore))
 '(scroll-step 1)
 '(scrooll-margin 4)
 '(search-highlight t)
 '(select-enable-clipboard t)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(shell-file-name "/bin/zsh")
 '(slime-auto-select-connection always)
 '(slime-auto-start (quote always))
 '(slime-net-coding-system (quote utf-8-unix))
 '(standart-indent 4)
 '(tab-width 4)
 '(tooltip-mode nil)
 '(use-dialog-box nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
