;;; ~/.doom.d/lisp/init-lsp.el -*- lexical-binding: t; -*-

;; (use-package! move-text
;;   :after python
;;   :config
;;   (map! :map python-mode-map
;;         "M-p" 'move-text-up
;;         "M-n" 'move-text-down))


(after! lsp-mode
  (progn
    ;; register for python on remote machine
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection (lambda ()
                                              (cons "pyright-langserver"
                                                    lsp-pyright-langserver-command-args)))
      :major-modes '(python-mode)
      :remote? t
      :server-id 'pyright-remote
      :multi-root t
      :priority 3
      :initialization-options (lambda () (ht-merge (lsp-configuration-section "pyright")
                                              (lsp-configuration-section "python")))
      :initialized-fn (lambda (workspace)
                        (with-lsp-workspace workspace
                          (lsp--set-configuration
                           (ht-merge (lsp-configuration-section "pyright")
                                     (lsp-configuration-section "python")))))
      :download-server-fn (lambda (_client callback error-callback _update?)
                            (lsp-package-ensure 'pyright callback error-callback))
      :notification-handlers (lsp-ht ("pyright/beginProgress" 'lsp-pyright--begin-progress-callback)
                                     ("pyright/reportProgress" 'lsp-pyright--report-progress-callback)
                                     ("pyright/endProgress" 'lsp-pyright--end-progress-callback))))
    ;; register for c/c++ on remote machine
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection "clangd")
      :major-modes '(c++-mode)
      :remote? t
      :server-id 'clangd-remote))))

(provide 'init-lsp)
