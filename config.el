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

;; `Modeline'
(setq doom-modeline-buffer-file-name-style 'file-name
      doom-modeline-icon nil
      doom-modeline-major-mode-icon nil
      doom-modeline-major-mode-color-icon t
      doom-modeline-minor-modes nil
      doom-modeline-enable-word-count t
      doom-modeline-checker-simple-format t
      doom-modeline-vcs-max-length 12
      doom-modeline-persp-name nil
      doom-modeline-lsp t
      doom-modeline-github t
      doom-modeline-github-interval (* 30 60)
      doom-modeline-env-version t)

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
;; TODO ui
(setq org-ellipsis " ≡ ")
;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft")
(setq deft-recursive t)
;; `org-noter'
(setq org-noter-notes-search-path '("~/GitRepos/philosophers-stone/draft"))

;; `Latex-Extension'
(add-to-list 'org-latex-classes '("ctexart" "\\documentclass[a4paper]{ctexart}"
                                  ("\\section{%s}" . "\\section*{%s}")
                                  ("\\subsection{%s}" . "\\subsection*{%s}")
                                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

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
(remove-hook 'org-mode-hook #'auto-fill-mode)

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

;; `BUG' Julia
;; (add-hook 'ess-julia-mode-hook #'lsp-mode)
;; (add-hook 'julia-mode-hook #'lsp-mode)

(setq conda-anaconda-home "/home/mooziisp/.conda")

;; FIXME refactor: eaf, in the future
;; (def-package! eaf
;;   :init (require 'eaf))

;; NOTE configuration of ccls
(setq ccls-executable "/bin/ccls")

(def-package! move-text
  :after python
  :config
  (map! :map python-mode-map
        "M-p" 'move-text-up
        "M-n" 'move-text-down))

(add-hook 'racket-mode-hook #'lsp-racket-enable)

;; leetcode configuration
(require 'leetcode)
(setq lc-user-name-email "ttp_0001@163.com"
      lc-user-password "Ttp123456."
      lc-perfer-lang "python3")

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

;; alternative
;; (setq bibtex-completion-pdf-open-function 'org-open-file)

;; (defun org-ref-extract-arxivId-from-pdf (pdf)
;;   "Try to extract a doi from a PDF file.
;; There may be more than one doi in the file. This function returns
;; all the ones it finds based on two patterns: doi: up to a quote,
;; bracket, space or end of line. dx.doi.org/up to a quote, bracket,
;; space or end of line.
;; If there is a trailing . we chomp it off. Returns a list of doi
;; strings, or nil.
;; "
;;   (with-temp-buffer
;;     (insert (shell-command-to-string (format "%s %s -")
;;                pdftotext-executable
;;                (shell-quote-argument (dnd-unescape-uri pdf))))
;;     (goto-char (point-min))
;;     (let ((matches '()))
;;       (while (re-search-forward org-ref-pdf-doi-regex nil t))))
;;   ;; I don't know how to avoid a trailing . on some dois with the
;;   ;; expression above, so if it is there, I chomp it off here.
;;   (let ((doi (match-string 1)))
;;     (when (s-ends-with? "." doi)
;;       (setq doi (substring doi 0 (- (length doi) 1))))
;;     (cl-pushnew doi matches :test #'equal
;;       matches)))

;; (point-max)
