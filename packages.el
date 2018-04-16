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
  (package! cdlatex)                    ; NOTE combine cdlatex and auctex
  )

(package! tldr)

(package! ivy-bibtex)
(package! org-ref :recipe (:fetcher github :repo "jkitchin/org-ref" :files ("*")))
