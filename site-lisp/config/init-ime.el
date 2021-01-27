;;; site-lisp/config/init-ime.el -*- lexical-binding: t; -*-

;;; Input Method
(use-package! rime
  :config
  (progn
    (setq default-input-method "rime"
          rime-show-candidate 'posframe
          rime-posframe-style 'vertical
          rime-user-data-dir "~/.doom.d/config/rime/")
    (after! rime-mode
      (rime-lib-select-schema "luna_pinyin_simp"))))