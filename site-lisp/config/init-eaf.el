(use-package! eaf
  ;;:load-path "~/.doom.d/site-lisp/extensions/emacs-application-framework"
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (setq eaf-proxy-type "socks5")
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "1080"))


(provide 'init-eaf)
