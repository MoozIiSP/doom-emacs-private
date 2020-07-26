;;; -*- lexical-binding: t; -*-

;;; 笔记系统
;;; `Org-mode'
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
(setq org-startup-truncated t)
;; TODO ui
(setq org-ellipsis " ≡ ")


;;; `Org-bullets'
(setq org-superstar-headline-bullets-list '("§"))


;;; TODO `org-capture'
;; capture note and inspiron.
;; (require 'org-protocol)
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


;;; `deft'
(setq deft-directory "~/GitRepos/philosophers-stone/draft")
(setq deft-recursive t)


;;; `org-noter'
;; (setq org-noter-notes-search-path '("~/GitRepos/philosophers-stone/draft"))

;; `Latex-Extension'
;; (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[a4paper]{ctexart}"
;;                                   ;; ("\\section{%s}" . "\\section*{%s}")
;;                                   ;; ("\\subsection{%s}" . "\\subsection*{%s}")
;;                                   ;; ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                                   ;; ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                                   ;; ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
;;                                   ))

;; `interleaves' repalced with eaf-interleaves

;;; `org-download'
(if (eq CURRECT-OS 'wsl)
    (setq org-download-screenshot-method "~/.doom.d/bin/emacs-screenshot")
  (setq org-download-screenshot-method "spectacle -r -b -o %s"))

;;; `org-roam'
(use-package! org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/GitRepos/philosophers-stone/draft"))


;;; `zotxt-emacs'
;;;
(use-package! zotxt
  :config
  (setq org-zotxt-link-description-style ':betterbibtexkey)
  ;;(setq zotxt-default-bibliography-style "mkbehr-short")
  (defun eaf/org-zotxt-open-attachment (&optional arg)
    "Open attachment of Zotero items linked at point.

  Opens with `eaf-open', see for more information about ARG."
    (interactive "P")
    (lexical-let ((item-id (org-zotxt-extract-link-id-at-point))
                  (arg arg))
      (deferred:$
        (zotxt--request-deferred
         (format "%s/items" zotxt-url-base)
         :params `(("key" . ,item-id) ("format" . "paths"))
         :parser 'json-read)
        (deferred:nextc it
          (lambda (response)
            (let ((paths (cdr (assq 'paths (elt (request-response-data response) 0)))))
              (eaf-open (org-zotxt-choose-path paths) arg))))
        (deferred:error it #'zotxt--deferred-handle-error)
        (if zotxt--debug-sync (deferred:sync! it))))))


;;; `mathpix'
(load-library "~/.doom.d/site-lisp/config/init-mathpix.el.gpg")


;;; `org-ref'
(use-package! org-ref
  :config
  (setq reftex-default-bibliography '("~/GitRepos/philosophers-stone/bibtex/references.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/GitRepos/philosophers-stone/bibtex/notes.org"
        org-ref-default-bibliography '("~/GitRepos/philosophers-stone/bibtex/references.bib")
        org-ref-pdf-directory "~/GitRepos/philosophers-stone/bibtex/bibtex-pdfs/"))


;;; `calibre'
;;; buggy, `calibredb-list' slow when your db is too big to show all content
(use-package! calibredb
  :config
  (setq sql-sqlite-program "/usr/bin/sqlite3"
        calibredb-root-dir (expand-file-name "~/Calibre")
        calibredb-db-dir (concat calibredb-root-dir "/metadata.db")
        calibredb-program "/usr/bin/calibredb"))

        
;;; org-brain
;; (setq org-id-locations-file (concat org-directory "/.org-id-locations"))
;; ;;(add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
;; ;;(remove-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
;; (push '("b" "Brain" plain (function org-brain-goto-end)
;;           "* %i%?" :empty-lines 1)
;;       org-capture-templates)
;; (setq org-brain-visualize-default-choices 'all)
;; (setq org-brain-title-max-length 12)
;; (setq org-brain-include-file-entries nil
;;       org-brain-file-entries-use-title nil)


(provide 'init-note)
