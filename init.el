;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(setq package-archives

      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(doom! :feature
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       file-templates    ; auto-snippets for empty files
       (lookup           ; helps you navigate your code and documentation
        +devdocs         ; ...on devdocs.io online
        +docsets)        ; ...or in Dash docsets locally
       services          ; TODO managing external services & code builders
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker    ; tasing you for every semicolon you forget
       version-control   ; remember, remember that commit in November
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       company           ; the ultimate code completion backend
       ivy               ; a search engine for love and life

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       evil-goggles      ; display visual hints when editing in evil
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
       posframe          ; use child frames where possible (Emacs 26+ only)
       ;tabbar            ; FIXME an (incomplete) tab bar for Emacs
       unicode           ; extended unicode support for various languages
       window-select     ; visually switch windows

       :tools
       dired             ; making dired pretty [functional]
       electric-indent   ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       gist              ; interacting with github gists
       imenu             ; an imenu sidebar and searchable code index
       impatient-mode    ; show off code over HTTP
       make              ; run make tasks from Emacs
       magit             ;
       neotree           ; a project drawer, like NERDTree for vim
       password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       rgb               ; creating color strings
       rotate-text       ; cycle region at point between text candidates
       term              ; terminals in Emacs
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp
       reference

       :lang
       assembly          ; assembly for fun or debugging
       ;cc                ; c/c++/obj-c madness
       clojure           ; java with a lisp
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       ess               ; emacs speaks statistics
       (haskell +intero) ; a language that's lazier than i am
       hy                ; readability of scheme w/ speed of python
       julia             ; a better, faster MATLAB
       latex             ; writing papers in Emacs has never been so fun
       markdown          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        ;+babel           ; running code in org NOTE defined in org-ext
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present         ; Emacs for presentations
        +publish)        ; Emacs+Org as a static site generator
       perl              ; write code no one else can comprehend
       plantuml          ; diagrams for confusing people more
       python            ; beautiful is better than ugly
       sh                ; she sells (ba|z)sh shells on the C xor
       web               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
      ;(email +gmail)    ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;(rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
      (write            ; emacs as a word processor (latex + org + markdown)
       +wordnut         ; wordnet (wn) search
       +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       ;; The default module set reasonable defaults for Emacs. It also provides
       ;; a Spacemacs-inspired keybinding scheme, a custom yasnippet library,
       ;; and additional ex commands for evil-mode. Use it as a reference for
       ;; your own modules.
       (default +bindings +snippets +evil-commands))

