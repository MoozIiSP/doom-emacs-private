;;;  -*- lexical-binding: t; -*-

;;; `:completion'
;; default configuration already provide `+childframe' to enable this feature.
;; (when (featurep! :completion helm)
;;   (package! helm-posframe))
;; (package! company-posframe)
;;
;; `swiper-helm' is provided by `helm'.

;;; `:lang' LSP Client support
(package! lsp)
;;(package! lsp-ui)
(package! company-lsp)
(package! lsp-ivy)
(package! lsp-python-ms)

;; TODO
;;(package! lpy :recipe (:host github :repo "abo-abo/lpy"))
(package! pkgbuild-mode)

;; (when (featurep! :lang org)
;;   ;;(package! ivy-bibtex)
;;   (package! org-noter)
;;   (package! org-web-tools)
;;   (package! org-brain)
;;   (package! org-super-agenda)
;;   (package! org-clock-convenience)
;;   (package! ob-translate)
;;   (package! cdlatex))                    ; NOTE combine cdlatex and auctex

(package! eaf :recipe (:host github :repo "manateelazycat/emacs-application-framework"))
;;(package! processing-mode :recipe (:fetcher github :repo "KevOrr/processing2-emacs" :files ("*")))
;;(package! rmsbolt :recipe (:fetcher gitlab :repo "jgkamat/rmsbolt"))
;; (quelpa '(rmsbolt
;;           :files (:defaults "starters")
;;           :fetcher gitlab
;;           :repo "jgkamat/rmsbolt"))

(package! move-text :recipe (:host github :repo "manateelazycat/move-text" :files ("*")))
(package! nox :recipe (:host github :repo "manateelazycat/nox" :files ("*")))

;; wakatime
(package! wakatime-mode :recipe (:host github :repo "wakatime/wakatime-mode" :files ("*")))
