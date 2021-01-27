;;; site-lisp/config/init-ui.el -*- lexical-binding: t; -*-

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'auto
        doom-modeline-icon (display-graphic-p)
        ;;       doom-modeline-major-mode-icon t)
        doom-modeline-window-width-limit fill-column
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-unicode-fallback t
        ;;       doom-modeline-minor-modes (featurep 'minions)
        doom-modeline-enable-word-count nil ; TODO need to support chinese word count
        doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
        ;;       doom-modeline-buffer-encoding nil
        doom-modeline-indent-info nil
        doom-modeline-workspace-name t
        doom-modeline-persp-name t
        doom-modeline-persp-icon t
        doom-modeline-checker-simple-format t
        ;;       doom-modeline-vcs-max-length 12
        ;;       doom-modeline-persp-name nil
        doom-modeline-lsp t
        ;;       doom-modeline-github nil
        ;;       doom-modeline-github-interval (* 30 60)
        ;;       doom-modeline-env-version t
        doom-modeline-height 24
        doom-modeline-bar-width 6))

(after! hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))
