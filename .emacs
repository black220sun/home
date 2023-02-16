(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(setq package-selected-packages
      '(;; common
        bookmark
        neotree
        ido
        yasnippet
        ;; lsp common
        lsp-mode lsp-treemacs flycheck company ;; auto-complete-config
        ;; go
        go-mode go-autocomplete ;; go-flycheck
        ;; lisp
        slime ;; slime-autoloads
        ;; clojure
        clojure-mode cider clj-refactor))
(package-initialize)
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; slime
(require 'slime)
(slime-setup '(slime-asdf slime-repl slime-scratch slime-presentations slime-media))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)

;;(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
;;(require 'livedown)

(require 'go-mode)
(autoload 'go-mode "go-mode" t nil)
(ac-config-default)

;; snippets
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
(setq yas-indent-line 'auto)
(setq yas-also-auto-indent-first-line t)
(setq yas-also-indent-empty-lines t)
(yas-reload-all t)

;; asdf
(add-to-list 'load-path (expand-file-name "~/.emacs.d/asdf.el/"))
(require 'asdf)
(asdf-enable)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/my"))
(require 'settings)
(require 'hooks)
(require 'keybinds)
(require 'o-mode)

(defun tunnel ()
  (interactive)
  (cider-nrepl-connect '(:host "localhost"
                               :port 8777
                               :repl-type "clj"
                               :repl-init-function nil
                               :session-name "remote REPL")))

