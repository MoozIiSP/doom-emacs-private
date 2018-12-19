;;;  -*- lexical-binding: t; -*-

;;; NOTE Unicode bugs
(set-charset-priority 'unicode-bmp)

;;; NOTE Key Bindings
;; Search & Replace
;; (global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "\C-xb") 'switch-to-buffer)

;; Dired single buffer
;; (with-eval-after-load 'dired-mode
;;  (define-key dired-mode-map [return] 'dired-single-buffer))
;; (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
;; (define-key dired-mode-map "^" 'dired-single-up-directory)
;; (global-set-key [(f5)] 'dired-single-magic-buffer)
;; (global-set-key "C-<F5>" (function)
;;         (lambda nil (interactive))
;;         (dired-single-magic-buffer default-directory))
;; (global-set-key [(shift f5)] (function)
;;         (lambda nil (interactive))
;;         (message "Current directory is: %s" default-directory))
;; (global-set-key [(meta f5)] 'dired-single-toggle-buffer-name)

;; Org Mode - Plugins
;; Google Translate
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
      google-translate-listen-url "http://translate.google.cn/translate_tts"
      google-translate--tkk-url "http://translate.google.cn/")

;;; NOTE Basic Configuration
(setq doom-version "[ce38a80c]")
(setq doom-theme 'doom-opera)
(setq doom-font (font-spec :family "Noto Sans Mono CJK SC" :size 18)
      doom-variable-pitch-font (font-spec :family "Noto Sans Mono"
                                          :size 22
                                          :width 'extra-condensed
                                          :weight 'normal
                                          :slant 'normal)
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Noto Sans Mono" :size 18)
      doom-big-font (font-spec :family "Noto Sans Mono" :size 25))
(setq +doom-modeline-height 30
      +doom-modeline-buffer-file-name-style 'relative-to-project)

;; How to use docsets
(setq helm-dash-docsets-path "~/.local/share/Zeal/Zeal/")

;; set hl-todo configuration
(with-eval-after-load 'hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))

;; How to set width of frame

;; NOTE ORG
(setq org-directory "~/workspace/TrLib/")
(setq org-agenda-files '("~/workspace/TrLib/flow/"))

;; NOTE `ein'
;;(setq ein-)

;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft/")

;;; NOTE Packages
;; TODO Add julia and racket support.

;; TODO Use helm-posframe
;; (when (featurep! :completion helm)
;;   (helm-posframe-enable))
;; (when (featurep! :completion company)
;;   (company-posframe-mode t))

;; FIXME conda
;; Cannot use pylint
;; (defun flycheck-change-python-pylint-for-conda(path-to-pylint)
;;   (setq flycheck-python-pylint-executable path-to-pylint))

(defvar +conda-anaconda-home nil
  "your anaconda or miniconda installed path")

(setq +conda-anaconda-home "~/.conda/");"/opt/anaconda")

(def-package! conda
  :commands (conda-env-activate-for-buffer)
  :init
  (setq conda-anaconda-home +conda-anaconda-home)
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell)
  (conda-env-autoactivate-mode t)

  ;; Setting flycheck
  ;; (setq flycheck-python-pylint-executable
  ;;       (concat (file-name-as-directory (conda-env-name-to-dir conda-env-current-name))
  ;;               conda-env-executables-dir))
  ;;
  ;; (flycheck-change-python-pylint-for-conda (concat (file-name-as-directory (conda-env-name-to-dir conda-env-current-name))
  ;;                                                  conda-env-executables-dir
  ;;                                                  "/pylint"))
  ;; Version management with conda
  (defun +python|add-version-to-modeline ()
    "Add version string to the major mode in the modeline."
    (setq mode-name
          (if conda-env-current-name
              (format "Py[%s]" conda-env-current-name)
            "Python")))
  (add-hook 'conda-postactivate-hook #'+python|add-version-to-modeline)
  (add-hook 'conda-postdeactivate-hook #'+python|add-version-to-modeline)
  ;; autoload conda environment
  (add-hook 'python-mode-hook #'conda-env-activate-for-buffer))

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

;; FIXME Test eaf on doom-emacs
(require 'eaf)
(defun open-qutebroswer ()
  (interactive)
  (eaf-open "eaf-qutebrowser"))

;; TODO support processing
(add-to-list 'load-path "~/.doom.d/local/processing2-emacs")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(autoload 'processing-snippets-initialize "processing-snippets" nil nil nil)
(eval-after-load 'yasnippet '(processing-snippets-initialize))
(setq processing-location "/usr/bin/processing-java")
(setq processing-application-dir "/usr/share/processing")
(setq processing-sketchbook-dir "~/GitRepos/book")
(setq processing-output-dir "/tmp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun processing-mode-init ()                                  ;;
;;   "Doc."                                                        ;;
;;   (make-local-variable 'ac-sources)                             ;;
;;   (setq ac-sources '(ac-source-dictionary ac-source-yasnippet)) ;;
;;   (make-local-variable 'ac-user-dictionary)                     ;;
;;   (setq ac-user-dictionary (append processing-functions         ;;
;;                                    processing-builtins          ;;
;;                                    processing-constants)))      ;;
;;                                                                 ;;
;; (add-to-list 'company-mode 'processing-mode)                    ;;
;; (add-hook 'processing-mode-hook 'processing-mode-init)          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
