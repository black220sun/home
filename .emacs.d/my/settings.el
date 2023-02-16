(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;;(set-exec-path-from-shell-PATH)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(display-line-numbers nil)
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
 '(tool-bar-mode nil)
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
 '(slime-auto-select-connection 'always)
 '(slime-auto-start 'always)
 '(slime-net-coding-system 'utf-8-unix)
 '(standart-indent 4)
 '(tab-width 4)
 '(tooltip-mode nil)
 '(x-select-enable-clipboard t)
 '(use-dialog-box nil)
 '(lsp-lens-enable t)
 '(lsp-signature-auto-activate nil)
 '(treemacs-space-between-root-nodes nil)
 '(cider-allow-jack-in-without-project t)
 '(cider-auto-jump-to-error t)
 '(cider-auto-select-error-buffer t)
 '(cider-save-file-on-load t)
 '(company-minimum-prefix-length 1))

(custom-set-faces
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(cua-mode)
(show-paren-mode)

;; ido
(ido-mode t)
(icomplete-mode t)
(ido-everywhere t)

;; bookmarks
(setq bookmark-save-flag t)
(setq bookmark-default-file (concat user-emacs-directory "bookmarks"))
(when (file-exists-p bookmark-default-file)
  (bookmark-load bookmark-default-file t))

;; prettify-symbols-mode
(setq prettify-symbols-alist
      '(("lambda" . 955)
        ("alambda" . 955)
        ("->" . 8594)
        ("=>" . 8658)))

(setq cljr-insert-newline-after-require nil)
(setq cljr-favor-prefix-notation nil)

(provide 'settings)
