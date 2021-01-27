;;; site-lisp/config/init-wsl.el -*- lexical-binding: t; -*-

(defconst IS-WSL
  (not (null (string-match-p "-[Mm]icrosoft" operating-system-release))))

(defun show-wsl-version ()
  (if (null (string-match-p "-[Mm]icrosoft" operating-system-release))
      (progn
        (message "Emacs running on Linux now."))
    (progn
      (let ((windows-version
             (string-remove-suffix "\r\n"
                                   (shell-command-to-string "PowerShell.exe -Command \"(Get-WmiObject win32_operatingsystem).version\""))))
        (message (format "Emacs runing on WSL under Windows %s now." windows-version))))))

(after! org-download
  (setq org-download-screenshot-method "~/.doom.d/bin/emacs-screenshot %s"))

(after! mathpix
  (setq mathpix-screenshot-method "~/.doom.d/bin/emacs-screenshot %s"))

;; reference to https://hkvim.com/post/windows-setup/#choosing-the-terminal
(defun wsl-browse-url-xdg-open (url &optional ignored)
  (interactive (browse-url-interactive-arg "URL: "))
  (shell-command-to-string (concat "explorer.exe " url)))
(advice-add #'browse-url-xdg-open :override #'wsl-browse-url-xdg-open)

;; calibredb
(defun wslcalibredb-open-with-default-tool (filepath)
  (shell-command-to-string
   (concat "cd " (shell-quote-argument (file-name-directory (expand-file-name filepath))) " && "
           (concat "cmd.exe /C start '' \"${@//&/^&}\" " (shell-quote-argument (file-name-nondirectory filepath))))))
(advice-add #'calibredb-open-with-default-tool :override #'wslcalibredb-open-with-default-tool)

;;;###autoload
(defmacro wsl--open-with (id &optional app dir)
  `(defun ,(intern (format "wsl/%s" id)) ()
     (interactive)
     (wsl-open-with ,app ,dir)))

(defun wsl-open-with (&optional app-name path)
  "Send PATH to APP-NAME on WSL."
  (interactive)
  (let* ((path (expand-file-name
                (replace-regexp-in-string
                 "'" "\\'"
                 (or path (if (derived-mode-p 'dired-mode)
                              (dired-get-file-for-visit)
                            (buffer-file-name)))
                 nil t)))
         (command (format "%s `wslpath -w %s`" (shell-quote-argument app-name) path)))
    (shell-command-to-string command)))

(wsl--open-with open-in-default-program "explorer.exe" buffer-file-name)
(wsl--open-with reveal-in-explorer "explorer.exe" default-directory)
