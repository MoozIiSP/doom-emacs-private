;;; Doom Configuration
(setq doom-theme 'doom-Iosvkem) ;; 'doom-oceanic-next)
;; 'doom-city-lights
;; 'doom-acario-dark
;; 'doom-spacegrey
;; 'doom-material
;; 'doom-gruvbox
;; 'doom-Iosvkem
;; 'doom-nord

(setq doom-font (font-spec :family "等距更纱黑体 SC" :size 18))
      ;; doom-variable-pitch-font (font-spec :family "等距更纱黑体 T SC"
      ;;                                     :size 11
      ;;                                     :width 'extra-condensed
      ;;                                     :weight 'normal
      ;;                                     :slant 'normal))
      ;; If you enable `unicode', then Doom will ignore the `doom-unicode-font'
      ;; variable and the `unicode-font' setting.
      ;;doom-unicode-font (font-spec :family "Sarasa Mono T SC" :size 18))
      ;;doom-big-font (font-spec :family "Sarasa Mono T SC" :size 20))

;; `Modeline'
(setq doom-modeline-buffer-file-name-style 'file-name
      ;;       doom-modeline-icon (display-graphic-p)
      ;;       doom-modeline-major-mode-icon t)
      doom-modeline-window-width-limit 'fill-column
      doom-modeline-major-mode-color-icon t
      doom-modeline-buffer-state-icon nil
      doom-modeline-buffer-modification-icon t
      doom-modeline-unicode-fallback nil
      ;;       doom-modeline-minor-modes (featurep 'minions)
      doom-modeline-enable-word-count t
      doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
      ;;       doom-modeline-buffer-encoding nil
      doom-modeline-indent-info t
      doom-modeline-checker-simple-format t
      ;;       doom-modeline-vcs-max-length 12
      ;;       doom-modeline-persp-name nil
      doom-modeline-lsp t
      ;;       doom-modeline-github nil
      ;;       doom-modeline-github-interval (* 30 60)
      ;;       doom-modeline-env-version t
      doom-modeline-height 32
      doom-modeline-bar-width 4)

;;; General Extensions
;; (let ((time (string-to-number (format-time-string "%H"))))
;;   (if (and (< time 18)
;;            (> time 6))
;;       (setq doom-theme 'doom-one-light)
;;     (setq doom-theme 'doom-dark+)))
;;(setq doom-theme 'doom-one-light)

;;(moo/toggle-auto-switch-theme t)
(defun moo/edit-my-doom-config ()
  "Open doom custom configuration in Dired"
  (interactive)
  (dired-at-point "~/.doom.d"))

;;; for remote lsp
(setq password-cache-expiry nil)

(provide 'init-general)
