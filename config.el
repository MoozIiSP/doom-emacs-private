;;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "C-s") 'swiper)

(when (featurep! :ui doom)
  (setq doom-theme 'doom-peacock))

(when (featurep! :ui posframe)
  (push '(swiper . ivy-posframe-display-at-frame-center) ivy-display-functions-alist))

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
