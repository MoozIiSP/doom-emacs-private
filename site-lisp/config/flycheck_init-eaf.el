;;; site-lisp/config/init-eaf.el -*- lexical-binding: t; -*-

(use-package! eaf
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ;;(setq eaf-proxy-type "socks5")
  ;;(setq eaf-proxy-host (getenv "wsl_localhost"))
  ;;(setq eaf-proxy-port "1089")
  )
