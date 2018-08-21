;;;  -*- lexical-binding: t; -*-

(package! lsp-mode)
(package! lsp-ui)
;; lsp ext
(package! lsp-python)

;; for lsp
(when (featurep! :completion company)
  (package! company-lsp))


(when (featurep! :lang python)
  (package! conda)
  (package! lpy :recipe (:fetcher github :repo "abo-abo/lpy"))                        ; NOTE
  (package! yapfify))


(when (featurep! :lang org)
  ;(package! ivy-bibtex)
  (package! org-web-tools)
  (package! org-brain)
  (package! org-super-agenda)
  (package! org-clock-convenience)
  (package! ob-ipython)                 ; NOTE between ob-ipython and lpy
  (package! ob-translate)
  (package! cdlatex))                    ; NOTE combine cdlatex and auctex


(package! tldr)

;; FIXME in the future
;;(when (featurep! :completion ivy)
;;  (package! ivy-bibtex))
;;(package! org-ref :recipe (:fetcher github :repo "fuxialexander/org-ref" :files ("*")))

(package! eaf :recipe (:fetcher github :repo "manateelazycat/emacs-application-framework" :files ("*")))

