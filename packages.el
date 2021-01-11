;;;  -*- lexical-binding: t; -*-

;;; `IME'
(package! rime :recipe (:host github
                        :repo "DogLooksGood/emacs-rime"
                        :files ("*.el" "Makefile" "lib.c")))

;;; `Note' Note Enhancement
(package! mathpix :recipe (:host github :repo "jethrokuan/mathpix.el"))
(package! zotxt-emacs :recipe (:host github :repo "egh/zotxt-emacs"))
(package! calibredb :recipe (:host github :repo "chenyanming/calibredb.el" :files ("*.el")))
(package! org-ref :recipe (:host github :repo "jkitchin/org-ref"))
(package! advance-words-count :recipe (:host github :repo "LdBeth/advance-words-count.el" :files ("*.el")))
(package! org-roam-server)

;;; `Coding' LSP Client support
(package! nox :recipe (:host github :repo "manateelazycat/nox" :files ("*")))
;; (package! lsp)
;; (package! lsp-ui)
;; (package! company-lsp)
;; (package! lsp-ivy)
;; (package! lsp-python-ms)
(package! move-text :recipe (:host github :repo "manateelazycat/move-text" :files ("*")))
(package! pkgbuild-mode)
;;(package! rmsbolt :recipe (:fetcher gitlab :repo "jgkamat/rmsbolt"))
;; (quelpa '(rmsbolt
;;           :files (:defaults "starters")
;;           :fetcher gitlab
;;           :repo "jgkamat/rmsbolt"))

;;; `Stat' wakatime
(package! wakatime-mode :recipe (:host github :repo "wakatime/wakatime-mode" :files ("*")))
