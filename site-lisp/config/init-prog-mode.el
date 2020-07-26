
(use-package! pkgbuild-mode
  :config
  (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
                                auto-mode-alist)))

(provide 'init-prog-mode)
