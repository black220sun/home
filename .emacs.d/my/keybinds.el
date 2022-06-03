;; neotree
(global-set-key [f7] 'neotree-hidden-file-toggle)
(global-set-key [f8] 'neotree-toggle)

;; bookmark
(global-set-key (kbd "<f6>") 'bookmark-delete)
(global-set-key (kbd "<f3>") 'bookmark-set)
(global-set-key (kbd "<f4>") 'bookmark-jump)
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list)

;; highlight
(global-set-key (kbd "C-x /") 'highlight-symbol-at-point)
(global-set-key (kbd "C-x <up>") 'highlight-symbol-prev)
(global-set-key (kbd "C-x <down>") 'highlight-symbol-next)
(global-set-key (kbd "C-x C-_") 'highlight-symbol-remove-all)

;; slime
(global-set-key (kbd "C-c M-p") 'slime-sync-package-and-default-directory)
(global-set-key (kbd "C-c M-r") 'slime-restart-inferior-lisp)

;; paredit ext
(global-set-key (kbd "C-x <deletechar>") (lambda ()
                                           (interactive)
                                           (paredit-split-sexp)
                                           (backward-char)
                                           (paredit-close-parenthesis)
                                           (paredit-join-sexps)))
(global-set-key (kbd "C-x <C-delete>") (lambda ()
                                         (interactive)
                                         (let ((start (point)))
                                           (forward-char)
                                           (paredit-close-parenthesis)
                                           (kill-region start (point)))))
(global-set-key (kbd "C-x <C-up>") 'paredit-raise-sexp)

;; git
(global-set-key (kbd "C-x n") 'git-gutter+-next-hunk)
(global-set-key (kbd "C-x p") 'git-gutter+-previous-hunk)
(global-set-key (kbd "C-x l") 'git-gutter+-show-hunk-inline-at-point)
(global-set-key (kbd "C-x v a") 'magit-stage)
(global-set-key (kbd "C-x v A") 'magit-stage-modified)
(global-set-key (kbd "C-x v w") 'magit-unstage)
(global-set-key (kbd "C-x v W") 'magit-unstage-all)
(global-set-key (kbd "C-x v c") 'magit-commit-create)
(global-set-key (kbd "C-x v C") 'magit-commit)
(global-set-key (kbd "C-x v t") 'magit-status)
(global-set-key (kbd "C-x v b") 'magit-blame-addition)
(global-set-key (kbd "C-x v B") 'magit-blame)
(global-set-key (kbd "C-x v D") 'magit-diff)
(global-set-key (kbd "C-x v d") 'magit-diff-working-tree)
(global-set-key (kbd "C-x v l") 'magit-log-current)
(global-set-key (kbd "C-x v L") 'magit-log-all-branches)
(global-set-key (kbd "C-x v m") 'magit-merge)
(global-set-key (kbd "C-x v u") 'magit-pull-from-upstream)
(global-set-key (kbd "C-x v U") 'magit-pull)
(global-set-key (kbd "C-x v p") 'magit-push-to-upstream)
(global-set-key (kbd "C-x v P") 'magit-push)
(global-set-key (kbd "C-x v h") 'magit-branch-checkout)
(global-set-key (kbd "C-x v n") 'magit-branch-and-checkout)
(global-set-key (kbd "C-x v R") 'magit-reset-hard)
(global-set-key (kbd "C-x v r") 'magit-reset)
(global-set-key (kbd "C-x v v") 'magit-revert)
(global-set-key (kbd "C-x v s") 'magit-stash)

;; lang fix
(global-set-key (kbd "C-x и") 'switch-to-buffer)
(global-set-key (kbd "C-x щ") 'other-window)
(global-set-key (kbd "C-x ш") 'switch-to-prev-buffer)
(global-set-key (kbd "C-x з") 'switch-to-next-buffer)
(global-set-key (kbd "C-x й") 'quit-window)

(provide 'keybinds)
