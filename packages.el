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
  (package! lpy)
  (package! yapfify))


(when (featurep! :lang org)
  (package! org-ref)                    ; NOTE 文献管理
  (package! org-web-tools)
  (package! org-brain)
  (package! org-super-agenda)
  (package! org-clock-convenience)
  (package! ob-ipython)                 ; NOTE between ob-ipython and lpy
  (package! cdlatex)                    ; NOTE combine cdlatex and auctex
  )

