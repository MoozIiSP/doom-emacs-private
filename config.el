;;;  -*- lexical-binding: t; -*-

;;; NOTE Basic Configuration
;;;
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Sarasa Mono T SC" :size 18)
      doom-variable-pitch-font (font-spec :family "Sarasa Mono T SC"
                                          :size 22
                                          :width 'extra-condensed
                                          :weight 'normal
                                          :slant 'normal)
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      doom-unicode-font (font-spec :family "Sarasa Mono T SC" :size 18)
      doom-big-font (font-spec :family "Sarasa Mono T SC" :size 24))

;; `Modeline'
;; (setq doom-modeline-buffer-file-name-style 'relative-to-project
;;       doom-modeline-icon (display-graphic-p)
;;       doom-modeline-major-mode-icon t
;;       doom-modeline-major-mode-color-icon t
;;       doom-modeline-buffer-state-icon nil
;;       doom-modeline-buffer-modification-icon nil
;;       doom-modeline-minor-modes (featurep 'minions)
;;       doom-modeline-enable-word-count nil
;;       doom-modeline-buffer-encoding nil
;;       doom-modeline-indent-info t
;;       doom-modeline-checker-simple-format t
;;       doom-modeline-vcs-max-length 12
;;       doom-modeline-persp-name nil
;;       doom-modeline-lsp t
;;       doom-modeline-github nil
;;       doom-modeline-github-interval (* 30 60)
;;       doom-modeline-env-version t
;;       doom-modeline-bar-width 6)



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

(setq org-emphasis-regexp-components
      ;; markup 记号前后允许中文
      (list (concat " \t('\"{"            "[:nonascii:]")
            (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
            " \t\r\n,\"'"
            "."
            1))
;; bullets is too small
(setq org-bullets-bullet-list '("⚀" "⚁" "⚂" "⚃" "⚄" "⚅"))
;; TODO `org-capture' capture note and insipron.
(server-start)
(require 'org-protocol)
(setq org-directory "~/GitRepos/philosophers-stone")
(setq org-agenda-files '("~/GitRepos/philosophers-stone/personal/flow"))
(setq org-capture-templates
      `(;; 存放在相应headline节点下，%i的作用是？%a是一个ref链接
        ("n" "Note" entry (file+datetree ,(expand-file-name "personal/flow/inbox.org" org-directory))
         "* %^{Title}\n%?\n"
         :empty-lines 1
         :prepend t)
        ("p" "Protocol" entry (file+datetree ,(expand-file-name "personal/flow/inbox.org" org-directory))
         "* %^{Title}\nSource: %u, %a\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n%?\n"
         :empty-lines 1
         :prepend t)
        ("L" "Procotol Link" entry (file+datetree ,(expand-file-name "personal/flow/inbox.org" org-directory))
         "* %? | [[%:link][%:description]] \nCaptured On: %U\n"
         :empty-lines 1
         :prepend t)))
;;(expand-file-name "personal/flow/inbox.org" org-directory)
(setq org-startup-truncated t)
;; TODO ui
(setq org-ellipsis " ≡ ")
;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft")
(setq deft-recursive t)
;; `org-noter'
(setq org-noter-notes-search-path '("~/GitRepos/philosophers-stone/draft"))

;; `Latex-Extension'
;; (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[a4paper]{ctexart}"
;;                                   ;; ("\\section{%s}" . "\\section*{%s}")
;;                                   ;; ("\\subsection{%s}" . "\\subsection*{%s}")
;;                                   ;; ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                                   ;; ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                                   ;; ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
;;                                   ))

;; `org-ref'
(setq reftex-default-bibliography '("~/bibliography/references.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/bibliography/notes.org"
      org-ref-default-bibliography '("~/bibliography/references.bib")
      org-ref-pdf-directory "~/bibliography/bibtex-pdfs/")

(setq bibtex-completion-bibliography "~/bibliography/references.bib"
      bibtex-completion-library-path "~/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/bibliography/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

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
;; (global-set-key (kbd "C-s") 'swiper-helm)



;;; Extension
;; TODO `ein'
;;(setq ein-)

;; disable minor-mode `lispy-mode' for major mode `emacs-lisp-mode'
(remove-hook 'emacs-lisp-mode-hook #'lispy-mode)
(remove-hook 'emacs-lisp-mode-hook #'flycheck-mode)
(remove-hook 'org-mode-hook #'auto-fill-mode)

;; `Python'
(def-package! lpy
  :hook ((python-mode . lpy-mode))
  :config
  (require 'le-python)
  (map! :map lpy-mode-map
        :i "C-p" #'previous-line
        :i "C-n" #'next-line))

(def-package! move-text
  :after python
  :config
  (map! :map python-mode-map
        "M-p" 'move-text-up
        "M-n" 'move-text-down))

(setq conda-anaconda-home "/home/mooziisp/.conda")

(def-package! lsp-julia
  :config
  (add-hook 'julia-mode-hook #'lsp-mode)
  (setq lsp-julia-default-environment "~/.julia/environments/v1.1"))

(def-package! lsp-racket
  :hook (racket-mode . lsp-racket))

;; `leetcode'
;; leetcode configuration
(def-package! leetcode
  :config
  (setq lc-user-name-email "ttp_0001@163.com"
        lc-user-password "Ttp123456."
        lc-perfer-lang "python3"))
