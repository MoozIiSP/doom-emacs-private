;;;  -*- lexical-binding: t; -*-

;;; Some bugs:
;;; 1. cannot complete path by file name in helm.
;;; 2. cannot type enter to complete function name by company.
;;; FIXME Unicode bugs
(set-charset-priority 'unicode-bmp)

;;(setq wakatime-cli-path "/bin/wakatime")

;;; NOTE Basic Configuration
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Sarasa Mono SC" :size 18))
      ;;doom-variable-pitch-font (font-spec :family "Sarasa Mono T SC"))
      ;;                                     :size 22
      ;;                                     :width 'extra-condensed
      ;;                                     :weight 'normal
      ;;                                     :slant 'normal)
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Noto Sans Mono" :size 18)
      ;;doom-big-font (font-spec :family "Sarasa Mono T SC" :size 24))
(setq +doom-modeline-height 26
      +doom-modeline-buffer-file-name-style 'relative-to-project)

;; `ORG' - Plugins
;; Keybindings
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
;; new version already set those key.
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; `org-translate' Google Translate
(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
      google-translate-listen-url "http://translate.google.cn/translate_tts"
      google-translate--tkk-url "http://translate.google.cn/")
;; bullets is too small
(setq org-bullets-bullet-list '("⚀" "⚁" "⚂" "⚃" "⚄" "⚅"))
;; TODO `org-capture' capture note and insipron.
;;(server-start)
;;(require 'org-protocol)
(setq org-directory "~/GitRepos/philosophers-stone")
(setq org-agenda-files '("~/GitRepos/philosophers-stone/personal/flow"))
(setq org-capture-templates
      '(;; 存放在相应headline节点下，%i的作用是？%a是一个ref链接
        ("n" "Note" entry (file+datetree "~/GitRepos/philosophers-stone/personal/flow/inbox.org")
         "* %^{Title}\n#+begin_quote\n%i\n\nSource: %u, %a\n#+end_quote\n %?"
         :empty-lines 1
         :prepend t)
        ("c" "Clipboard" entry (file+datetree "~/GitRepos/philosophers-stone/personal/flow/inbox.org")
         "* %^{Title}\n#+begin_quote\n%x\n#+end_quote\n %?"
         :empty-lines 1
         :prepend t)))
(with-eval-after-load 'org
  (setq org-match-substring-regexp
        (concat
         ;; 限制上标和下标的匹配范围，org 中对其的介绍见：(org) Subscripts and superscripts
         "\\([0-9a-zA-Zα-γΑ-Ω]\\)\\([_^]\\)\\("
         "\\(?:" (org-create-multibrace-regexp "{" "}" org-match-sexp-depth) "\\)"
         "\\|"
         "\\(?:" (org-create-multibrace-regexp "(" ")" org-match-sexp-depth) "\\)"
         "\\|"
         "\\(?:\\*\\|[+-]?[[:alnum:].,\\]*[[:alnum:]]\\)\\)")))
;; TODO ui
(setq org-ellipsis " ≡ ")
;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft")
(setq deft-recursive t)
;; `org-noter'
(setq org-noter-notes-search-path '("~/GitRepos/philosophers-stone/draft"))

;; change company buffer width of sidebar
;;(setq company-slid)

;; `:ui' `hl-todo' Sets keyword and color of its highlighted
(with-eval-after-load 'hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))
;; `pretty-symbols'
(set-pretty-symbols! 'python-mode nil)
(set-pretty-symbols! 'cc-mode nil)
(set-pretty-symbols! 'julia-mode nil)
(set-pretty-symbols! 'org-mode
  :name          "»"
  :src_block     ""
  :src_block_end "«")
;; `posframe' of built-in
(with-eval-after-load 'helm
  (setq +helm-posframe-text-scale nil
        ;; maybe, built-in will discard in the future.
        +helm-posframe-parameters '((internal-border-width . 8)
                                    (width . 0.5)
                                    (height . 0.35)
                                    (min-width . 80)
                                    (min-height . 16))))
;; `Treemacs'
;;(global-set-key (kbd "C-x\t") 'treemacs)
;; `:completion' `swiper-helm' Searching
(global-set-key (kbd "C-s") 'swiper-helm)

;;; Extension
;; TODO `ein'
;;(setq ein-)

;; disable minor-mode `lispy-mode' for major mode `emacs-lisp-mode'
(remove-hook 'emacs-lisp-mode-hook #'lispy-mode)
(remove-hook 'emacs-lisp-mode-hook #'flycheck-mode)

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

;; FIXME refactor: eaf, in the future
;; (def-package! eaf
;;   :init (require 'eaf))
