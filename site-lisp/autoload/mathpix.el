;;; site-lisp/autoload/mathpix.el -*- lexical-binding: t; -*-

(defvar +mathpix-screenshot-method nil
  "Screenshot method of Mathpix.")

;;;###autoload
(defun +mathpix/setup ()
  "Setup Mathpix in Emacs.
This will prompt you for your api id and key. You only need to run this when
your api changes."
  (interactive)
  (when (y-or-n-p "No API key is registered. Open a browser on the mathpix login page?")
    (browse-url "https://accounts.mathpix.com/login"))
  (let ((api-id  (read-string "Enter your mathpix API ID: "))
        (api-key (read-string "Enter your mathpix API KEY: ")))
    (unless (or api-id api-key)
      (user-error "No api id and key was received."))
    (require 'mathpix)
    (customize-set-variable 'mathpix-api-id  api-id)
    (customize-set-variable 'mathpix-api-key api-key)
    (customize-save-customized)))