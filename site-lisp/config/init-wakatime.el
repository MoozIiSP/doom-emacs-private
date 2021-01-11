;; FIXME should not text
(use-package! wakatime-mode
  :config
  (setq wakatime-api-key "84edde0b-dd0b-4f6f-9b1c-7a1f591b70d8")
  (setq shell-file-name "/bin/bash"))

(global-wakatime-mode)

(provide 'init-wakatime)
