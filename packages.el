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

;;; `:completion'
;; default configuration already provide `+childframe' to enable this feature.
;; (when (featurep! :completion helm)
;;   (package! helm-posframe))
;; (package! company-posframe)
;;
;; `swiper-helm' is provided by `helm'.

;;; `:lang' LSP Client support
(when (featurep! :lang python)
    ; NOTE
  (package! lpy :recipe (:fetcher github :repo "abo-abo/lpy"))
  (package! yapfify)
  (package! py-isort))

;; NOTE already add into doom-emacs
;; (when (featurep! :lang cc)
;;   (package! emacs-ccls :recipe (:fetcher github :repo "MaskRay/emacs-ccls")))

;; TODO
(package! lpy :recipe (:fetcher github :repo "abo-abo/lpy"))
(package! yapfify)
(package! py-isort)

(when (featurep! :lang org)
  ;;(package! ivy-bibtex)
  (package! org-noter)
  (package! org-web-tools)
  (package! org-brain)
  (package! org-super-agenda)
  (package! org-clock-convenience)
  ;(package! ob-ipython)                 ; already add into doom-emacs
  (package! ob-translate)
  (package! cdlatex))                    ; NOTE combine cdlatex and auctex

;; command tldr
(package! tldr)

;; FIXME in the future
;;(when (featurep! :completion ivy)
;;  (package! ivy-bibtex))
;;(package! org-ref :recipe (:fetcher github :repo "fuxialexander/org-ref" :files ("*")))
(package! org-ref)

;;(package! eaf :recipe (:fetcher github :repo "manateelazycat/emacs-application-framework" :files ("*")))
;;(package! processing-mode :recipe (:fetcher github :repo "KevOrr/processing2-emacs" :files ("*")))
;;(package! rmsbolt :recipe (:fetcher gitlab :repo "jgkamat/rmsbolt"))
;; (quelpa '(rmsbolt
;;           :files (:defaults "starters")
;;           :fetcher gitlab
;;           :repo "jgkamat/rmsbolt"))

(package! move-text :recipe (:fetcher github :repo "manateelazycat/move-text" :files ("*")))
(package! lsp-julia :recipe (:fetcher github :repo "non-Jedi/lsp-julia" :files ("*")))
(package! lsp-racket :recipe (:fetcher github :repo "vishesh/lsp-racket.el" :files ("*")))

(package! writeroom-mode)
(package! darkroom)
(package! olivetti)

;; `leetcode' need furl package
(package! leetcode :recipe (:fetcher github :repo "twoyao/laes"))
;;(package! furl)
