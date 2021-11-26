;;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!
;; (setq package-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(doom! :input
       ;;chinese
       ;;japanese
       ;;layout          ; auie,cstrnm is the superior home row

       :completion
       (company          ; the ultimate code completion backend
        +childframe)     ; use childframes for completion popups (Emacs 26+ only)
       ;;ido             ; the other *other* search engine...
       (ivy              ; a search engine for love and life
        +fuzzy           ; enable fuzzy search backend for ivy
        +prescient       ; enables prescient filtering and sorting for Ivy searches.
        +childframe      ; Causes Ivy to display in a floating child frame, above Emacs.
       ;;+icons           ; Enables file icons for switch-{buffer,project}/find-file counsel commands.
	)
       vertico           ; the search engine of the future

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does `doom-themes|solaire-mode'
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 😄
       fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       indent-guides     ; TESTING highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;;neotree         ; a project drawer, like NERDTree for vim
       ophints           ; TESTING highlight the region an operation acts on
       (popup            ; TESTING tame sudden yet inevitable temporary windows
        +defaults)       ; default popup rules
       ;;tabs              ; an tab bar for Emacs
       treemacs          ; TESTING a project drawer, like neotree but cooler
       ;;unicode         ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe `git-gutter-fringe'
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB `vi-tilde-fringe'
       window-select     ; visually switch windows `ace-window'
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       format            ; TESTING automated prettiness
       ;;god               ; TESTING run Emacs commands without modifier keys
       ;;lispy             ; TESTING vim for lisp, for people who dont like vim
       ;;multiple-cursors  ; TESTING editing in many places at once
       ;;objed             ; TESTING text object editing for the innocent
       ;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates `rotate-text'
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired             ; making dired pretty [functional]
        +ranger)          ; bringing the goodness of ranger to dired
       electric          ; smarter, keyword-based electric-indent
       ;;ibuffer           ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; TESTING version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; a consistent, cross-platform shell (WIP)
       ;;shell             ; a terminal REPL for Emacs
       ;;term              ; terminals in Emacs
       vterm             ; another terminals in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;spell             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make
       
       :tools
       ;;biblio              ; better writing experience for writing bibtex
       (debugger +lsp)     ; TESTING stepping through code, to help you add bugs
       direnv
       docker
       editorconfig      ; TESTING let someone else argue about tabs vs spaces `editorconfig'
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       lsp                 ; IDE-like experience
       magit               ; a git procelain for Emacs
       make                ; run make tasks from Emacs `makefile-executor'
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements `pdf-tools'
       ;;prodigy           ; managing external services & code builders `peodigy'
       rgb                 ; creating color strings `rainbow-mode|kurecolor'
       ;;taskrunner        ; TODO taskrunner for all your projects
       terraform           ; TESING infrastructure as code
       tmux                ; TESTING an API for interacting with tmux
       upload              ; TESTING map local to remote projects via ssh/ftp `ssh-deploy'

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       (tty +osc)          ; improve the terminal Emacs experience

       :lang
       ;;agda
       ;;assembly          ; assembly for fun or debugging
       (cc                 ; C/C++/Obj-C madness
        +lsp)              ; TESTING
       clojure             ; java with a lisp
       common-lisp         ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data                ; TESTING config/data formats `graphql|json|toml|vimrc|yaml|csv|dhall'
       ;;erlang            ; an elegant language for a more civilized age
       ;;(dart +flutter)   ; paint ui and not much else
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp          ; drown in parentheses
       ;;ess               ; emacs speaks statistics
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       (go +lsp)           ; the hipster dialect
       ;;(haskell +dante)  ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       json                ; At least it ani't XML
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript          ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       latex               ; writing papers in Emacs has never been so fun
       ;;lean
       ;;factor
       ;;ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       markdown            ; writing docs for people to ignore
       nim                 ; python + lisp at the speed of c
       ;;nix                 ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org                ; organize your plain life in plain text
        ;;+brain
        +dragndrop         ; file drag & drop support
        +hugo              ; use Emacs for hugo blogging
        +gnuplot
        +ipython           ; ipython support for babel
        +pandoc            ; pandoc integration into org's exporter
        +pretty
        +roam2)
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python             ; beautiful is better than ugly
        +lsp               ; lsp support
        +pyright           ; language server
        +cython)           ; Cython files support
       qt                  ; the 'cutest' gui framework ever
       racket              ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +ralis)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;scheme            ; a fully conniving family of lisps
       (sh +fish)          ; TESTING she sells (ba|z)sh shells on the C xor
       ;;sml
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       web                 ; the tubes
       yaml                ; JSON, but readable
       
       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       (default +bindings +smartparens))
