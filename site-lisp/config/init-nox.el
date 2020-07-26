;;; ~/.doom.d/lisp/init-nox.el -*- lexical-binding: t; -*-


(use-package! nox
  ;; :init
  ;; (dolist (hook (list
  ;;                ;;'js-mode-hook
  ;;                ;;'rust-mode-hook
  ;;                'python-mode-hook
  ;;                ;;'ruby-mode-hook
  ;;                ;;'java-mode-hook
  ;;                'sh-mode-hook
  ;;                ;;'php-mode-hook
  ;;                'c-mode-common-hook
  ;;                'c-mode-hook
  ;;                'c++-mode-hook))
  ;;                ;;'haskell-mode-hook

  ;;   (add-hook hook '(lambda () (nox-ensure))))
  :config
  (setq nox-python-server-dir (concat user-emacs-directory
                                      (file-name-as-directory ".local")
                                      (file-name-as-directory "etc")
                                      (file-name-as-directory "lsp")
                                      (file-name-as-directory "mspyls"))))

(provide 'init-nox)
