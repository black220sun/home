(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.aliases\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.work\\'" . sh-mode))
(add-to-list 'auto-mode-alist '(".lex-antlr\\'" . antlr-mode))
(add-to-list 'auto-mode-alist '(".lex-antlr4\\'" . antlr-mode))
(add-to-list 'auto-mode-alist '(".typ\\'" . sql-mode))
(add-to-list 'auto-mode-alist '(".tyb\\'" . sql-mode))
(add-to-list 'auto-mode-alist '(".sql\\'" . sql-mode))
(add-to-list 'auto-mode-alist '(".cpy\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '(".cob\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '(".jcl\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(defun prog-hook ()
  (auto-complete-mode t)
  (paredit-mode t))
(add-hook 'prog-mode-hook 'prog-hook)
(add-hook 'slime-repl-mode-hook 'prog-hook)

(add-hook 'markdown-mode-hook 'livedown-preview)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(defun override-slime-repl-bindings-with-paredit ()
   (define-key slime-repl-mode-map
	      (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;auto-complete-slime
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

(defun new-before-save-hook ()
  (when (eq major-mode 'prog-mode)
    (progn
      (delete-trailing-whitespace))))
(add-hook 'before-save-hook #'new-before-save-hook)

(defadvice yes-or-no-p (around hack-exit (prompt))
  (if (string= prompt "Active processes exist; kill them and exit anyway? ")
      t
    ad-do-it))

(provide 'hooks)
