;;;  -*- lexical-binding: t; -*-

;;; `:enhance'
(package! habitica)

;;; `:ui'
;;(package! awesome-tab :recipe (:fetcher github :repo "manateelazycat/awesome-tab"))
;;(add-to-list 'load-path (expand-file-name "~/.doom.d/manual"))
;;(require 'awesome-tab)
;;(setq awesome-tab-background-color 'blac)

;;; `:completion'
;; default configuration already provide `+childframe' to enable this feature.
;; (when (featurep! :completion helm)
;;   (package! helm-posframe))
;; (package! company-posframe)
;;
;; `swiper-helm' is provided by `helm'.

;;; `:lang' LSP Client support

;; TODO
(package! lpy :recipe (:host github :repo "abo-abo/lpy"))

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
(package! lsp-julia :recipe (:host github :repo "non-Jedi/lsp-julia" :files ("*")))
(package! lsp-racket :recipe (:host github :repo "vishesh/lsp-racket.el" :files ("*")))

(package! olivetti)

;; `leetcode' need furl package
(package! leetcode :recipe (:host github :repo "kaiwk/leetcode.el"))

;; wakatime
(package! wakatime-mode :recipe (:host github :repo "wakatime/wakatime-mode" :files ("*")))
