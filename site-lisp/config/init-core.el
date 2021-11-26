;;; site-lisp/config/init-core.el -*- lexical-binding: t; -*-

;;; FIXME Wait for doom-emacs-themes to merge it into master branch
;; (add-to-list 'custom-theme-load-path (concat (expand-file-name doom-private-dir) "site-lisp/config/themes/"))

(setq doom-theme 'doom-one)
;; font size: 18 (default)
;; (if (eq "2" (getenv "GDK_SCALE"))
;;     (setq font-size 26)
;;   (setq font-size 13))
;; FIXME: just for disabling wslg hidpi
(setq doom-font (font-spec :family "等距更纱黑体 SC" :size 24))
      ;; doom-variable-pitch-font (font-spec :family "等距更纱黑体 T SC"
      ;;                                     :size 11
      ;;                                     :width 'extra-condensed
      ;;                                     :weight 'normal
      ;;                                     :slant 'normal))
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Sarasa Mono T SC" :size 18))
      ;;doom-big-font (font-spec :family "Sarasa Mono T SC" :size 20))
