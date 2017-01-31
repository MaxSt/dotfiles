;; flatlight

(deftheme flatlight
  "Flatlight light theme")

(let ((c '((class color) (min-colors 89)))
      (bold           t)
      (italic         t)

      (black          "#4c4943")
      (white          "#f7fcee")
      (grey           "#f7f3ee")
      (grey-d         "#f5f0cc")
      (grey-dd        "#f6f0e0")
      (grey-ddd       "#edd2b1")
      (yellow         "#ffefc2")
      (yellow-d       "#ffc9b0")
      (yellow-dd      "#ffb378")
      (red-d          "#ffbdbc")
      (red-dd          "#ff5458")
      (red            "#ffc9c9")
      (magenta        "#dfd9ff")
      (magenta-d      "#d5baee")
      (magenta-dd      "#906cff")
      (cyan           "#cafff4")
      (cyan-d         "#aaffe4")
      (cyan-dd         "#63f2f1")
      (blue           "#d0fcff")
      (blue-d         "#b5e8ff")
      (blue-dd         "#65b2ff")
      (green          "#c0ff9f")
      (green-dd        "#62d196")
      (green-d        "#8affda"))


  (let* ((bg             "#fffef8")
         (bg-d           (if window-system bg "#22252c"))
         (fg             black)
         (highlight      magenta-d)
         (vertical-bar   black)
         (current-line   black)
         (selection      blue-dd)
         (builtin        magenta)
         (comments       grey-dd)
         (doc-comments   green-d)
         (constants      cyan)
         (functions      magenta)
         (keywords       red)
         (methods        magenta)
         (operators      cyan-d)
         (type           blue)
         (strings        yellow)
         (variables      yellow)
         (numbers        yellow-d)
         (region         cyan)
         ;; tabs
         (tab-unfocused-bg "#353a42")
         (tab-unfocused-fg "#1e2022")
         ;; main search regions
         (search-fg black)
         (search-bg green)
         ;; other search regions
         (search-rest-bg yellow-dd)
         (search-rest-fg black)
         ;; line number column
         (linum-bg       bg-d)
         (linum-fg       black)


         (linum-hl-fg    "#BBBBBB")
         (linum-hl-bg    bg-d)
         ;; mode line
         (modeline-fg    grey)
         (modeline-fg-l  blue)
         (modeline-bg    black)
         (modeline-bg-l  (if window-system blue current-line))
         (modeline-fg-inactive grey-dd)
         (modeline-bg-inactive black)
         ;; vcs
         (vc-modified    yellow-d)
         (vc-added       green)
         (vc-deleted     red))

    (custom-theme-set-faces
     'flatlight
     ;; Doom faces
     `(flatlight-default
       ((((type graphic)) :inherit default :background ,bg)
        (t                :inherit default)))
     `(flatlight-hl-line
       ((((type graphic)) :foreground ,current-line)
        (t                :inherit hl-line)))
     `(flatlight-linum
       ((((type graphic)) :inherit linum :foreground ,bg)
        (t                :inherit linum)))
     `(flatlight-minibuffer-active ((,c (:foreground ,bg))))
     `(flatlight-nlinum-highlight  ((,c (:background ,linum-hl-fg :bold nil))))
     `(flatlight-flycheck-error    ((,c (:underline nil :background ,black :foreground ,red))))
     `(flatlight-flycheck-warning  ((,c (:underline nil :background ,black :foreground ,yellow))))
     `(flatlight-flycheck-info     ((,c (:underline nil :background ,black :foreground ,green))))
     ;; Base
     `(bold                   ((,c (:weight ,(if bold 'bold 'normal) :color ,white))))
     `(italic                 ((,c (:slant  ,(if italic 'italic 'normal)))))
     `(bold-italic            ((,c (:weight ,(if bold 'bold 'normal) :slant ,(if italic 'italic 'normal) :background ,white))))
     ;; Global
     `(default                ((,c (:background ,bg-d :foreground ,fg))))
     `(fringe                 ((,c (:inherit default :background ,comments))))
     `(region                 ((,c (:background ,region))))
     `(highlight              ((,c (:foreground ,highlight :background ,black))))
     `(hl-line                ((,c (:foreground ,bg))))
     `(cursor                 ((,c (:foreground ,blue-dd))))
     `(shadow                 ((,c (:background ,grey))))
     `(minibuffer-prompt      ((,c (:background ,blue))))
     `(tooltip                ((,c (:foreground ,fg :background ,yellow))))
     `(error                  ((,c (:background ,red))))
     `(warning                ((,c (:background ,yellow))))
     `(success                ((,c (:background ,green))))
     `(secondary-selection    ((,c (:background ,blue :background ,black))))
     `(lazy-highlight         ((,c (:foreground ,blue-d :background ,white))))
     `(match                  ((,c (:background ,green :foreground ,black :bold ,bold))))
     `(trailing-whitespace    ((,c (:foreground ,doc-comments))))
     `(vertical-border        ((,c (:background ,vertical-bar :foreground ,vertical-bar))))
     `(show-paren-match       ((,c (:foreground ,blue-d :background ,black))))
     `(linum
       ((((type graphic)) :foreground ,black :background ,grey-dd :bold nil)
        (t                :foreground ,black :background ,grey-dd :bold nil)))

     `(font-lock-builtin-face           ((,c (:background ,builtin))))
     `(font-lock-comment-face           ((,c (:background ,comments))))
     `(font-lock-comment-delimiter-face ((,c (:background ,comments))))
     `(font-lock-doc-face               ((,c (:background ,doc-comments))))
     `(font-lock-doc-string-face        ((,c (:background ,doc-comments))))
     `(font-lock-constant-face          ((,c (:background ,constants))))
     `(font-lock-function-name-face     ((,c (:background ,functions))))
     `(font-lock-keyword-face           ((,c (:background ,keywords))))
     `(font-lock-string-face            ((,c (:background ,strings))))
     `(font-lock-type-face              ((,c (:background ,type))))
     `(font-lock-variable-name-face     ((,c (:background ,variables))))
     `(font-lock-warning-face           ((,c (:inherit warning))))
     `(font-lock-negation-char-face          ((,c (:background ,operators :bold ,bold))))
     `(font-lock-preprocessor-face           ((,c (:background ,operators :bold ,bold))))
     `(font-lock-preprocessor-char-face      ((,c (:background ,operators :bold ,bold))))
     `(font-lock-regexp-grouping-backslash   ((,c (:background ,operators :bold ,bold))))
     `(font-lock-regexp-grouping-construct   ((,c (:background ,operators :bold ,bold))))
     ;; Modeline
     `(mode-line                   ((,c (:background ,modeline-fg          :foreground ,modeline-bg))))
     `(mode-line-inactive          ((,c (:background ,modeline-fg-inactive :foreground ,modeline-bg-inactive))))
     `(header-line                 ((,c (:inherit mode-line))))
     `(flatlight-modeline-buffer-path       ((,c (:background ,(if bold white cyan) :bold ,bold))))
     `(flatlight-modeline-buffer-project    ((,c (:background ,fg))))
     `(flatlight-modeline-buffer-modified   ((,c (:background ,red))))
     `(flatlight-modeline-buffer-major-mode ((,c (:background ,(if bold white blue) :bold ,bold))))
     `(flatlight-modeline-highlight     ((,c (:background ,blue))))
     `(flatlight-modeline-panel         ((,c (:background ,black :foreground ,blue))))
     `(flatlight-modeline-bar           ((,c (:foreground ,blue))))
     `(flatlight-modeline-eldoc-bar     ((,c (:foreground ,yellow))))

     ;;nlinum-relative
     `(nlinum-relative-current-face ((,c (:background ,black :foreground ,blue :bold ,bold))))

     ;; Powerline/Spaceline
     `(spaceline-highlight-face    ((,c (:foreground ,blue))))
     `(powerline-active1           ((,c (:inherit mode-line))))
     `(powerline-active2           ((,c (:foreground ,blue))))
     `(powerline-inactive1         ((,c (:inherit mode-line-inactive))))
     `(powerline-inactive2         ((,c (:inherit mode-line-inactive))))

     ;; Dired/dired-k
     `(dired-directory             ((,c (:background ,red))))
     `(dired-ignored               ((,c (:background ,comments))))
     `(dired-k-directory           ((,c (:background ,blue))))
     `(all-the-icons-dired-dir-face ((,c (:foreground ,blue-dd :background nil))))

     ;; Search
     `(isearch                     ((,c (:foreground ,search-fg :background ,search-bg :bold ,bold))))
     `(isearch-lazy-highlight-face ((,c (:background ,search-rest-bg :foreground ,search-rest-fg))))
     `(yas-field-highlight-face    ((,c (:inherit match))))

     ;; `window-divider'
     `(window-divider              ((,c (:background ,vertical-bar))))
     `(window-divider-first-pixel  ((,c (:background ,vertical-bar))))
     `(window-divider-last-pixel   ((,c (:background ,vertical-bar))))

     ;;
     ;; Plugins
     ;;


     ;; Avy
     `(avy-lead-face-0    ((,c (:foreground ,search-bg :background ,search-fg))))
     `(avy-lead-face-1    ((,c (:foreground ,search-bg :background ,search-fg))))
     `(avy-lead-face-2    ((,c (:foreground ,search-bg :background ,search-fg))))
     `(avy-lead-face      ((,c (:foreground ,search-bg :background ,search-fg))))
     ;; company-mode
     `(company-tooltip             ((,c (:inherit tooltip))))
     `(company-tooltip-common      ((,c (:background ,green))))
     `(company-tooltip-search      ((,c (:background ,search-bg :foreground ,black))))
     `(company-tooltip-selection   ((,c (:foreground ,selection))))
     `(company-tooltip-mouse       ((,c (:foreground ,magenta :background ,bg))))
     `(company-tooltip-annotation  ((,c (:background ,magenta-d))))
     `(company-scrollbar-bg        ((,c (:foreground ,black))))
     `(company-scrollbar-fg        ((,c (:foreground ,blue))))
     `(company-preview             ((,c (:background ,blue))))
     `(company-preview-common      ((,c (:background ,magenta :foreground ,black))))
     `(company-preview-search      ((,c (:inherit company-tooltip-search))))
     ;; diff-hl
     `(diff-hl-change              ((,c (:background ,vc-modified))))
     `(diff-hl-delete              ((,c (:background ,vc-deleted))))
     `(diff-hl-insert              ((,c (:background ,vc-added))))
     ;; ediff
     `(ediff-fine-diff-A    ((,c (:foreground ,red :background ,black :bold ,bold))))
     `(ediff-fine-diff-B    ((,c (:foreground ,green :background ,black :bold ,bold))))
     `(ediff-fine-diff-C    ((,c (:foreground ,grey-d :background ,black :bold ,bold))))
     `(ediff-current-diff-A ((,c (:foreground ,red))))
     `(ediff-current-diff-B ((,c (:foreground ,green))))
     `(ediff-current-diff-C ((,c (:foreground ,grey))))
     `(ediff-even-diff-A    ((,c (:foreground ,grey))))
     `(ediff-even-diff-B    ((,c (:foreground ,grey))))
     `(ediff-even-diff-C    ((,c (:foreground ,grey))))
     `(ediff-odd-diff-A     ((,c (:foreground ,grey))))
     `(ediff-odd-diff-B     ((,c (:foreground ,grey))))
     `(ediff-odd-diff-C     ((,c (:foreground ,grey))))
     ;; elscreen
     `(elscreen-tab-background-face     ((,c (:foreground ,bg-d))))
     `(elscreen-tab-control-face        ((,c (:foreground ,bg-d :background ,bg-d))))
     `(elscreen-tab-current-screen-face ((,c (:foreground ,bg :background ,fg))))
     `(elscreen-tab-other-screen-face   ((,c (:foreground ,tab-unfocused-bg :background ,tab-unfocused-fg))))
     ;; evil-mode
     `(evil-ex-substitute-matches                   ((,c (:foreground ,black :background ,red :strike-through t :bold ,bold))))
     `(evil-ex-substitute-replacement               ((,c (:foreground ,black :background ,green :bold ,bold))))
     `(evil-search-highlight-persist-highlight-face ((,c (:inherit isearch-lazy-highlight-face))))
     ;; evil-snipe
     `(evil-snipe-first-match-face ((,c (:background ,search-bg :foreground ,blue-d))))
     `(evil-snipe-matches-face     ((,c (:background ,search-bg :underline t :bold ,bold))))
     ;; flycheck
     `(flycheck-error     ((,c (:underline (:style wave :color ,red)))))
     `(flycheck-warning   ((,c (:underline (:style wave :color ,yellow)))))
     `(flycheck-info      ((,c (:underline (:style wave :color ,green)))))
     `(flyspell-incorrect ((,c (:underline (:style wave :color ,red) :inherit unspecified))))
     ;; git-gutter
     `(git-gutter-fr:modified         ((,c (:background ,vc-modified))))
     `(git-gutter-fr:added            ((,c (:background ,vc-added))))
     `(git-gutter-fr:deleted          ((,c (:background ,vc-deleted))))
     `(git-gutter+-modified        ((,c (:background ,vc-modified))))
     `(git-gutter+-added           ((,c (:background ,vc-added))))
     `(git-gutter+-deleted         ((,c (:background ,vc-deleted))))
     ;; Helm
     `(helm-selection              ((,c (:foreground ,selection))))
     `(helm-match                  ((,c (:background ,blue :underline t))))
     `(helm-source-header          ((,c (:foreground ,current-line :background ,grey))))
     `(helm-swoop-target-line-face ((,c (:background ,highlight :inverse-video t))))
     `(helm-ff-file                ((,c (:background ,fg))))
     `(helm-ff-prefix              ((,c (:background ,magenta))))
     `(helm-ff-dotted-directory    ((,c (:background ,grey-d))))
     `(helm-ff-directory           ((,c (:background ,red-d))))
     `(helm-ff-executable          ((,c (:background ,white :slant italic))))
     ;; indent-guide, highlight-{quoted,numbers,indentation}-mode
     `(indent-guide-face                         ((,c (:background "#2F2F38"))))
     `(highlight-indentation-face                ((,c (:foreground "#222830"))))
     `(highlight-indentation-current-column-face ((,c (:foreground "#222830"))))
     `(highlight-indentation-guides-odd-face     ((,c (:foreground ,bg))))
     `(highlight-indentation-guides-even-face    ((,c (:foreground "#222830"))))
     `(highlight-quoted-symbol                   ((,c (:background ,type))))
     `(highlight-quoted-quote                    ((,c (:background ,operators))))
     `(highlight-numbers-number                  ((,c (:background ,numbers))))
     ;; hide-show
     `(hs-face            ((,c (:background ,comments :foreground ,bg-d))))
     `(hs-fringe-face     ((,c (:background ,blue))))
     ;; iedit
     `(iedit-occurrence            ((,c (:background ,magenta :bold ,bold :inverse-video t))))
     `(iedit-read-only-occurrence  ((,c (:inherit region))))
     ;; ivy
     `(ivy-current-match           ((,c (:foreground ,black :background ,blue))))
     `(ivy-minibuffer-match-face-1 ((,c (:background ,cyan))))
     `(ivy-minibuffer-match-face-2 ((,c (:background ,magenta :bold ,bold))))
     `(ivy-minibuffer-match-face-3 ((,c (:background ,green :bold ,bold))))
     `(ivy-minibuffer-match-face-4 ((,c (:background ,yellow :bold ,bold))))
     `(ivy-virtual                 ((,c (:background ,fg))))
     ;; neotree
     `(neo-root-dir-face           ((,c (:background ,green :foreground ,bg))))
     `(neo-file-link-face          ((,c (:background ,fg))))
     `(neo-dir-link-face           ((,c (:background ,blue))))
     `(neo-expand-btn-face         ((,c (:background ,blue))))
     ;; pos-tip
     `(popup                       ((,c (:inherit tooltip))))
     `(popup-tip-face              ((,c (:inherit tooltip))))
     ;; swiper
     `(swiper-line-face            ((,c (:foreground ,blue    :background ,black))))
     `(swiper-match-face-1         ((,c (:foreground ,black   :background ,grey))))
     `(swiper-match-face-2         ((,c (:foreground ,red-d  :background ,black :bold ,bold))))
     `(swiper-match-face-3         ((,c (:foreground ,magenta :background ,black :bold ,bold))))
     `(swiper-match-face-4         ((,c (:foreground ,green   :background ,black :bold ,bold))))
     ;; stripe-buffer
     `(stripe-highlight            ((,c (:foreground ,bg))))
     ;; Volatile highlights
     `(vhl/default-face            ((,c (:foreground ,grey-d))))
     ;; Rainbow delimiters
     `(rainbow-delimiters-depth-1-face   ((,c (:bold ,bold :foreground ,blue-dd))))
     `(rainbow-delimiters-depth-2-face   ((,c (:bold ,bold :foreground ,magenta-dd))))
     `(rainbow-delimiters-depth-3-face   ((,c (:bold ,bold :foreground ,green-dd))))
     `(rainbow-delimiters-depth-4-face   ((,c (:bold ,bold :foreground ,red-dd))))
     `(rainbow-delimiters-depth-5-face   ((,c (:bold ,bold :foreground ,magenta-dd))))
     `(rainbow-delimiters-unmatched-face ((,c (:bold ,bold :background ,red :inverse-video t))))
     ;; re-builder
     `(reb-match-0 ((,c (:background ,red-d   :inverse-video t))))
     `(reb-match-1 ((,c (:background ,magenta  :inverse-video t))))
     `(reb-match-2 ((,c (:background ,green    :inverse-video t))))
     `(reb-match-3 ((,c (:background ,yellow   :inverse-video t))))
     ;; which-key
     `(which-key-key-face                   ((,c (:background ,green))))
     `(which-key-group-description-face     ((,c (:background ,magenta-d))))
     `(which-key-command-description-face   ((,c (:background ,blue))))
     `(which-key-local-map-description-face ((,c (:background ,magenta))))
     ;; whitespace
     `(whitespace-tab              ((,c (:background ,grey-d))))
     `(whitespace-newline          ((,c (:background ,grey-d))))
     `(whitespace-trailing         ((,c (:foreground ,grey-d))))
     `(whitespace-line             ((,c (:foreground ,current-line :background ,magenta))))
     ;; workgroups2
     `(wg-current-workgroup-face   ((,c (:background ,black  :foreground ,blue))))
     `(wg-other-workgroup-face     ((,c (:background ,grey :foreground ,current-line))))
     `(wg-divider-face             ((,c (:background ,grey-d))))
     `(wg-brace-face               ((,c (:background ,blue))))
     ;;cider
     `(cider-result-overlay-face   ((,c (:background ,green :bold ,bold :box (:line-width -1 :color ,green)))))


     ;; term and ansi-term
     `(term-color-black ((,c (:background ,bg :foreground ,grey-dd))))
     `(term-color-white ((,c (:background ,black :foreground ,grey-ddd))))
     `(term-color-red ((,c (:background ,red-d :foreground ,red-dd))))
     `(term-color-yellow ((,c (:background ,yellow-d :foreground ,yellow-dd))))
     `(term-color-green ((,c (:background ,green-d :foreground ,green-dd))))
     `(term-color-cyan ((,c (:background ,cyan-d :foreground ,cyan-dd))))
     `(term-color-blue ((,c (:background ,blue-d :foreground ,blue-dd))))
     `(term-color-magenta ((,c (:background ,magenta-d :foreground ,magenta-dd))))


     ;; smartparens
     `(sp-pair-overlay-face ((,c ())))

     ;; highlight-symbol
     `(highlight-symbol-face ((,c (:underline t))))

     ;;evil-mc-cursor
     `(evil-mc-cursor-default-face ((,c (:foreground ,yellow :background ,black))))

     ;;all-the-icons-dired
     `(all-the-icons-dired-dir-face ((,c (:background ,blue))))

     ;;latex
     `(font-latex-sectioning-1-face               ((,c (:background ,green :bold ,bold :height 1.8 :box (:line-width 4 :color ,current-line)))))
     `(font-latex-sectioning-2-face               ((,c (:background ,green :bold ,bold :height 1.5))))
     `(font-latex-sectioning-3-face               ((,c (:background ,green :bold ,bold :height 1.3))))
     `(font-latex-sectioning-4-face               ((,c (:background ,green :bold ,bold :height 1.2))))
     `(font-latex-sectioning-5-face               ((,c (:background ,green :bold ,bold :height 1.1))))
     `(font-latex-sectioning-6-face               ((,c (:background ,green :bold ,bold))))
     `(font-latex-warning-face                    ((,c (:background ,yellow-d :bold ,bold))))


     ;;
     ;; Language-specific
     ;;

     ;; (css|scss)-mode
     `(css-proprietary-property ((,c (:background ,red-d))))
     `(css-property             ((,c (:background ,green))))
     `(css-selector             ((,c (:background ,blue))))
     ;; js2-mode
     `(js2-function-param  ((,c (:background ,variables))))
     `(js2-function-call   ((,c (:background ,functions))))
     `(js2-object-property ((,c (:background ,magenta-d))))
     `(js2-jsdoc-tag       ((,c (:background ,comments))))
     ;; typescript-mode
     `(ts-object-property  ((,c (:inherit js2-object-property))))
     ;; web-mode
     `(web-mode-doctype-face           ((,c (:background ,comments))))
     `(web-mode-html-tag-face          ((,c (:background ,methods))))
     `(web-mode-html-tag-bracket-face  ((,c (:background ,methods))))
     `(web-mode-html-attr-name-face    ((,c (:background ,type))))
     `(web-mode-html-entity-face       ((,c (:background ,cyan :italic ,italic))))
     `(web-mode-block-control-face     ((,c (:background ,red-d))))
     ;;`(web-mode-html-tag-bracket-face  ((,c (:background ,operators))))
     ;; makefile-*-mode
     `(makefile-targets     ((,c (:background ,blue))))
     ;; markdown-mode
     `(markdown-header-face           ((,c (:background ,red :bold nil))))
     `(markdown-header-delimiter-face ((,c (:inherit markdown-header-face))))
     `(markdown-metadata-key-face     ((,c (:background ,red))))
     ;; `(markdown-blockquote-face ((,c (:background ,magenta-d))))
     `(markdown-markup-face     ((,c (:background ,grey))))
     ;; `(markdown-markup-face     ((,c (:background ,operators))))
     `(markdown-pre-face        ((,c (:background ,green))))
     `(markdown-inline-face     ((,c (:background ,cyan))))
     `(markdown-list-face       ((,c (:background ,red))))
     `(markdown-link-face       ((,c (:background ,blue :bold nil))))
     `(markdown-url-face        ((,c (:background ,magenta :bold nil))))
     `(markdown-header-face-1   ((,c (:inherit markdown-header-face))))
     `(markdown-header-face-2   ((,c (:inherit markdown-header-face))))
     `(markdown-header-face-3   ((,c (:inherit markdown-header-face))))
     `(markdown-header-face-4   ((,c (:inherit markdown-header-face))))
     `(markdown-header-face-5   ((,c (:inherit markdown-header-face))))
     `(markdown-header-face-6   ((,c (:inherit markdown-header-face))))
     ;;`(markdown-header-rule-face       ((,c (:inherit shadow))))
     `(markdown-italic-face            ((,c (:inherit italic :background ,magenta-d))))
     `(markdown-bold-face              ((,c (:inherit bold :background ,red-d))))
     ;;`(markdown-link-face              ((,c (:inherit shadow))))
     ;;`(markdown-link-title-face        ((,c (:inherit link))))
     ;;`(markdown-url-face               ((,c (:inherit link))))
     ;; org-mode
     `(org-tag                   ((,c (:background ,yellow :bold nil))))
     `(org-priority              ((,c (:background ,red))))
     ;;`(org-ellipsis            ((,c (:inherit hs-face))))
     `(org-hide                  ((,c (:background ,bg))))
     `(org-table                 ((,c (:background ,cyan))))
     `(org-quote                 ((,c (:slant italic :background ,grey :foreground ,current-line))))
     `(org-document-info         ((,c (:background ,red-d))))
     `(org-document-info-keyword ((,c (:background ,grey-d))))
     `(org-meta-line             ((,c (:background ,doc-comments))))
     `(org-block-begin-line      ((,c (:foreground ,grey-dd :background ,grey-d))))
     `(org-block-end-line        ((,c (:inherit org-block-begin-line))))
     `(org-block-background      ((,c (:foreground ,grey-ddd))))
     `(org-archived              ((,c (:background ,grey))))
     `(org-document-title        ((,c (:background ,cyan :height 1.2))))
     `(org-level-1               ((,c (:foreground ,current-line :background ,blue :bold ,bold :height 1.2))))
     `(org-level-2               ((,c (:foreground ,current-line :background ,blue :height 1.1))))
     `(org-level-3               ((,c (:foreground ,current-line :background ,blue :height 1.1))))
     `(org-level-4               ((,c (:foreground ,current-line :background ,blue))))
     `(org-level-5               ((,c (:foreground ,current-line :background ,blue))))
     `(org-level-6               ((,c (:foreground ,current-line :background ,blue))))
     `(org-code                  ((,c (:background ,red-d))))
     `(org-verbatim              ((,c (:background ,green))))
     `(org-formula               ((,c (:background ,cyan))))
     `(org-list-dt               ((,c (:background ,cyan))))
     `(org-footnote              ((,c (:background ,red-d))))
     `(org-link                  ((,c (:background ,cyan :underline t))))
     `(org-date                  ((,c (:background ,magenta-d))))
     `(org-todo                  ((,c (:background ,yellow :bold inherit))))
     `(org-done                  ((,c (:background ,green  :bold inherit))))
     `(org-headline-done         ((,c (:background ,grey :bold nil :strike-through t))))
     `(org-special-keyword       ((,c (:background ,magenta))))
     `(org-checkbox              ((,c (:inherit org-todo))))
     `(org-checkbox-statistics-todo ((,c (:inherit org-todo))))
     `(org-checkbox-statistics-done ((,c (:inherit org-done))))
     ;; Custom org-mode faces
     `(org-list-bullet           ((,c (:background ,cyan))))
     `(message-header-name ((,c (:background ,green)))))

    ;; (custom-theme-set-variables
    ;;  'flatlight
    ;;  `(vc-annotate-color-map
    ;;    '((20 .  ,green)
    ;;      (40 .  ,(doom-blend yellow green (/ 1.0 3)))
    ;;      (60 .  ,(doom-blend yellow green (/ 2.0 3)))
    ;;      (80 .  ,yellow)
    ;;      (100 . ,(doom-blend red-d yellow (/ 1.0 3)))
    ;;      (120 . ,(doom-blend red-d yellow (/ 2.0 3)))
    ;;      (140 . ,red-d)
    ;;      (160 . ,(doom-blend magenta red-d (/ 1.0 3)))
    ;;      (180 . ,(doom-blend magenta red-d (/ 2.0 3)))
    ;;      (200 . ,magenta)
    ;;      (220 . ,(doom-blend red magenta (/ 1.0 3)))
    ;;      (240 . ,(doom-blend red magenta (/ 2.0 3)))
    ;;      (260 . ,red)
    ;;      (280 . ,(doom-blend grey red (/ 1.0 4)))
    ;;      (300 . ,(doom-blend grey red (/ 2.0 4)))
    ;;      (320 . ,(doom-blend grey red (/ 3.0 4)))
    ;;      (340 . ,grey)
    ;;      (360 . ,grey)))
    ;;  `(vc-annotate-very-old-color nil)
    ;;  `(vc-annotate-background ,black))
    ))

(provide-theme 'flatlight)
;; End:
