(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inferior-lisp-program "sbcl" t)
 '(package-selected-packages
   (quote
    (flycheck markdown-mode swank-cdt auto-complete paredit slime)))
 '(slime-auto-select-connection (quote always))
 '(slime-auto-start (quote always))
 '(livedown-autostart nil)
 '(livedown-open t)
 '(livedown-port 1337)
 '(livedown-browser nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'ido)
(ido-mode t)
(defun prog-hook ()
  (auto-complete-mode t)
  (paredit-mode t))
(add-hook 'prog-mode-hook 'prog-hook)
(add-hook 'slime-repl-mode-hook 'prog-hook)
(cua-mode)
(show-paren-mode)
;; slime
(require 'slime)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-asdf slime-repl slime-scratch slime-presentations slime-media))
(require 'slime-autoloads)
;;
(add-to-list 'slime-contribs 'slime-fancy)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/neotree"))
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f7] 'neotree-hidden-file-toggle)
(setq neo-smart-open t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
(require 'livedown)
(add-hook 'markdown-mode-hook 'livedown-preview)
