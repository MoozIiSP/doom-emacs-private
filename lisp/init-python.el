;;; ~/.doom.d/lisp/init-python.el -*- lexical-binding: t; -*-


(defun using-lsp-or-nox ()
  (interactive)
  (if (y-or-n-p "lsp[y] or nox[n]?")
      (lsp)
    (nox-ensure)))
(add-hook 'python-mode-hook #'using-lsp-or-nox)

(use-package! lsp-python-ms
  :after lsp-clients
  :preface
  (after! python
    (setq lsp-python-ms-python-executable-cmd python-shell-interpreter))
  :init
  ;; HACK If you don't have python installed, then opening python buffers with
  ;;      this on causes a "wrong number of arguments: nil 0" error, because of
  ;;      careless usage of `cl-destructuring-bind'. This silences that error,
  ;;      since we may still want to write some python on a system without
  ;;      python installed!
  (defadvice! +python--silence-errors-a (orig-fn &rest args)
    :around #'lsp-python-ms--extra-init-params
    (ignore-errors (apply orig-fn args))))

  ;; (after! lsp-mode
  ;;   (lsp-register-client
  ;;     (make-lsp-client
  ;;      :new-connection (lsp-tramp-connection "/root/mspyls/Microsoft.Python.LanguageServer")
  ;;      :major-modes (append '(python-mode) lsp-python-ms-extra-major-modes)
  ;;      :remote? t
  ;;      :server-id 'mspyls-remote
  ;;      :initialization-options 'lsp-python-ms--extra-init-params
  ;;      :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
  ;;                                     ("telemetry/event" 'ignore)
  ;;                                     ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
  ;;                                     ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
  ;;                                     ("python/endProgress" 'lsp-python-ms--end-progress-callback)))
  ;;     :initialized-fn (lambda (workspace)
  ;;                       (with-lsp-workspace workspace
  ;;                         (lsp--set-configuration (lsp-configuration-section "python")))))))
  ;;


;; (lsp-register-client
;;  (make-lsp-client
;;   :new-connection (lsp-tramp-connection "mspyls")
;;   :major-modes (append '(python-mode) lsp-python-ms-extra-major-modes)
;;   :server-id 'mspyls-remote
;;   :remote? t
;;   :initialization-options 'lsp-python-ms--extra-init-params
;;   :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;                                  ("telemetry/event" 'ignore)
;;                                  ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
;;                                  ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
;;                                  ("python/endProgress" 'lsp-python-ms--end-progress-callback))
;;   :initialized-fn (lambda (workspace)
;;                     (with-lsp-workspace workspace
;;                       (lsp--set-configuration (lsp-configuration-section "python"))))))

(provide 'init-python)
