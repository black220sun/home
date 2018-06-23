(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.aliases\\'" . sh-mode))

(defun prog-hook ()
  (auto-complete-mode t)
  (paredit-mode t))
(add-hook 'prog-mode-hook 'prog-hook)
(add-hook 'slime-repl-mode-hook 'prog-hook)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
(add-hook 'markdown-mode-hook 'livedown-preview)

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
