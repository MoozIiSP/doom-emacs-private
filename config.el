;;; config.el  -*- lexical-binding: t; -*-

(load! "site-lisp/config/init-core")
(load! "site-lisp/config/init-wsl")
(load! "site-lisp/config/init-ui")
(load! "site-lisp/config/init-note")
(load! "site-lisp/config/init-ide")
(load! "site-lisp/config/init-ime")
(if (and (not IS-WSL) (not IS-MAC))
    (load! "site-lisp/config/init-eaf")
  (message "only linux support emacs application framework."))
