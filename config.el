;;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "C-s") 'swiper)

;; FIXME Test eaf on doom-emacs
(require 'eaf)

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

;; FIXME Unicode bugs
(set-charset-priority 'unicode-bmp)

;; Base configuration for doom
(setq doom-theme 'doom-opera)
(setq doom-font (font-spec :family "Noto Sans Mono" :size 19)
      doom-variable-pitch-font (font-spec :family "Noto Sans"
                                          :size 22
                                          :width 'extra-condensed
                                          :weight 'normal
                                          :slant 'normal)
      doom-unicode-font (font-spec :family "Noto Sans Mono" :size 19)
      doom-big-font (font-spec :family "Noto Sans Mono" :size 25))


;; TODO Add julia and racket support.

;; TODO Use helm-posframe
(when (featurep! :ui posframe)
  (push '(swiper . ivy-posframe-display-at-frame-center) ivy-display-functions-alist))
(when (featurep! :completion helm)
  (helm-posframe-enable))
(when (featurep! :completion company)
  (company-posframe-mode t))

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


;; NOTE ORG
(setq org-directory "~/workspace/TrLib/")
(setq org-agenda-files '("~/workspace/TrLib/flow/"))


;; NOTE org-ref 我死了，不会玩
;; (defvar +org-ref-load-path nil
;;   "configure load-path fof def-package!")

;(setq +org-ref-load-path "~/org")

;; (setq org-ref-default-bibliography '("~/workspace/reference/bibtexs/default.bib")
;;       org-ref-bibliography-notes  "~/workspace/reference/notes/note.org"
;;       org-ref-pdf-directory      "~/workspace/reference/pdfs/")

(def-package! org-ref ;:load-path +org-ref-load-path
  :commands (org-ref-bibtex-next-entry
             org-ref-bibtex-previous-entry
             doi-utils-get-bibtex-entry-pdf
             org-ref-ivy-insert-cite-link
             org-ref-open-in-browser
             org-ref-open-bibtex-notes
             org-ref-open-bibtex-pdf
             org-ref-bibtex-hydra/body
             org-ref-bibtex-hydra/org-ref-bibtex-new-entry/body-and-exit
             org-ref-sort-bibtex-entry
             arxiv-add-bibtex-entry
             arxiv-get-pdf-add-bibtex-entry
             doi-utils-add-bibtex-entry-from-doi
             isbn-to-bibtex
             pubmed-insert-bibtex-from-pmid)
  :init                                 ; NOTE 相当于在(require 'org-ref)之前设定参数
  ;; NOTE hybra key-binding
  (defvar org-ref-ivy-cite-actions
    '(("b"    ivy-bibtex-show-entry                         "Open entry")
      ("p"    ivy-bibtex-open-pdf                           "Open pdf")
      ("n"    ivy-bibtex-edit-notes                         "Open notes")
      ("u"    ivy-bibtex-open-url-or-doi                    "Open url or doi")
      ("U"    org-ref-ivy-bibtex-get-update-for-entry       "Update entry from doi")
      ("P"    org-ref-ivy-bibtex-get-pdf-for-entry          "Update PDF for entry")
      ("SPC"  ivy-bibtex-quicklook                          "Quick look")
      ("k"    org-ref-ivy-set-keywords                      "Add keywords")
      ("e"    org-ref-ivy-bibtex-email-entry                "Email entry")
      ("f"    org-ref-ivy-bibtex-insert-formatted-citation  "Insert formatted citation")
      ("F"    org-ref-ivy-bibtex-copy-formatted-citation    "Copy formatted citation"))
    "List of additional actions for `org-ref-ivy-insert-cite-link'.
The default action being to insert a citation.")

  ;; NOTE 后端补全 & doi套件
  (setq org-ref-completion-library 'org-ref-ivy-cite
        org-ref-doi-utils-pdf-url-functions '(;; 'aps-pdf-url
                                              'biorxiv-pdf-url
                                              'science-pdf-url
                                              'nature-pdf-url
                                              'pnas-pdf-url
                                              'oup-pdf-url
                                              'bmc-pdf-url
                                              'wiley-pdf-url
                                              'springer-chapter-pdf-url
                                              'springer-pdf-url
                                              'jstor-pdf-url
                                              'tandfonline-pdf-url
                                              'sage-pdf-url
                                              ;; 'acs-pdf-url-1
                                              ;; 'acs-pdf-url-2
                                              ;; 'iop-pdf-url
                                              ;; 'aip-pdf-url
                                              ;; 'science-direct-pdf-url
                                              ;; 'linkinghub-elsevier-pdf-url
                                              ;; 'ecs-pdf-url
                                              ;; 'ecst-pdf-url
                                              ;; 'rsc-pdf-url
                                              ;; 'jneurosci-pdf-url
                                              'ieee-pdf-url
                                              'ieee2-pdf-url
                                              'ieee3-pdf-url
                                              'acm-pdf-url
                                              ;; 'osa-pdf-url
                                              'asme-biomechanical-pdf-url
                                              'generic-full-pdf-url
                                              'generic-as-get-pdf-url
                                              ))
  :config
  (setq org-ref-default-bibliography '("~/workspace/reference/bibtexs/default.bib")
        org-ref-bibliography-notes  "~/workspace/reference/notes/note.org"
        org-ref-pdf-directory      "~/workspace/reference/pdfs/")
  ;; Check directory or file
  ;; (defmacro create-file-or-directory-if (checker file-or-directory)
  ;;   `(if (not (,checker ,file-or-directory))
  ;;       (when (y-or-n-p "Do you want to create default file or directory?")
  ;;         (find-file ,file-or-directory))
  ;;      (message "%s existed." ,file-or-directory)))

  ;; (create-file-or-directory-if file-exists-p (car org-ref-default-bibliography))
  ;; (create-file-or-directory-if file-exists-p org-ref-bibliography-notes)
  ;; (create-file-or-directory-if directory-name-p org-ref-pdf-directory)

  (setq bibtex-dialect 'BibTeX
        org-ref-clean-bibtex-entry-hook '(org-ref-bibtex-format-url-if-doi
                                          orcb-key-comma
                                          org-ref-replace-nonascii
                                          orcb-&
                                          orcb-%
                                          org-ref-title-case-article
                                          orcb-clean-year
                                          my-org-ref-key
                                          ;; orcb-key
                                          orcb-clean-doi
                                          orcb-clean-pages
                                          orcb-check-journal
                                          org-ref-sort-bibtex-entry)
        ;; NOTE xfu 自定义lambda函数
        org-ref-get-pdf-filename-function (lambda (key) (car (bibtex-completion-find-pdf key)))
        org-ref-doi-utils-make-notes-function (lambda ()
                                                (bibtex-beginning-of-entry)
                                                (org-ref-bibtex-edit-notes (cdr (assoc "=key="
                                                                                       (bibtex-parse-entry)))))
        org-ref-notes-function (lambda (thekey)
                                 (let* ((results (org-ref-get-bibtex-key-and-file thekey))
                                        (key (car results))
                                        (bibfile (cdr results)))

                                   (save-excursion
                                     (with-temp-buffer
                                       (insert-file-contents bibfile)
                                       (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
                                       (bibtex-search-entry key)
                                       (org-ref-open-bibtex-notes)))))
        org-ref-create-notes-hook '((lambda ()
                                      (org-narrow-to-subtree)
                                      (insert (format "cite:%s\n" (org-entry-get (point) "CUSTOM_ID")))))
        org-ref-note-title-format "* %t
 :PROPERTIES:
  :CUSTOM_ID: %k
 :END:
")

  ;; NOTE Define hydra keybinding
  ;; TODO 你可以整合到posframe
  (defhydra org-ref-cite-hydra (:color blue :hint nil)
    "
_p_: Open pdf     _w_: WOS          _g_: Google Scholar _K_: Copy citation to clipboard
_u_: Open url     _r_: WOS related  _P_: Pubmed         _k_: Copy key to clipboard
_n_: Open notes   _c_: WOS citing   _C_: Crossref       _f_: Copy formatted entry
_o_: Open entry   _e_: Email entry  ^ ^                 _q_: quit
"
    ("o" org-ref-open-citation-at-point)
    ("p" org-ref-open-pdf-at-point)
    ("n" org-ref-open-notes-at-point)
    ("u" org-ref-open-url-at-point)
    ("w" org-ref-wos-at-point)
    ("r" org-ref-wos-related-at-point)
    ("c" org-ref-wos-citing-at-point)
    ("g" org-ref-google-scholar-at-point)
    ("P" org-ref-pubmed-at-point)
    ("C" org-ref-crossref-at-point)
    ("K" org-ref-copy-entry-as-summary)
    ("k" (progn
           (kill-new
            (car (org-ref-get-bibtex-key-and-file)))))
    ("f" (kill-new
          (bibtex-completion-apa-format-reference (org-ref-get-bibtex-key-under-cursor))))
    ("e" (kill-new (save-excursion
                     (org-ref-open-citation-at-point)
                     (org-ref-email-bibtex-entry))))
    ("q" nil))

  ;; NOTE 嵌套包，需要org-ref的init变量定义
  (def-package! ivy-bibtex
    :config
    (ivy-bibtex-ivify-action bibtex-completion-quicklook ivy-bibtex-quicklook)
    (setq
     bibtex-completion-additional-search-fields '("journal")
     bibtex-completion-pdf-symbol "@"
     bibtex-completion-notes-symbol "#"
     bibtex-completion-display-formats '((t . "${=has-pdf=:1}${=has-note=:1} ${author:20} ${journal:10} ${year:4} ${title:*} ${=type=:3}")))
    (setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)
    (ivy-add-actions 'ivy-bibtex '(("SPC" ivy-bibtex-quicklook "Quick look")))
    (setq bibtex-completion-format-citation-functions
          '((org-mode      . bibtex-completion-format-citation-pandoc-citeproc)
            (default       . bibtex-completion-format-citation-default))
          bibtex-completion-bibliography (car org-ref-default-bibliography)
          bibtex-completion-library-path org-ref-pdf-directory
          bibtex-completion-notes-path org-ref-bibliography-notes
          bibtex-completion-pdf-field "file"
          bibtex-completion-pdf-open-function (lambda (fpath) (start-process "open" "*open*" "open" fpath))))

  (ivy-set-actions 'org-ref-ivy-insert-cite-link org-ref-ivy-cite-actions)

  (defun org-ref-ivy-insert-cite-link (&optional arg)
    "Ivy function for interacting with bibtex.
Uses `org-ref-find-bibliography' for bibtex sources, unless a
prefix ARG is used, which uses `org-ref-default-bibliography'."
    (interactive "P")
    ;; (setq org-ref-bibtex-files (if arg org-ref-default-bibliography (org-ref-find-bibliography)))
    (when arg (bibtex-completion-clear-cache))
    (bibtex-completion-init)
    ;; (setq org-ref-ivy-cite-marked-candidates '())
    (ivy-read "Open: " (bibtex-completion-candidates)
              :require-match t
              :keymap org-ref-ivy-cite-keymap
              :re-builder org-ref-ivy-cite-re-builder
              :action 'or-ivy-bibtex-insert-cite
              :caller 'org-ref-ivy-insert-cite-link))

  (ivy-set-display-transformer 'org-ref-ivy-insert-cite-link 'ivy-bibtex-display-transformer))
