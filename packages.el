;;;  -*- lexical-binding: t; -*-

;;; `:enhance'
(package! habitica)

;;; `:emacs'
(package! dired-single)

;;; `:ui'
;;(package! awesome-tab :recipe (:fetcher github :repo "manateelazycat/awesome-tab"))
;;(add-to-list 'load-path (expand-file-name "~/.doom.d/manual"))
;;(require 'awesome-tab)
;;(setq awesome-tab-background-color 'blac)

;;; `:completion' LSP Client Support
;; default configuration already provide `+childframe' to enable this feature.
;; (when (featurep! :completion helm)
;;   (package! helm-posframe))
;; (package! company-posframe)
;;
;; `swiper-helm' is provided by `helm'.

(when (featurep! :tool lsp)
  (package! company-lsp)
  (package! lsp-mode)
  (package! lsp-ui)

;;; `:lang'
  (when (featurep! :lang python)
    (package! conda)
    (package! lpy :recipe (:fetcher github :repo "abo-abo/lpy"))                        ; NOTE
    (package! yapfify)
    (package! py-isort)))

(when (featurep! :lang org)
  ;(package! ivy-bibtex)
  (package! org-web-tools)
  (package! org-brain)
  (package! org-super-agenda)
  (package! org-clock-convenience)
  (package! ob-ipython)                 ; NOTE between ob-ipython and lpy
  (package! ob-translate)
  (package! cdlatex))                    ; NOTE combine cdlatex and auctex

;; command tldr
(package! tldr)

;; FIXME in the future
;;(when (featurep! :completion ivy)
;;  (package! ivy-bibtex))
;;(package! org-ref :recipe (:fetcher github :repo "fuxialexander/org-ref" :files ("*")))

(package! eaf :recipe (:fetcher github :repo "manateelazycat/emacs-application-framework" :files ("*")))
;;(package! processing-mode :recipe (:fetcher github :repo "KevOrr/processing2-emacs" :files ("*")))
;;(package! rmsbolt :recipe (:fetcher gitlab :repo "jgkamat/rmsbolt"))
;; (quelpa '(rmsbolt
;;           :files (:defaults "starters")
;;           :fetcher gitlab
;;           :repo "jgkamat/rmsbolt"))
