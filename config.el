;;;  -*- lexical-binding: t; -*-

;;; FIXME Unicode bugs
(set-charset-priority 'unicode-bmp)

(setq wakatime-cli-path "/bin/wakatime")

;;; NOTE Basic Configuration
(setq doom-version "[ce38a80c]")
(setq doom-theme 'doom-opera-light)
(setq doom-font (font-spec :family "Noto Sans Mono CJK SC" :size 20)
      doom-variable-pitch-font (font-spec :family "Noto Sans Mono"
                                          :size 22
                                          :width 'extra-condensed
                                          :weight 'normal
                                          :slant 'normal)
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Noto Sans Mono" :size 18)
      doom-big-font (font-spec :family "Noto Mono" :size 24))
(setq +doom-modeline-height 28
      +doom-modeline-buffer-file-name-style 'relative-to-project)

;; `ORG' - Plugins
;; TODO `org-translate' Google Translate
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
      google-translate-listen-url "http://translate.google.cn/translate_tts"
      google-translate--tkk-url "http://translate.google.cn/")
(setq org-directory "~/workspace/TrLib/")
(setq org-agenda-files '("~/workspace/TrLib/flow/"))
;; bullets is too small
(setq org-bullets-bullet-list '("⚀" "⚁" "⚂" "⚃" "⚄" "⚅"))
;; TODO `org-capture'

;; `:ui' `hl-todo' Sets keyword and color of its highlighted
(with-eval-after-load 'hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))
;; INFO `posframe' of built-in
(setq +helm-posframe-text-scale nil
      ;; maybe, built-in will discard in the future.
      +helm-posframe-parameters '((internal-border-width . 4)
                                  (width . 0.5)
                                  (height . 0.35)
                                  (min-width . 80)
                                  (min-height . 16)))

;; `:completion' `swiper-helm' Searching
(global-set-key (kbd "C-s") 'swiper-helm)

;;; Extension
;; TODO `ein'
;;(setq ein-)
;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft")
(setq deft-recursive t)

;; disable minor-mode `lispy-mode' for major mode `emacs-lisp-mode'
(remove-hook 'emacs-lisp-mode-hook #'lispy-mode)

(def-package! lpy
  :hook ((python-mode . lpy-mode))
  :config
  (require 'le-python)
  (map! :map lpy-mode-map
        :i "C-p" #'previous-line
        :i "C-n" #'next-line))

(def-package! py-isort
  :after python
  :config
  (map! :map python-mode-map
        :localleader
        :n "s" #'py-isort-buffer
        :v "s" #'py-isort-region))

(def-package! yapfify
  :after python
  :hook (python-mode . yapf-mode)
  :config
  (map! :map python-mode-map
        :localleader
        :nv "=" #'yapfify-buffer))
