;;; site-lisp/config/init-ide.el -*- lexical-binding: t; -*-

(after! hl-todo
  (add-to-list 'hl-todo-keyword-faces '("TESTING" . "#1874CD")))

;; (use-package! move-text
;;   :after python
;;   :config
;;   (map! :map python-mode-map
;;         "M-p" 'move-text-up
;;         "M-n" 'move-text-down))

;;; BUG wait for latest lsp-mode
(defun lsp-tramp-connection-new (local-command &optional generate-error-file-fn)
  "Create LSP stdio connection named name.
LOCAL-COMMAND is either list of strings, string or function which
returns the command to execute."
  ;; 2.5.0-pre (as built from native-comp branch before M Albinus released tramp-2.5)
  ;; worked fine
  (defvar tramp-version)
  (defvar tramp-connection-properties)
  (when (version< "2.5.0-pre" tramp-version)
    (lsp-warn
     "Your tramp version - %s - might fail to work with remote LSP. Update to tramp-2.5 for tested reliability improvements"
     tramp-version))
  ;; Force a direct asynchronous process.
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote (file-remote-p default-directory))
                     "direct-async-process" t))
  (list :connect (lambda (filter sentinel name environment-fn)
                   (let* ((final-command (lsp-resolve-final-function
                                          local-command))
                          (_stderr (or (when generate-error-file-fn
                                         (funcall generate-error-file-fn name))
                                       (format "/tmp/%s-%s-stderr" name
                                               (cl-incf lsp--stderr-index))))
                          (process-name (generate-new-buffer-name name))
                          (process-environment
                           (lsp--compute-process-environment environment-fn))
                          (proc (make-process
                                 :name process-name
                                 :buffer (format "*%s*" process-name)
                                 :command final-command
                                 :connection-type 'pipe
                                 :coding 'no-conversion
                                 :noquery t
                                 :filter filter
                                 :sentinel sentinel
                                 :file-handler t)))
                     (cons proc proc)))
        :test? (lambda () (-> local-command lsp-resolve-final-function
                              lsp-server-present?))))

(after! lsp!
  (progn
    ;; register for python on remote machine
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection-new
                       (lambda () (cons "pyright-langserver" lsp-pyright-langserver-command-args)))
      :major-modes '(python-mode)
      :remote? t
      :server-id  'pyright-remote
      :priority    3
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
    ;; (lsp-register-client
    ;;  (make-lsp-client
    ;;   :new-connection (lsp-tramp-connection-new
    ;;                    (lambda ()
    ;;                    (cons lsp-clients--clangd-default-executable lsp-clients-clangd-args)))
    ;;   :major-modes '(c-mode cpp-mode c++-mode)
    ;;   :remote?      t
    ;;   :server-id   'clangd-remote
    ;;   :priority     3))
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection-new (lambda () (cons ccls-executable ccls-args)))
      :major-modes '(c-mode c++-mode cuda-mode objc-mode)
      :remote? t
      :server-id   'ccls-remote
      :multi-root   nil
      :notification-handlers
      (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
              ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
      :initialization-options (lambda () ccls-initialization-options)
      :library-folders-fn ccls-library-folders-fn))))

;; disable vc for remote files (speed increase)
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
;;(setq explicit-shell-file-name "zsh")
;;(setq inhibit-eol-conversion t)

;; Treemacs
(setf treemacs-read-string-input 'from-minibuffer)
