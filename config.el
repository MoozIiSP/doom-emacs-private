;;;  -*- lexical-binding: t; -*-

;;; NOTE Basic Configuration
;;;
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.doom.d/site-lisp")

(toggle-frame-fullscreen)

;; ensure whether platform
(cond ((eq system-type 'gnu/linux)
       (if (null (string-match-p "-[Mm]icrosoft" operating-system-release))
           (progn
             (message "Emacs running on Linux now.")
             (setq CURRECT-OS 'linux))
         (progn
           (let ((version (string-remove-suffix "\n"
                            (shell-command-to-string
                              "PowerShell.exe -Command \"(Get-WmiObject win32_operatingsystem).version\""))))
             (message (format "Emacs runing on WSL under Windows %s now." version)))
           (setq CURRECT-OS 'wsl))))
      ((eq system-type 'darwin)
       (progn
         (message "Emacs runing on OS X now.")
         (setq CURRECT-OS 'drawin))))

;; enable native comp
;;(setq comp-deferred-compilation t)
;;(setq comp-speed 3)
;;(native-compile-async "~/.emacs.d/.local/" <n> t)
;;(native-compile-async "~/.doom.d/site-lisp" t)

(require 'init-general)
(require 'init-ui-enhance)

;;(run-with-idle-timer
;; 1 nil
;; #'(lambda ()
(require 'init-note)               ;; 笔记系统
;; (require 'init-lsp)
;; (require 'init-nox)
(require 'init-python)             ;; disable some custom package
(require 'init-prog-mode)
;; (require 'init-eaf)              ;; disable for WSL
(require 'init-input)
;;(require 'init-wakatime)

(server-start)
