;;;  -*- lexical-binding: t; -*-

;;; NOTE Basic Configuration
;;;

(let ((time (string-to-number (format-time-string "%H"))))
  (if (and (< time 18)
           (> time 6))
      (setq doom-theme 'doom-one-light)
    (setq doom-theme 'doom-dark+)))
;;(setq doom-theme 'doom-one-light)
(setq doom-font (font-spec :family "等距更纱黑体 SC" :size 16))
      ;; doom-variable-pitch-font (font-spec :family "等距更纱黑体 T SC"
      ;;                                     :size 11
      ;;                                     :width 'extra-condensed
      ;;                                     :weight 'normal
      ;;                                     :slant 'normal))
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Sarasa Mono T SC" :size 18))
      ;;doom-big-font (font-spec :family "Sarasa Mono T SC" :size 20))

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.doom.d/lisp")

(require 'init-lsp)
(require 'init-nox)
(require 'init-python)
(require 'init-ui-enhance)



(moo/toggle-auto-switch-theme t)
(defun moo/edit-my-doom-config ()
  "Open doom custom configuration in Dired"
  (interactive)
  (dired-at-point "~/.doom.d"))

;; `Modeline'
(setq doom-modeline-buffer-file-name-style 'file-name
      ;;       doom-modeline-icon (display-graphic-p)
      ;;       doom-modeline-major-mode-icon t)
      doom-modeline-window-width-limit 'fill-column
      doom-modeline-major-mode-color-icon t
      doom-modeline-buffer-state-icon nil
      doom-modeline-buffer-modification-icon t
      doom-modeline-unicode-fallback nil
      ;;       doom-modeline-minor-modes (featurep 'minions)
      doom-modeline-enable-word-count t
      doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
      ;;       doom-modeline-buffer-encoding nil
      doom-modeline-indent-info t
      doom-modeline-checker-simple-format t
      ;;       doom-modeline-vcs-max-length 12
      ;;       doom-modeline-persp-name nil
      doom-modeline-lsp t
      ;;       doom-modeline-github nil
      ;;       doom-modeline-github-interval (* 30 60)
      ;;       doom-modeline-env-version t
      doom-modeline-height 30
      doom-modeline-bar-width 6)

;; `ORG' - Plugins
;; TODO Keybindings
;;(global-set-key "\C-ct" 'google-translate-at-point)
;;(global-set-key "\C-cT" 'google-translate-query-translate)
;; new version already set those key.
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
(setq default-justification 'full)
(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))

;; Fix org emphasis
(setq org-emphasis-regexp-components
      ;; markup 记号前后允许中文
      (list (concat " \t('\"{"            "[:nonascii:]")
            (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
            " \t\r\n,\"'"
            "."
            1))
;; bullets is too small
;;(setq org-bullets-bullet-list '("⚀" "⚁" "⚂" "⚃" "⚄" "⚅"))
(setq org-bullets-bullet-list '("§"))
;; TODO `org-capture' capture note and inspiron.
(server-start)
(require 'org-protocol)
(setq org-directory "~/GitRepos/philosophers-stone")
(setq org-agenda-files '("~/GitRepos/philosophers-stone/"))
(setq org-capture-templates
      `(;; 存放在相应headline节点下，%i的作用是？%a是一个ref链接
        ("n" "Note" entry (file+olp+datetree ,(expand-file-name "inbox.org" org-directory))
         "* %^{Title}\n%?\n"
         :empty-lines 1
         :prepend t)
        ("p" "Protocol" entry (file+olp+datetree ,(expand-file-name "inbox.org" org-directory))
         "* %^{Title}\nSource: %u, %a\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n%?\n"
         :empty-lines 1
         :prepend t)
        ("L" "Procotol Link" entry (file+olp+datetree ,(expand-file-name "inbox.org" org-directory))
         "* %? | [[%:link][%:description]] \nCaptured On: %U\n"
         :empty-lines 1
         :prepend t)))

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

;; `:ui' `hl-todo' Sets keyword and color of its highlighted
(with-eval-after-load 'hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))
;; `posframe' of built-in
;; (with-eval-after-load 'helm
;;   (setq +helm-posframe-text-scale nil
;;         ;; maybe, built-in will discard in the future.
;;         +helm-posframe-parameters '((internal-border-width . 8)
;;                                     (width . 0.5)
;;                                     (height . 0.35)
;;                                     (min-width . 80)
;;                                     (min-height . 16))))
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
;; (use-package! lpy
;;   :hook ((python-mode . lpy-mode))
;;   :config
;;   (require 'le-python)
;;   (map! :map lpy-mode-map
;;         :i "C-p" #'previous-line
;;         :i "C-n" #'next-line))

(use-package! move-text
  :after python
  :config
  (map! :map python-mode-map
        "M-p" 'move-text-up
        "M-n" 'move-text-down))

(setq conda-anaconda-home "/home/mooziisp/.miniconda3")
;;(setq lsp-python-ms-executable "mspyls")
(setq lsp-python-ms-dir (expand-file-name "mspyls/" user-emacs-directory))

(use-package! pkgbuild-mode
  :config
  (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
                                auto-mode-alist)))

;; (use-package! eaf
;;  :config
;;  (disable-command 'eaf-open-qutebrowser)
;;  (disable-command 'eaf-open-browser)
;;  (disable-command 'eaf-open-camera)
;;  (disable-command 'eaf-open-terminal)
;;  (disable-command 'eaf-file-sender-qrcode)
;;  (disable-command 'eaf-file-receiver-qrcode)
;;  (disable-command 'eaf-file-transfer-airshare)
;;  (disable-command 'eaf-open-demo))

;; FIXME should not text
(use-package! wakatime-mode
  :config
  (setq wakatime-api-key nil))
(setq shell-file-name "/bin/bash")

;; Test
(prodigy-define-service
  :name "File Share"
  :command "python"
  :args '("-m" "http.server" "6001")
  :cwd "/home/mooziisp"
  :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

;;; for remote lsp
(setq password-cache-expiry nil)

