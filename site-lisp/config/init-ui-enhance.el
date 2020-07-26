;;; ~/.doom.d/lisp/init-ui-enhance.el -*- lexical-binding: t; -*-

(setq moo/day-theme 'doom-one-light
      moo/night-theme 'doom-dark+
      moo/auto-switch-theme nil
      moo/auto-switch-theme-timer nil
      moo/auto-switch-theme-interval (* 1 60))

(defun moo/load-theme+ (theme)
  (cond ((not (equal theme doom-theme))
         (load-theme theme))))

(defun moo/switch-theme-by-time ()
  "根据当前时间切换主题"
  (let ((now-time (format-time-string "%H")))
    (cond ((< (string-to-number now-time) 6)
           (moo/load-theme+ moo/night-theme))
          ((< (string-to-number now-time) 18)
           (moo/load-theme+ moo/day-theme))
          ((>= (string-to-number now-time) 18)
           (moo/load-theme+ moo/night-theme)))))

(defun moo/toggle-auto-switch-theme (&optional arg)
  "Trun on the function that switch emacs theme by time."
  (interactive "P")
  (setq moo/auto-switch-theme
        (if (null arg)
            (not moo/auto-switch-theme)
          (> (prefix-numeric-value arg) 0)))
  ;; control timer
  (if moo/auto-switch-theme
      (setq moo/auto-switch-theme-timer
            (run-with-idle-timer moo/auto-switch-theme-interval t 'moo/switch-theme-by-time))
    (cancel-timer moo/auto-switch-theme-timer))
  (force-mode-line-update)
  (message "Auto switch theme %s"
           (if moo/auto-switch-theme "enabled" "disabled")))

;;; `hl-todo'
(with-eval-after-load 'hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))
;; `posframe' of built-in
;; (with-eval-after-load 'helm
;;   (setq +helm-posframe-text-scale nil
;;         ;; maybe, built-in will discard in the future.
;;         +helm-posframe-parameters '((internal-border-width . 8)
;;                                     (width . 0.5)
;;                                     (height . 0.35)
;;                                     (min-width . 80)
;;                                     (min-height . 16))))

(provide 'init-ui-enhance)
