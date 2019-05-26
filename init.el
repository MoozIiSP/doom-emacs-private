;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!
;; (setq package-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(doom! :input
       ;;chinese
       ;;japanese

       :completion
       (company          ; the ultimate code completion backend
        +childframe      ; use childframes for completion popups (Emacs 26+ only)
        +auto)           ; as-you-type code completion
       (helm             ; the *other* search engine for love and life
        +childframe      ; FIXME
        +fuzzy)          ; enable fuzzy search backend for helm
       ;;ido             ; the other *other* search engine...
       ;;(ivy            ; a search engine for love and life
       ;; +fuzzy)        ; enable fuzzy search backend for ivy

       :ui
       deft              ; TESTING notational velocity for Emacs
       doom              ; what makes DOOM look the way it does `doom-themes|solaire-mode'
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       ;;indent-guides
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints
       (popup            ; TESTING tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;;pretty-code       ; replace bits of code with pretty symbols
       ;;tabbar            ; FIXME an (incomplete) tab bar for Emacs
       treemacs          ; TESTING a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe `git-gutter-fringe'
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB `vi-tilde-fringe'
       window-select     ; visually switch windows `ace-window'
       workspaces

       :editor
       file-templates
       fold              ; (nigh) universal code folding
       (format +onsave)  ; TESTING
       lispy             ; TESTING
       multiple-cursors  ; TESTING editing in many places at once
       parinfer          ; TESTING turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates `rotate-text'
       snippets

       :emacs
       (dired             ; making dired pretty [functional]
        +ranger          ; bringing the goodness of ranger to dired
        +icons)          ; colorful icons for dired-mode
       electric          ; smarter, keyword-based electric-indent
       vc                ; TESTING version-control and Emacs, sitting in a tree

       :term
       ;;eshell
       ;;term
       ;;vterm

       :tools
       ;;ansible         ;
       ;;debugger
       ;;direnv
       ;;docker          ;
       editorconfig      ; TESTING let someone else argue about tabs vs spaces `editorconfig'
       ;;ein               ; tame Jupyter notebooks with emacs
       eval
       flycheck          ; tasing you for every semicolon you forget
       flyspell          ; tasing you for misspelling mispelling
       ;;gist              ; interacting with github gists
       (lookup
        +docsets)
       lsp               ; IDE-like experience
       make              ; run make tasks from Emacs `makefile-executor'
       magit             ; a git procelain for Emacs
       ;;pass             ; password manager for nerds
       (pdf              ; pdf enhancements `pdf-tools'
        +modeline)
       prodigy           ; TESTING FIXME managing external services & code builders `peodigy'
       rgb               ; creating color strings `rainbow-mode|kurecolor'
       terraform
       ;;tmux              ; an API for interacting with tmux
       upload            ; TESTING map local to remote projects via ssh/ftp `ssh-deploy'
       ;;wakatime          ; FIXME record your code life

       :lang
       ;;agda
       assembly          ; assembly for fun or debugging
       (cc               ; C/C++/Obj-C madness
        +lsp)           ; TESTING
       common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq
       ;;crystal
       ;;clojure           ; java with a lisp
       ;;csharp            ; unity, .NET, and mono shenanigans
       data              ; TESTING config/data formats `graphql|json|toml|vimrc|yaml|csv|dhall'
       ;;erlang
       ;;elixir
       ;;elm
       emacs-lisp        ; drown in parentheses
       ;;ess               ; emacs speaks statistics
       ;;go                ; the hipster dialect
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris
       ;;(java +meghanada)
       ;;javascript
       julia             ; a better, faster MATLAB
       ;;kotlin
       latex ; writing papers in Emacs has never been so fun
       ;;ledger
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim
       ;;nix
       ;;ocaml
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +habit
        +present         ; Emacs for presentations
        +protocol
        +ipython)
       ;;perl              ; write code no one else can comprehend
       ;;php
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript
       (python           ; beautiful is better than ugly
        +lsp             ; lsp support
        +conda)          ; scientific package management
       qt                ; the 'cutest' gui framework ever
       racket            ; a DSL for DSLs
       ;;rest              ; Emacs as a REST client
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;ruby
       ;;scala
       (sh +fish +lsp)    ; TESTING she sells (ba|z)sh shells on the C xor
       ;;swift
       ;;terra
       ;;web               ; the tubes
       ;;vala

       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       regex             ; TESTING throw a exception
       (write            ; TESTING emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
       ;;floobits          ; peer programming for a price
       ;;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; The default module set reasonable defaults for Emacs. It also provides
       ;; a Spacemacs-inspired keybinding scheme, a custom yasnippet library,
       ;; and additional ex commands for evil-mode. Use it as a reference for
       ;; your own modules.
       ;; old: (default +bindings +snippets +evil-commands))
       ;; last edit: (default +bindings +snippets)
       (default +bindings +smartparens))
