;;; site-lisp/config/init-wsl.el -*- lexical-binding: t; -*-

(after! org-download
  (setq org-download-screenshot-method "~/.doom.d/bin/emacs-screenshot %s"))

(after! mathpix
  (setq mathpix-screenshot-method "~/.doom.d/bin/emacs-screenshot %s"))

(provide 'init-wsl)
