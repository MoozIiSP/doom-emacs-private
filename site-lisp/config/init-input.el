;;; site-lisp/config/init-input.el -*- lexical-binding: t; -*-

(use-package! rime)

(setq default-input-method "rime")
(setq rime-show-candidate 'posframe)
(setq rime-posframe-style 'vertical)
(setq rime-user-data-dir "~/.doom.d/config/rime/")


(provide 'init-input)
