;; Base16 Eighties (https://github.com/chriskempson/base16)
;; Scheme: Chris Kempson (http://chriskempson.com)

;;; base16-eighties-dark-theme.el

;;; Code:

(deftheme flatcolor)

(let ((fc-bg "#171338")
      (fc-fg "#fbfcfc")
      (fc-black "#4f4e6b")
      (fc-dark-black "#121028")
      (fc-red "#ff8080")
      (fc-dark-red "#ff5458")
      (fc-green "#95ffa4")
      (fc-dark-green "#62d196")
      (fc-yellow "#ffe9aa")
      (fc-dark-yellow "#ffb378")
      (fc-blue "#91ddff")
      (fc-dark-blue "#65b2ff")
      (fc-purple "#c991e1")
      (fc-dark-purple "#906cff")
      (fc-cyan "#aaffe4")
      (fc-dark-cyan "#63f2f1")
      (fc-gray "#cbe3e7")
      (fc-dark-gray "#a6b3cc"))

  (custom-theme-set-faces 
   'flatcolor

   `(spacemacs-cursor-face (( t (:background ,fc-cyan :foreground ,fc-dark-black))))
   `(spacemacs-normal-face (( t (:background ,fc-cyan :foreground ,fc-dark-black))))
   `(spacemacs-insert-face (( t (:background ,fc-blue :foreground ,fc-dark-black))))
   `(spacemacs-visual-face (( t (:background ,fc-purple :foreground ,fc-dark-black))))

   ;; Built-in stuff (Emacs 23)
   `(hl-line ((t (:background ,fc-dark-black))))
   `(border ((t (:background ,fc-black))))
   `(border-glyph ((t (nil))))
   `(cursor ((t (:background ,fc-blue))))
   `(default ((t (:background ,fc-bg :foreground ,fc-fg))))
   `(fringe ((t (:background ,fc-dark-black :foreground ,fc-green))))
   `(gui-element ((t (:background ,fc-yellow :foreground ,fc-cyan))))
   `(highlight ((t (:background ,fc-dark-yellow))))
   `(link ((t (:foreground ,fc-dark-purple))))
   `(link-visited ((t (:foreground ,fc-dark-cyan))))
   `(minibuffer-prompt ((t (:foreground ,fc-dark-purple))))
   `(mode-line ((t (:background ,fc-dark-black :foreground ,fc-fg :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,fc-fg :background nil))))
   `(mode-line-emphasis ((t (:foreground ,fc-cyan :slant italic))))
   `(mode-line-highlight ((t (:foreground ,fc-dark-cyan :box nil :weight normal))))
   `(mode-line-inactive ((t (:background ,fc-dark-purple :foreground ,fc-yellow :box nil))))
   `(region ((t (:background ,fc-dark-purple :foreground ,fc-bg))))
   `(secondary-selection ((t (:background ,fc-yellow))))
   `(error ((t (:foreground ,fc-dark-red :weight bold))))
   `(warning ((t (:foreground ,fc-dark-yellow :weight bold))))
   `(success ((t (:foreground ,fc-green :weight bold))))

   `(header-line ((t (:inherit mode-line :foreground ,fc-dark-cyan :background nil))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground ,fc-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fc-black))))
   `(font-lock-comment-face ((t (:foreground ,fc-black))))
   `(font-lock-constant-face ((t (:foreground ,fc-dark-yellow))))
   `(font-lock-doc-face ((t (:foreground ,fc-blue))))
   `(font-lock-doc-string-face ((t (:foreground ,fc-yellow))))
   `(font-lock-function-name-face ((t (:foreground ,fc-green))))
   `(font-lock-keyword-face ((t (:foreground ,fc-red))))
   `(font-lock-negation-char-face ((t (:foreground ,fc-dark-yellow))))
   `(font-lock-preprocessor-face ((t (:foreground ,fc-dark-purple))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,fc-dark-green))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,fc-dark-cyan))))
   `(font-lock-string-face ((t (:foreground ,fc-yellow))))
   `(font-lock-type-face ((t (:foreground ,fc-blue))))
   `(font-lock-variable-name-face ((t (:foreground ,fc-dark-blue))))
   `(font-lock-warning-face ((t (:foreground ,fc-dark-yellow))))

   ;; linum-mode
   ;; `(linum ((t (:height ,85 :weight ,'light :background ,fc-dark-black :foreground ,fc-black))))
   ;; `(linum-relative-current-face ((t (:height ,90 :weight ,'bold :background ,fc-blue :foreground ,fc-bg :weight bold))))
   `(linum ((t (:background ,fc-dark-black :foreground ,fc-black))))
   `(linum-relative-current-face ((t (:background ,fc-blue :foreground ,fc-bg :weight bold))))

   ;; Search
   `(match ((t (:foreground ,fc-dark-purple :background ,fc-red))))
   `(isearch ((t (:foreground ,fc-bg :background ,fc-green))))
   `(isearch-lazy-highlight-face ((t (:background ,fc-yellow :foreground ,fc-bg))))
   `(isearch-fail ((t (:background ,fc-red :inherit font-lock-warning-face :inverse-video t))))
   ;`(evil-search-highlight-persist-highlight-face ((t (:background ,fc-yellow :foreground ,fc-bg :inherit font-lock-warning-face))))


   ;; Popups
   `(popup-face ((t (:foreground ,fc-purple :background ,fc-green))))
   `(popup-isearch-match ((t (:foreground ,fc-black :background ,fc-dark-yellow))))
   `(popup-scroll-bar-background-face ((t (:background ,fc-yellow))))
   `(popup-scroll-bar-foreground-face ((t (:background ,fc-purple))))
   `(popup-summary-face ((t (:foreground ,fc-blue))))
   `(popup-tip-face ((t (:foreground ,fc-black :background ,fc-dark-green))))
   `(popup-menu-mouse-face ((t (:foreground ,fc-black :background ,fc-dark-purple))))
   `(popup-menu-selection-face ((t (:foreground ,fc-black :background ,fc-dark-blue))))

   ;; Popups
   `(popup-face ((t (:foreground ,fc-purple :background ,fc-green))))
   `(popup-isearch-match ((t (:foreground ,fc-black :background ,fc-dark-yellow))))
   `(popup-scroll-bar-background-face ((t (:background ,fc-yellow))))
   `(popup-scroll-bar-foreground-face ((t (:background ,fc-purple))))
   `(popup-summary-face ((t (:foreground ,fc-blue))))
   `(popup-tip-face ((t (:foreground ,fc-black :background ,fc-dark-green))))
   `(popup-menu-mouse-face ((t (:foreground ,fc-black :background ,fc-dark-purple))))
   `(popup-menu-selection-face ((t (:foreground ,fc-black :background ,fc-dark-blue))))

   ;; Flymake
   `(flymake-warnline ((t (:underline ,fc-dark-red :background ,fc-red))))
   `(flymake-errline ((t (:underline ,fc-dark-black :background ,fc-red))))

   ;; Clojure errors
   `(clojure-test-failure-face ((t (:background nil :inherit flymake-warnline))))
   `(clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
   `(clojure-test-success-face ((t (:background nil :foreground nil :underline ,fc-dark-yellow))))

   ;; For Brian Carper's extended clojure syntax table
   `(clojure-keyword ((t (:foreground ,fc-green))))
   `(clojure-parens ((t (:foreground ,fc-cyan))))
   ;`(clojure-braces ((t (:foreground ,fc-dark-yellow))))
   `(clojure-brackets ((t (:foreground ,fc-green))))
   `(clojure-double-quote ((t (:foreground ,fc-yellow :background nil))))
   `(clojure-special ((t (:foreground ,fc-dark-purple))))
   `(clojure-java-call ((t (:foreground ,fc-purple))))

    ;;;;; cider
   `(cider-enlightened ((t (:background nil :box (:color ,fc-yellow :line-width -1 :style nil) :foreground ,fc-yellow))))
   `(cider-enlightened-local ((t (:foreground ,fc-yellow))))
   `(cider-instrumented-face ((t (:background nil :box (:color ,fc-red :line-width -1 :style nil) :foreground ,fc-red))))
   `(cider-result-overlay-face ((t (:background nil :box (:color ,fc-blue :line-width -1 :style nil) :foreground ,fc-red))))
    `(cider-test-error-face ((t (:background ,fc-red :foreground ,fc-bg))))
    `(cider-test-failure-face ((t (:background ,fc-yellow :foreground ,fc-bg))))
    `(cider-test-success-face ((t (:background ,fc-green :foreground ,fc-bg))))

   ;; MMM-mode
   `(mmm-code-submode-face ((t (:background ,fc-yellow))))
   `(mmm-comment-submode-face ((t (:inherit font-lock-comment-face))))
   `(mmm-output-submode-face ((t (:background ,fc-yellow))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,fc-cyan))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,fc-purple))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,fc-blue))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,fc-yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,fc-green))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,fc-red))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,fc-dark-cyan))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,fc-dark-purple))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,fc-dark-blue))))

   ;; IDO
   `(ido-subdir ((t (:foreground ,fc-blue))))
   `(ido-first-match ((t (:foreground ,fc-dark-red :weight bold))))
   `(ido-only-match ((t (:foreground ,fc-red :weight bold))))
   `(ido-indicator ((t (:foreground ,fc-dark-black :background ,fc-dark-purple))))
   `(ido-virtual ((t (:foreground ,fc-blue))))

   ;; which-function
   `(which-func ((t (:foreground ,fc-dark-purple :background nil :weight bold))))

   `(trailing-whitespace ((t (:background ,fc-dark-blue :foreground ,fc-dark-green))))
   `(whitespace-empty ((t (:foreground ,fc-dark-black :background ,fc-dark-green))))
   `(whitespace-hspace ((t (:background ,fc-blue :foreground ,fc-blue))))
   `(whitespace-indentation ((t (:background ,fc-dark-green :foreground ,fc-dark-black))))
   `(whitespace-line ((t (:background ,fc-red :foreground ,fc-dark-gray))))
   `(whitespace-newline ((t (:foreground ,fc-blue))))
   `(whitespace-space ((t (:background ,fc-red :foreground ,fc-blue))))
   `(whitespace-space-after-tab ((t (:background ,fc-dark-green :foreground ,fc-dark-black))))
   `(whitespace-space-before-tab ((t (:background ,fc-dark-red :foreground ,fc-dark-black))))
   `(whitespace-tab ((t (:background ,fc-blue :foreground ,fc-blue))))
   `(whitespace-trailing ((t (:background ,fc-dark-black :foreground ,fc-dark-green))))

   ;; Parenthesis matching (built-in)
   `(show-paren-match ((t (:background ,fc-green :foreground ,fc-yellow))))
   `(show-paren-mismatch ((t (:background ,fc-dark-red :foreground ,fc-yellow))))
   ;; Pair matching (show-smartparens-mode)
   `(sp-pair-overlay-face ((t (:weight normal))))
   `(sp-show-pair-match-face ((t (:weight normal))))

   ;; Parenthesis dimming (parenface)
   `(paren-face ((t (:foreground ,fc-blue :background nil))))

   `(sh-heredoc ((t (:foreground nil :inherit font-lock-string-face :weight normal))))
   `(sh-quoted-exec ((t (:foreground nil :inherit font-lock-preprocessor-face))))
   `(slime-highlight-edits-face ((t (:weight normal))))
   `(slime-repl-input-face ((t (:weight normal :underline nil))))
   `(slime-repl-prompt-face ((t (:underline nil :weight normal :foreground ,fc-dark-cyan))))
   `(slime-repl-result-face ((t (:foreground ,fc-dark-yellow))))
   `(slime-repl-output-face ((t (:foreground ,fc-dark-purple :background ,fc-red))))

   `(csv-separator-face ((t (:foreground ,fc-dark-red))))

   `(diff-added ((t (:foreground ,fc-dark-yellow))))
   `(diff-changed ((t (:foreground ,fc-dark-green))))
   `(diff-removed ((t (:foreground ,fc-dark-red))))
   `(diff-header ((t (:background ,fc-red))))
   `(diff-file-header ((t (:background ,fc-green))))
   `(diff-hunk-header ((t (:background ,fc-red :foreground ,fc-dark-cyan))))

   `(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-odd-diff-A  ((t (:foreground ,fc-blue :background nil :inverse-video t))))
   `(ediff-odd-diff-B  ((t (:foreground ,fc-blue :background nil :inverse-video t))))

   `(eldoc-highlight-function-argument ((t (:foreground ,fc-dark-yellow :weight bold))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face ((t (:foreground ,fc-cyan))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,fc-dark-yellow :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,fc-blue))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,fc-dark-green))))

   ;; auctex
   `(font-latex-bold-face ((t (:foreground ,fc-dark-yellow))))
   `(font-latex-doctex-documentation-face ((t (:background ,fc-yellow))))
   `(font-latex-italic-face ((t (:foreground ,fc-dark-yellow))))
   `(font-latex-math-face ((t (:foreground ,fc-dark-red))))
   `(font-latex-sectioning-0-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sectioning-1-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sectioning-2-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sectioning-3-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sectioning-4-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sectioning-5-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-sedate-face ((t (:foreground ,fc-dark-blue))))
   `(font-latex-string-face ((t (:foreground ,fc-dark-green))))
   `(font-latex-verbatim-face ((t (:foreground ,fc-dark-red))))
   `(font-latex-warning-face ((t (:foreground ,fc-dark-red))))


;;;;; powerline
   `(powerline-active1 ((t (:background ,fc-cyan :foreground ,fc-bg))))
   `(powerline-active2 ((t (:background ,fc-dark-cyan :foreground ,fc-bg))))
   `(powerline-inactive1 ((t (:background ,fc-purple :foreground ,fc-bg))))
   `(powerline-inactive2 ((t (:background ,fc-dark-purple :foreground ,fc-bg))))
   `(powerline-evil-normal-face ((t (:background ,fc-dark-purple :foreground ,fc-bg))))
   ;; dired+
   `(diredp-compressed-file-suffix ((t (:foreground ,fc-dark-purple))))
   `(diredp-dir-heading ((t (:foreground nil :background nil :inherit heading))))
   `(diredp-dir-priv ((t (:foreground ,fc-dark-blue :background nil))))
   `(diredp-exec-priv ((t (:foreground ,fc-dark-purple :background nil))))
   `(diredp-executable-tag ((t (:foreground ,fc-dark-red :background nil))))
   `(diredp-file-name ((t (:foreground ,fc-dark-green))))
   `(diredp-file-suffix ((t (:foreground ,fc-dark-yellow))))
   `(diredp-flag-mark-line ((t (:background nil :inherit highlight))))
   `(diredp-ignored-file-name ((t (:foreground ,fc-blue))))
   `(diredp-link-priv ((t (:background nil :foreground ,fc-dark-cyan))))
   `(diredp-mode-line-flagged ((t (:foreground ,fc-red))))
   `(diredp-mode-line-marked ((t (:foreground ,fc-dark-yellow))))
   `(diredp-no-priv ((t (:background nil))))
   `(diredp-number ((t (:foreground ,fc-dark-green))))
   `(diredp-other-priv ((t (:background nil :foreground ,fc-dark-cyan))))
   `(diredp-rare-priv ((t (:foreground ,fc-blue :background nil))))
   `(diredp-read-priv ((t (:foreground ,fc-dark-yellow :background nil))))
   `(diredp-symlink ((t (:foreground ,fc-dark-cyan))))
   `(diredp-write-priv ((t (:foreground ,fc-dark-green :background nil))))

   ;; term and ansi-term
   `(term-color-black ((t (:foreground ,fc-black :background ,fc-dark-black))))
   `(term-color-white ((t (:foreground ,fc-gray :background ,fc-dark-gray))))
   `(term-color-red ((t (:foreground ,fc-red :background ,fc-dark-red))))
   `(term-color-yellow ((t (:foreground ,fc-yellow :background ,fc-dark-yellow))))
   `(term-color-green ((t (:foreground ,fc-green :background ,fc-dark-green))))
   `(term-color-cyan ((t (:foreground ,fc-cyan :background ,fc-dark-cyan))))
   `(term-color-blue ((t (:foreground ,fc-blue :background ,fc-dark-blue))))
   `(term-color-magenta ((t (:foreground ,fc-purple :background ,fc-dark-purple))))

   `(link ((t (:foreground nil :underline t))))
   `(widget-button ((t (:underline t))))
   `(widget-field ((t (:background ,fc-yellow :box (:line-width 1 :color ,fc-cyan)))))

   ;; Compilation (most faces politely inherit from 'success, 'error, 'warning etc.)
   `(compilation-column-number ((t (:foreground ,fc-dark-green))))
   `(compilation-line-number ((t (:foreground ,fc-dark-green))))
   `(compilation-message-face ((t (:foreground ,fc-dark-purple))))
   `(compilation-mode-line-exit ((t (:foreground ,fc-dark-yellow))))
   `(compilation-mode-line-fail ((t (:foreground ,fc-dark-red))))
   `(compilation-mode-line-run ((t (:foreground ,fc-dark-purple))))

   ;; Grep
   `(grep-context-face ((t (:foreground ,fc-blue))))
   `(grep-error-face ((t (:foreground ,fc-dark-red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,fc-dark-purple))))
   `(grep-match-face ((t (:foreground nil :background nil :inherit match))))

   `(regex-tool-matched-face ((t (:foreground nil :background nil :inherit match))))

   ;; Cscope
   `(cscope-file-face ((t (:foreground ,fc-dark-yellow))))
   `(cscope-function-face ((t (:foreground ,fc-dark-purple))))
   `(cscope-line-number-face ((t (:foreground ,fc-dark-green))))
   `(cscope-mouse-face ((t (:background ,fc-red :foreground ,fc-blue))))
   `(cscope-separator-face ((t (:foreground ,fc-red :overline t :underline t :weight bold))))

   ;; mark-multiple
   `(mm/master-face ((t (:inherit region :foreground nil :background nil))))
   `(mm/mirror-face ((t (:inherit region :foreground nil :background nil))))

   ;; org-mode
   `(org-agenda-structure ((t (:foreground ,fc-dark-cyan))))
   `(org-agenda-date ((t (:foreground ,fc-dark-purple :underline nil))))
   `(org-agenda-done ((t (:foreground ,fc-dark-yellow))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,fc-blue))))
   `(org-block ((t (:foreground ,fc-dark-red))))
   `(org-code ((t (:foreground ,fc-dark-green))))
   `(org-column ((t (:background ,fc-red))))
   `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
   `(org-date ((t (:foreground ,fc-dark-cyan :underline t))))
   `(org-document-info ((t (:foreground ,fc-dark-blue))))
   `(org-document-info-keyword ((t (:foreground ,fc-dark-yellow))))
   `(org-document-title ((t (:weight bold :foreground ,fc-dark-red :height 1.44))))
   `(org-done ((t (:foreground ,fc-dark-yellow))))
   `(org-ellipsis ((t (:foreground ,fc-blue))))
   `(org-footnote ((t (:foreground ,fc-dark-blue))))
   `(org-formula ((t (:foreground ,fc-black))))
   `(org-hide ((t (:foreground ,fc-yellow))))
   `(org-link ((t (:foreground ,fc-dark-purple))))
   `(org-scheduled ((t (:foreground ,fc-dark-yellow))))
   `(org-scheduled-previously ((t (:foreground ,fc-dark-red))))
   `(org-scheduled-today ((t (:foreground ,fc-dark-yellow))))
   `(org-special-keyword ((t (:foreground ,fc-dark-red))))
   `(org-table ((t (:foreground ,fc-dark-cyan))))
   `(org-todo ((t (:foreground ,fc-red))))
   `(org-upcoming-deadline ((t (:foreground ,fc-dark-red))))
   `(org-warning ((t (:weight bold :foreground ,fc-dark-yellow))))
   ;`(org-level-1 ((t (:height 2.0))))
   ;`(org-level-2 ((t (:height 1.5))))

   `(markdown-url-face ((t (:inherit link))))
   `(markdown-link-face ((t (:foreground ,fc-dark-purple :underline t))))

   `(hl-sexp-face ((t (:background ,fc-yellow))))
   `(highlight-80+ ((t (:background ,fc-yellow))))

   ;; Python-specific overrides
   `(py-builtins-face ((t (:foreground ,fc-dark-red :weight normal))))

   ;; js2-mode
   `(js2-warning-face ((t (:underline ,fc-dark-red))))
   `(js2-error-face ((t (:foreground nil :underline ,fc-dark-black))))
   `(js2-external-variable-face ((t (:foreground ,fc-dark-cyan))))
   `(js2-function-param-face ((t (:foreground ,fc-dark-purple))))
   `(js2-instance-member-face ((t (:foreground ,fc-dark-purple))))
   `(js2-private-function-call-face ((t (:foreground ,fc-green))))

   ;; js3-mode
   `(js3-warning-face ((t (:underline ,fc-dark-red))))
   `(js3-error-face ((t (:foreground nil :underline ,fc-dark-black))))
   `(js3-external-variable-face ((t (:foreground ,fc-dark-cyan))))
   `(js3-function-param-face ((t (:foreground ,fc-dark-purple))))
   `(js3-jsdoc-tag-face ((t (:foreground ,fc-dark-red))))
   `(js3-jsdoc-type-face ((t (:foreground ,fc-dark-blue))))
   `(js3-jsdoc-value-face ((t (:foreground ,fc-dark-green))))
   `(js3-jsdoc-html-tag-name-face ((t (:foreground ,fc-dark-purple))))
   `(js3-jsdoc-html-tag-delimiter-face ((t (:foreground ,fc-dark-yellow))))
   `(js3-instance-member-face ((t (:foreground ,fc-dark-purple))))
   `(js3-private-function-call-face ((t (:foreground ,fc-green))))

   ;; nxml
   `(nxml-name-face ((t (:foreground unspecified :inherit font-lock-constant-face))))
   `(nxml-attribute-local-name-face ((t (:foreground unspecified :inherit font-lock-variable-name-face))))
   `(nxml-ref-face ((t (:foreground unspecified :inherit font-lock-preprocessor-face))))
   `(nxml-delimiter-face ((t (:foreground unspecified :inherit font-lock-keyword-face))))
   `(nxml-delimited-data-face ((t (:foreground unspecified :inherit font-lock-string-face))))
   `(rng-error-face ((t (:underline ,fc-dark-black))))

   ;; RHTML
   `(erb-delim-face ((t (:background ,fc-yellow))))
   `(erb-exec-face ((t (:background ,fc-yellow :weight bold))))
   `(erb-exec-delim-face ((t (:background ,fc-yellow))))
   `(erb-out-face ((t (:background ,fc-yellow :weight bold))))
   `(erb-out-delim-face ((t (:background ,fc-yellow))))
   `(erb-comment-face ((t (:background ,fc-yellow :weight bold :slant italic))))
   `(erb-comment-delim-face ((t (:background ,fc-yellow))))

   ;; Message-mode
   `(message-header-other ((t (:foreground nil :background nil :weight normal))))
   `(message-header-subject ((t (:inherit message-header-other :weight bold :foreground ,fc-dark-green))))
   `(message-header-to ((t (:inherit message-header-other :weight bold :foreground ,fc-dark-red))))
   `(message-header-cc ((t (:inherit message-header-to :foreground nil))))
   `(message-header-name ((t (:foreground ,fc-dark-purple :background nil))))
   `(message-header-newsgroups ((t (:foreground ,fc-dark-blue :background nil :slant normal))))
   `(message-separator ((t (:foreground ,fc-dark-cyan))))

   ;; Jabber
   `(jabber-chat-prompt-local ((t (:foreground ,fc-dark-green))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,fc-dark-red))))
   `(jabber-chat-prompt-system ((t (:foreground ,fc-dark-green :weight bold))))
   `(jabber-chat-text-local ((t (:foreground ,fc-dark-green))))
   `(jabber-chat-text-foreign ((t (:foreground ,fc-dark-red))))
   `(jabber-chat-text-error ((t (:foreground ,fc-dark-red))))

   `(jabber-roster-user-online ((t (:foreground ,fc-dark-yellow))))
   `(jabber-roster-user-xa ((t :foreground ,fc-blue)))
   `(jabber-roster-user-dnd ((t :foreground ,fc-dark-green)))
   `(jabber-roster-user-away ((t (:foreground ,fc-dark-red))))
   `(jabber-roster-user-chatty ((t (:foreground ,fc-dark-cyan))))
   `(jabber-roster-user-error ((t (:foreground ,fc-dark-red))))
   `(jabber-roster-user-offline ((t (:foreground ,fc-blue))))

   `(jabber-rare-time-face ((t (:foreground ,fc-blue))))
   `(jabber-activity-face ((t (:foreground ,fc-dark-cyan))))
   `(jabber-activity-personal-face ((t (:foreground ,fc-dark-blue))))

   ;; Gnus
   `(gnus-cite-1 ((t (:inherit outline-1 :foreground nil))))
   `(gnus-cite-2 ((t (:inherit outline-2 :foreground nil))))
   `(gnus-cite-3 ((t (:inherit outline-3 :foreground nil))))
   `(gnus-cite-4 ((t (:inherit outline-4 :foreground nil))))
   `(gnus-cite-5 ((t (:inherit outline-5 :foreground nil))))
   `(gnus-cite-6 ((t (:inherit outline-6 :foreground nil))))
   `(gnus-cite-7 ((t (:inherit outline-7 :foreground nil))))
   `(gnus-cite-8 ((t (:inherit outline-8 :foreground nil))))
   ;; there are several more -cite- faces...
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-header-from ((t (:inherit message-header-other-face :weight bold :foreground ,fc-dark-red))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-button ((t (:inherit link :foreground nil))))
   `(gnus-signature ((t (:inherit font-lock-comment-face))))

   `(gnus-summary-normal-unread ((t (:foreground ,fc-dark-purple :weight normal))))
   `(gnus-summary-normal-read ((t (:foreground ,fc-cyan :weight normal))))
   `(gnus-summary-normal-ancient ((t (:foreground ,fc-dark-blue :weight normal))))
   `(gnus-summary-normal-ticked ((t (:foreground ,fc-dark-red :weight normal))))
   `(gnus-summary-low-unread ((t (:foreground ,fc-blue :weight normal))))
   `(gnus-summary-low-read ((t (:foreground ,fc-blue :weight normal))))
   `(gnus-summary-low-ancient ((t (:foreground ,fc-blue :weight normal))))
   `(gnus-summary-high-unread ((t (:foreground ,fc-dark-green :weight normal))))
   `(gnus-summary-high-read ((t (:foreground ,fc-dark-yellow :weight normal))))
   `(gnus-summary-high-ancient ((t (:foreground ,fc-dark-yellow :weight normal))))
   `(gnus-summary-high-ticked ((t (:foreground ,fc-dark-red :weight normal))))
   `(gnus-summary-cancelled ((t (:foreground ,fc-dark-red :background nil :weight normal))))

   `(gnus-group-mail-low ((t (:foreground ,fc-blue))))
   `(gnus-group-mail-low-empty ((t (:foreground ,fc-blue))))
   `(gnus-group-mail-1 ((t (:foreground nil :weight normal :inherit outline-1))))
   `(gnus-group-mail-2 ((t (:foreground nil :weight normal :inherit outline-2))))
   `(gnus-group-mail-3 ((t (:foreground nil :weight normal :inherit outline-3))))
   `(gnus-group-mail-4 ((t (:foreground nil :weight normal :inherit outline-4))))
   `(gnus-group-mail-5 ((t (:foreground nil :weight normal :inherit outline-5))))
   `(gnus-group-mail-6 ((t (:foreground nil :weight normal :inherit outline-6))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1 :foreground ,fc-blue))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2 :foreground ,fc-blue))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3 :foreground ,fc-blue))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-mail-4 :foreground ,fc-blue))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-mail-5 :foreground ,fc-blue))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-mail-6 :foreground ,fc-blue))))
   `(gnus-group-news-1 ((t (:foreground nil :weight normal :inherit outline-5))))
   `(gnus-group-news-2 ((t (:foreground nil :weight normal :inherit outline-6))))
   `(gnus-group-news-3 ((t (:foreground nil :weight normal :inherit outline-7))))
   `(gnus-group-news-4 ((t (:foreground nil :weight normal :inherit outline-8))))
   `(gnus-group-news-5 ((t (:foreground nil :weight normal :inherit outline-1))))
   `(gnus-group-news-6 ((t (:foreground nil :weight normal :inherit outline-2))))
   `(gnus-group-news-1-empty ((t (:inherit gnus-group-news-1 :foreground ,fc-blue))))
   `(gnus-group-news-2-empty ((t (:inherit gnus-group-news-2 :foreground ,fc-blue))))
   `(gnus-group-news-3-empty ((t (:inherit gnus-group-news-3 :foreground ,fc-blue))))
   `(gnus-group-news-4-empty ((t (:inherit gnus-group-news-4 :foreground ,fc-blue))))
   `(gnus-group-news-5-empty ((t (:inherit gnus-group-news-5 :foreground ,fc-blue))))
   `(gnus-group-news-6-empty ((t (:inherit gnus-group-news-6 :foreground ,fc-blue))))

   `(erc-direct-msg-face ((t (:foreground ,fc-dark-red))))
   `(erc-error-face ((t (:foreground ,fc-dark-red))))
   `(erc-header-face ((t (:foreground ,fc-cyan :background ,fc-blue))))
   `(erc-input-face ((t (:foreground ,fc-dark-yellow))))
   `(erc-keyword-face ((t (:foreground ,fc-dark-green))))
   `(erc-current-nick-face ((t (:foreground ,fc-dark-yellow))))
   `(erc-my-nick-face ((t (:foreground ,fc-dark-yellow))))
   `(erc-nick-default-face ((t (:weight normal :foreground ,fc-dark-cyan))))
   `(erc-nick-msg-face ((t (:weight normal :foreground ,fc-dark-green))))
   `(erc-notice-face ((t (:foreground ,fc-blue))))
   `(erc-pal-face ((t (:foreground ,fc-dark-red))))
   `(erc-prompt-face ((t (:foreground ,fc-dark-purple))))
   `(erc-timestamp-face ((t (:foreground ,fc-dark-blue))))

   ;; helm
   `(helm-M-x-key ((t (:foreground ,fc-dark-blue))))
   `(helm-action ((t (:foreground ,fc-purple))))
   `(helm-buffer-directory ((t (:foreground ,fc-blue :background nil :weight bold))))
   `(helm-buffer-file ((t (:foreground ,fc-dark-blue))))
   `(helm-buffer-not-saved ((t (:foreground ,fc-dark-red))))
   `(helm-buffer-process ((t (:foreground ,fc-yellow))))
   `(helm-buffer-saved-out ((t (:foreground ,fc-dark-gray))))
   `(helm-buffer-size ((t (:foreground ,fc-dark-red))))
   `(helm-candidate-number ((t (:foreground ,fc-black :background ,fc-dark-red))))
   `(helm-ff-directory ((t (:foreground ,fc-blue :background nil :weight bold))))
   `(helm-ff-executable ((t (:foreground ,fc-dark-yellow))))
   `(helm-ff-file ((t (:foreground ,fc-dark-blue))))
   `(helm-ff-invalid-symlink ((t (:foreground ,fc-black :background ,fc-dark-black))))
   `(helm-ff-prefix ((t (:foreground nil :background nil))))
   `(helm-ff-symlink ((t (:foreground ,fc-black :background ,fc-dark-blue))))
   `(helm-grep-cmd-line ((t (:foreground ,fc-dark-yellow))))
   `(helm-grep-file ((t (:foreground ,fc-dark-blue))))
   `(helm-grep-finish ((t (:foreground ,fc-black :background ,fc-dark-red))))
   `(helm-grep-lineno ((t (:foreground ,fc-yellow))))
   `(helm-grep-match ((t (:foreground ,fc-dark-green))))
   `(helm-grep-running ((t (:foreground ,fc-dark-red))))
   `(helm-header ((t (:foreground ,fc-dark-green :background ,fc-black :underline nil))))
   `(helm-match ((t (:foreground ,fc-dark-green))))
   `(helm-moccur-buffer ((t (:foreground ,fc-dark-blue))))
   `(helm-selection ((t (:foreground ,fc-dark-black :background ,fc-cyan :underline nil))))
   `(helm-selection-line ((t (:foreground nil :background ,fc-green))))
   `(helm-separator ((t (:foreground ,fc-green))))
   `(helm-source-header ((t (:foreground ,fc-dark-black :background ,fc-dark-blue :weight bold))))
   `(helm-visible-mark ((t (:foreground ,fc-black :background ,fc-dark-yellow))))

   `(custom-variable-tag ((t (:foreground ,fc-dark-purple))))
   `(custom-group-tag ((t (:foreground ,fc-dark-purple))))
   `(custom-state ((t (:foreground ,fc-dark-yellow)))))

  (custom-theme-set-variables
   'flatcolor

 `(ansi-color-names-vector
     ;; black, fc-dark-black, fc-dark-yellow, fc-dark-green, fc-dark-purple, magenta, cyan, white
     [,fc-black ,fc-dark-black ,fc-dark-yellow ,fc-dark-green ,fc-dark-purple ,fc-dark-cyan ,fc-dark-purple ,fc-purple])
   `(ansi-term-color-vector
     ;; black, fc-dark-black, fc-dark-yellow, fc-dark-green, fc-dark-purple, magenta, cyan, white
     [unspecified ,fc-black ,fc-dark-black ,fc-dark-yellow ,fc-dark-green ,fc-dark-purple ,fc-dark-cyan ,fc-dark-purple ,fc-purple])))

(provide-theme 'flatcolor)

;;; base16-eighties-dark-theme.el ends here

