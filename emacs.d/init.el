(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))
(elpaca-wait)

;;; -*- lexical-binding: t -*-

(eval-and-compile
;; Speed up startup
(defvar default-file-name-handler-alist file-name-handler-alist)
;;disable native comp warnings popup
(setq comp-async-report-warnings-errors nil)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 80000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init."
            ;; we append default-file-name-handler-alist with the current
            ;; file-name-handler-alist in order to set the values we have set in
            ;; the init config.
            (setq file-name-handler-alist (append default-file-name-handler-alist file-name-handler-alist))
            (setq gc-cons-threshold 800000)
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
                              (lambda ()
                                (unless (frame-focus-state)
                                  (garbage-collect))))
(add-hook 'focus-out-hook 'garbage-collect))))
)

(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))

(setq read-process-output-max (* 1024 1024)) ;; 1mb



(setq
 inhibit-startup-screen t
 x-select-enable-clipboard t

 ;; Save whatever’s in the current (system) clipboard before
 ;; replacing it with the Emacs’ text.
 ;; https://github.com/dakrone/eos/blob/master/eos.org
 save-interprogram-paste-before-kill t

 column-number-mode t

 ;; faster scrolling (see https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746)
 auto-window-vscroll nil

 ;; scroll line by line (https://www.gnu.org/software/emacs/manual/html_node/efaq/Scrolling-only-one-line.html)
 scroll-conservatively most-positive-fixnum

 tab-stop-list (number-sequence 2 120 2))
;; relative line numbers
;; The problem with 'visual is that it does not play very nice with
;; visual-fill-column, because it shows a line number for a wrapped line.
;; The problem with 'relative is, that it does not work for folded org-mode headers.
;;(setq-default display-line-numbers 'visual)
(setq-default display-line-numbers nil)
;; make current line 0
(setq display-line-numbers-current-absolute nil)
(setq display-line-numbers-widen t)
(setq-default fill-column 80)
(setq-default truncate-lines nil) ; line wrap
(setq-default indent-tabs-mode nil
              tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)
(setq-default
 indicate-buffer-boundaries nil  ; don't show where buffer starts/ends
 indicate-empty-lines nil        ; don't show empty lines
 fringes-outside-margins t       ; switches order of fringe and margin
 ;; Keep cursors and highlights in current window only
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil
 ;; Disable bidirectional text support for slight performance bonus
 bidi-display-reordering nil
 bidi-paragraph-direction nil
 ;; Remove continuation arrow on right fringe
 ;; fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
 ;;                              fringe-indicator-alist)
 blink-matching-paren nil ; don't blink--too distracting
 ;;show-trailing-whitespace t ;; show trailing whitespace
 )
;; always show keyboard on touch screen
(setq touch-screen-display-keyboard t)
 ;; turn off ad-redefinition warnings
(setq ad-redefinition-action 'accept)
;; disable the annoying bell ring
(setq ring-bell-function 'ignore)
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
;; (setq gc-cons-threshold 50000000)
;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)
;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(global-hl-line-mode t) ;; highlight current line

;;(use-package auto-dictionary :init (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))
  (setq-default ispell-really-hunspell t)
  (setq-default ispell-program-name "hunspell")

  ;; you could set `ispell-dictionary` instead but `ispell-local-dictionary' has higher priority
  (setq ispell-local-dictionary "en_US")

  ;; use the hunspell -d flag to add more dictionaries
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US,de_AT") nil utf-8)))

(use-package flyspell
  :ensure nil
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode))
  :config (setq flyspell-issue-message-flag nil)
  )

(setq
 make-backup-files t
 version-control t   ; use numbers for backup files
 kept-new-versions 10
 kept-old-versions 0
 delete-old-versions t
 backup-by-copying t
 vc-make-backup-files t
 auto-save-default nil
 backup-directory-alist '(("." . "~/.emacs.d/backup")))

(setq create-lockfiles nil)

;; Don't litter my init file
(setq custom-file "~/.emacs.d/local/custom-set.el")
(load custom-file 'noerror)

(require 'epa-file)
(epa-file-enable)

(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(set-frame-parameter nil 'internal-border-width 10)

(when (not (my/is-android-p))
  ;;(set-default-font "Iosevka-12:spacing=110")
  (add-to-list 'default-frame-alist '(font . "Iosevka:pixelsize=20")))

(scroll-bar-mode 0)
(tool-bar-mode -1)     ; disable the tool-bar
(menu-bar-mode -1)     ; disable the menu-bar
(show-paren-mode)
;;(electric-pair-mode 1)

;;; Transparent titlebar
;; https://github.com/d12frosted/homebrew-emacs-plus/blob/master/Formula/emacs-plus.rb#L98
;; https://github.com/d12frosted/homebrew-emacs-plus/issues/55
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Properties-in-Mode.html#Properties-in-Mode
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(setq frame-title-format "%b")

(setq window-divider-default-right-width 10)
;;(setq window-divider-default-bottom-width 12)
(setq window-divider-default-places t)
(window-divider-mode 1)

(define-fringe-bitmap 'tilde [64 168 16] nil nil 'center)
(set-fringe-bitmap-face 'tilde 'fringe)

(use-package challenger-deep-theme
  :ensure (:host github :repo "challenger-deep-theme/emacs" :branch "master")
  ;;:ensure (:repo "/home/max/Documents/challenger-deep/themes/emacs")
  :init
  ;;(add-to-list 'custom-theme-load-path "/home/max/Documents/challenger-deep/themes/emacs")
  (if (daemonp)
      (add-hook 'server-after-make-frame-hook (lambda () (load-theme 'challenger-deep t)))
    (load-theme 'challenger-deep t))
  :config
  (set-face-attribute 'window-divider nil :foreground "#1b182c")
  (set-face-attribute 'window-divider-first-pixel nil :foreground "#1b182c")
  (set-face-attribute 'window-divider-last-pixel nil :foreground "#1b182c")
  (set-face-attribute 'org-level-1 nil :background "#2b2942")
  (set-face-attribute 'org-level-2 nil :background "#2b2942" :foreground (face-attribute 'warning :foreground))
  (set-face-attribute 'org-level-3 nil :background "#2b2942" :foreground (face-attribute 'error :foreground))
  (set-face-attribute 'org-level-4 nil :background "#2b2942" :foreground (face-attribute 'success :foreground))
  (set-face-attribute 'org-level-5 nil :background "#2b2942" :foreground (face-attribute 'org-special-keyword :foreground))
  (set-face-attribute 'org-level-6 nil :background "#2b2942" :foreground (face-attribute 'org-table :foreground)))

(use-package all-the-icons
  :config
  ;; org-mode ellipsis
  (setq-default org-ellipsis (concat " " (all-the-icons-faicon "angle-down") " ")))

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

(add-to-list 'auto-mode-alist '("\\.emacs.abbreviations\\'" . emacs-lisp-mode))

(setq
 global-abbrev-file-name "~/.emacs.d/.emacs.abbreviations"
 abbrev-file-name "~/.emacs.d/.emacs.abbreviations")

;; because the local abbrev functions depend on projectile and are only useful
;; when projectile is loaded
(with-eval-after-load "projectile"

  (defun my/save-abbrevs ()
    (interactive)
    (write-abbrev-file))

  (defun my/reload-abbrevs ()
    (interactive)
    (message "Reloading abbrevs from %s" global-abbrev-file-name)
    (quietly-read-abbrev-file global-abbrev-file-name)
    (message "Loaded global abbrevs")
    (if (projectile-project-p)
        (let ((project-abbrevs-file (my/get-local-abbrev-file-name)))
          (message "Loading local abbrevs")
          (when (file-exists-p project-abbrevs-file)
            (quietly-read-abbrev-file project-abbrevs-file)))
      (message "No local abbrevs file to load")
      ))

  (defun my/get-local-abbrev-file-name ()
    (concat (projectile-project-root) ".emacs.abbreviations"))


  (defun my/edit-local-abbrevs ()
    (interactive)
    (message "Clearing tables")
    (mapcar (lambda (table) (clear-abbrev-table (symbol-value table))) abbrev-table-name-list)
    (message "Loading local abbrevs only")
    (when (file-exists-p (my/get-local-abbrev-file-name))
      (quietly-read-abbrev-file (my/get-local-abbrev-file-name)))
    (message "Editing loaded abbrevs")
    (edit-abbrevs)
    (advice-add 'edit-abbrevs-redefine :after 'my/edit-abbrevs-redefine-local-after-advice))

  (defun my/edit-abbrevs-redefine-global-after-advice ()
    (message "Writing global abbrevs")
    (write-abbrev-file)
    (advice-remove 'edit-abbrevs-redefine 'my/edit-abbrevs-redefine-global-after-advice)
    (my/reload-abbrevs))

  (defun my/edit-abbrevs-redefine-local-after-advice ()
    (message "Writing local abbrevs")
    (write-abbrev-file (my/get-local-abbrev-file-name))
    (advice-remove 'edit-abbrevs-redefine 'my/edit-abbrevs-redefine-local-after-advice)
    (my/reload-abbrevs))

  (defcustom abbrev-additional-chars
    '((t ?-))
    "Alist that maps major mode symbols to lists of characters that may appear in abbreviations.
  The chars of the special major mode symbol `t' are active in all modes."
    :group 'abbrev
    :type '(repeat :tag "List of modes"
                   (cons :tag "Map major mode symbols to lists of additional chars in abbrevs"
                         (symbol :tag "Mode symbol (`t' stands for all modes)")
                         (repeat :tag "List of additional word-consistent characters" character))))

  (defvar-local T-abbrev-syntax-table nil
    "List of additional characters in abbreviations.")

  (defun T-abbrev-mode-hook-fun ()
    "Populate T-abbrev-syntax-table with the local syntax table modfied by
  the characters in `abbrev-additional-chars'."
    (when abbrev-mode
      (message "abbrev-mode active, building char-list")
      (let ((char-list (append (cdr (assoc major-mode abbrev-additional-chars))
                               (cdr (assoc 't abbrev-additional-chars)))))
        (message "creating normal syntax table")
        (setq T-abbrev-syntax-table (make-syntax-table (syntax-table)))
        (message "extending syntax table")
        (mapcar (lambda (char)
                  (message "Adding entry for '%c'" char)
                  (modify-syntax-entry char "w" T-abbrev-syntax-table))
                char-list))
      (my/reload-abbrevs)))

  ;; Wrapping functions of the `abbrev` package with the local syntax table.
  ;; I'm not sure I captured all fun's that need to run with the local syntax-table.
  ;; Adding further functions is easy.
  ;; Just add them to the list at the end of the next form.
  (mapcar
   (lambda (fun)
     (let ((newfun (intern (concat "T-ad-" (symbol-name fun)))))
       (eval
        `(progn
           (defun ,newfun (oldfun &rest args)
             ,(concat "This function evaluates `" (symbol-name fun) "' with `T-abbrev-syntax-table' as active syntax table.
  It is used for the advicing `" (symbol-name fun) "'.")
             (if T-abbrev-syntax-table
                 (with-syntax-table T-abbrev-syntax-table
                   (apply oldfun args))
               (apply oldfun args)))
           (advice-add (quote ,fun) :around (quote ,newfun))))))
   '(define-mode-abbrev abbrev--before-point))

  (defun my/abbrev-mode-on ()
    (abbrev-mode 1))

  (add-hook 'abbrev-mode-hook #'T-abbrev-mode-hook-fun)
  (add-hook 'prog-mode-hook #'my/abbrev-mode-on)
  (add-hook 'projectile-after-switch-project-hook #'my/reload-abbrevs))

(defconst org-config-file "~/.emacs.d/config.org")
(defun my-funcs/reload-dotfile ()
  "Reload '~/.emacs.d/init.el'."
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(defun my-funcs/open-dotfile ()
  "Open '~/.emacs.d/config.org."
  (interactive)
  (find-file org-config-file))
(defun my-funcs/open-snippet-dir ()
  (interactive)
  (let* ((dir (file-name-as-directory (car yas-snippet-dirs)))
         (path (concat dir (symbol-name major-mode))))
    (dired path)))
(defun my-funcs/flash-region (start end)
  "Makes the region between START and END change color for a moment"
  (let ((overlay (make-overlay start end)))
    (overlay-put overlay 'face 'swiper-match-face-4)
    (run-with-timer 0.2 nil 'delete-overlay overlay)))
(defun my-funcs/what-face (pos)
  "Tells you the name of the face (point) is on."
  (interactive "d")
  (let ((hl-line-p (bound-and-true-p hl-line-mode)))
    (if hl-line-p (hl-line-mode -1))
    (let ((face (or (get-char-property (point) 'read-face-name)
                    (get-char-property (point) 'face))))
      (if face (message "Face: %s" face) (message "No face at %d" pos)))
    (if hl-line-p (hl-line-mode 1))))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.
   With a prefix ARG prompt for a file to visit.
   Will also prompt for a file to visit if current
   buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun run-local-vars-mode-hook ()
  "Run a hook for the major-mode after the local variables have been processed."
  (run-hooks (intern (format "%S-local-vars-hook" major-mode))))
(add-hook 'hack-local-variables-hook #'run-local-vars-mode-hook)

(require 'desktop)
(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.emacs.d/desktop/")
  "*Directory to save desktop sessions in")
(defvar my-desktop-session-name-hist nil
  "Desktop session name history")
(defun my-desktop-save (&optional name)
  "Save desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session" t)))
  (when name
    (make-directory (concat my-desktop-session-dir name) t)
    (desktop-save (concat my-desktop-session-dir name) t)))
(defun my-desktop-save-and-clear ()
  "Save and clear desktop."
  (interactive)
  (call-interactively 'my-desktop-save)
  (desktop-clear)
  (setq desktop-dirname nil))
(defun my-desktop-read (&optional name)
  "Read desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Load session")))
  (when name
    (desktop-clear)
    (desktop-read (concat my-desktop-session-dir name))))
(defun my-desktop-change (&optional name)
  "Change desktops by name."
  (interactive)
  (let ((name (my-desktop-get-current-name)))
    (when name
      (my-desktop-save name))
    (call-interactively 'my-desktop-read)))
(defun my-desktop-name ()
  "Return the current desktop name."
  (interactive)
  (let ((name (my-desktop-get-current-name)))
    (if name
        (message (concat "Desktop name: " name))
      (message "No named desktop loaded"))))
(defun my-desktop-get-current-name ()
  "Get the current desktop name."
  (when desktop-dirname
    (let ((dirname (substring desktop-dirname 0 -1)))
      (when (string= (file-name-directory dirname) my-desktop-session-dir)
        (file-name-nondirectory dirname)))))
(defun my-desktop-get-session-name (prompt &optional use-default)
  "Get a session name."
  (let* ((default (and use-default (my-desktop-get-current-name)))
         (full-prompt (concat prompt (if default
                                         (concat " (default " default "): ")
                                       ": "))))
    (completing-read full-prompt (and (file-exists-p my-desktop-session-dir)
                                      (directory-files my-desktop-session-dir))
                     nil nil nil my-desktop-session-name-hist default)))
(defun my-desktop-kill-emacs-hook ()
  "Save desktop before killing emacs."
  (when (file-exists-p (concat my-desktop-session-dir "last-session"))
    (setq desktop-file-modtime
          (nth 5 (file-attributes (desktop-full-file-name (concat my-desktop-session-dir "last-session"))))))
  (my-desktop-save "last-session"))
(add-hook 'kill-emacs-hook 'my-desktop-kill-emacs-hook)

(use-package evil
  :ensure (:host github :repo "emacs-evil/evil")
  :init
  (setq evil-want-integration nil)
  (setq evil-want-keybinding nil)

  ;; whichwrap like movement across lines
  (setq-default evil-cross-lines t)
  (setq-default evil-search-module 'evil-search
                evil-want-abbrev-expand-on-insert-exit nil
                evil-ex-substitute-global t ;; make substitue global by default
                evil-shift-width 2
                ;; prevent esc-key from translating to meta-key in terminal mode
                evil-esc-delay 0
                evil-want-fine-undo t
                evil-undo-system 'undo-tree
                evil-want-Y-yank-to-eol t)
  :config
  (evil-set-initial-state 'package-menu-mode 'normal)
  (evil-set-initial-state 'help-mode 'normal)
  (evil-set-initial-state 'ibuffer-mode 'normal)
  ;;(evil-set-initial-state 'pdf-view-mode 'normal)
  ;;(evil-set-initial-state 'ivy-occur-grep-mode 'normal)
  (evil-set-initial-state 'occur-mode 'normal)
  ;;(evil-set-initial-state 'dirvish-mode 'normal)
  ;;(setq evil-emacs-state-modes nil)
  ;;(setq evil-insert-state-modes nil)
  ;;(setq evil-motion-state-modes nil)
  (evil-mode t)

  ;;Evil smartparens text objects
  (evil-define-text-object evil-a-sexp (count &optional beg end type)
    "outer sexp"
    (evil-range (progn
                  (save-excursion
                    (sp-beginning-of-sexp)
                    (- (point) 1)))
                (progn
                  (save-excursion
                    (sp-end-of-sexp)
                    (+ (point) 1)))))
  (define-key evil-outer-text-objects-map "f" 'evil-a-sexp)
  (evil-define-text-object evil-i-sexp (count &optional beg end type)
    "inner sexp"
    (evil-range (progn
                  (save-excursion
                    (sp-beginning-of-sexp)
                    (point)))
                (progn
                  (save-excursion
                    (sp-end-of-sexp)
                    (point)))))
  (define-key evil-inner-text-objects-map "f" 'evil-i-sexp)
  (evil-define-text-object evil-a-top-level-sexp (count &optional beg end type)
    "outer top level sexp"
    (evil-range (progn
                  (save-excursion
                    (beginning-of-defun)
                    (- (point) 1)))
                (progn
                  (save-excursion
                    (end-of-defun)
                    (+ (point) 1)))))
  (define-key evil-outer-text-objects-map "F" 'evil-a-top-level-sexp)
  (evil-define-text-object evil-i-top-level-sexp (count &optional beg end type)
    "inner top level sexp"
    (evil-range (progn
                  (save-excursion
                    (beginning-of-defun)
                    (point)))
                (progn
                  (save-excursion
                    (end-of-defun)
                    (point)))))
  (define-key evil-inner-text-objects-map "F" 'evil-i-top-level-sexp)
  (evil-define-text-object evil-a-lisp-element (count &optional beg end type)
    "outer sexp"
    (evil-range (progn
                  (save-excursion
                    ;;TODO
                    ))
                (progn
                  (save-excursion
                    ;;TODO
                    ))))
  ;;(define-key evil-outer-text-objects-map "e" 'evil-a-lisp-element)
  (evil-define-text-object evil-i-lisp-element (count &optional beg end type)
    "inner sexp"
    (evil-range (progn
                  (save-excursion
                    ;;TODO
                    ))
                (progn
                  (save-excursion
                    ;;TODO
                    ))))
  ;;(define-key evil-inner-text-objects-map "e" 'evil-i-lisp-element)

  (evil-define-text-object evil-i-line (count &optional beg end type)
    "inner line"
    (evil-range (progn
                  (save-excursion
                    (back-to-indentation)
                    (point)))
                (progn
                  (save-excursion
                    (end-of-line)
                    (point)))))
  (define-key evil-inner-text-objects-map "l" 'evil-i-line)
  (evil-define-text-object evil-a-line (count &optional beg end type)
    "outer line"
    (evil-range (progn
                  (save-excursion
                    (evil-beginning-of-line)
                    (point)))
                (progn
                  (save-excursion
                    (end-of-line)
                    (point)))))
  (define-key evil-outer-text-objects-map "l" 'evil-a-line)

(evil-define-operator evil-eval-elisp-text-object (beg end)
  "Evil operator for evaluating code."
  :move-point nil
  (save-excursion
    (let (eval-str
          value)
      (setq eval-str (buffer-substring beg end))
      (setq value (eval (car (read-from-string eval-str)) lexical-binding))
      (my-funcs/flash-region beg end)
      (my-funcs/eval-overlay value end)
      (message (format "%s" value)))))

(evil-define-operator evil-narrow-indirect (beg end type)
  "Indirectly narrow the region from BEG to END."
  (interactive "<R>")
  (narrow-to-region-indirect beg end)))

(use-package evil-collection
  :ensure t
  :after evil
  :init
  ;; disable company tng (to be able to complete with rtn)
  (setq evil-collection-company-use-tng nil)
  :config
  ;;(setq evil-collection-mode-list ...)
   ;; edebug mode clashes with helpful.
  (setq evil-collection-mode-list (delete 'edebug evil-collection-mode-list))

  ;; These are the mappings i use for window management and i don't want
  ;; evil-collection to override those
  (defun my-evil-collection-key-setup (_mode mode-keymaps &rest _rest)
    (evil-collection-translate-key 'normal mode-keymaps
      (kbd "SPC") nil
      (kbd "gj") nil ;; outline mode would rebind gj
      (kbd "gk") nil ;; outline mode would rebind gj
      ))
  ;; called after evil-collection makes its keybindings
  (add-hook 'evil-collection-setup-hook #'my-evil-collection-key-setup)

  (evil-collection-init)

  )

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package default-text-scale
:after (hydra)
:init
(defhydra hydra-zoom ()
    "Zoom"
    ("u" default-text-scale-reset"unzoom")
    ("i" text-scale-increase "in Buffer")
    ("I" default-text-scale-increase "in Frame")
    ("O" default-text-scale-decrease "out Frame")
    ("o" text-scale-decrease "out Buffer")))

(use-package hydra)

(with-eval-after-load 'hydra
          (defhydra hydra-window-resize ()
            "Window resizing"
            ("j" my-funcs/resize-window-down "down")
            ("k" my-funcs/resize-window-up "up")
            ("l" my-funcs/resize-window-right "right")
              ("h" my-funcs/resize-window-left "left"))
          (defhydra hydra-projectile (:color teal :columns 4)
            "Projectile"
            ("f"   projectile-find-file                "Find File")
            ("r"   projectile-recentf                  "Recent Files")
            ("z"   projectile-cache-current-file       "Cache Current File")
            ("x"   projectile-remove-known-project     "Remove Known Project")
            ("d"   projectile-find-dir                 "Find Directory")
            ("b"   projectile-switch-to-buffer         "Switch to Buffer")
            ("c"   projectile-invalidate-cache         "Clear Cache")
            ("X"   projectile-cleanup-known-projects   "Cleanup Known Projects")
            ("o"   projectile-multi-occur              "Multi Occur")
            ("p"   projectile-switch-project           "Switch Project")
            ("k"   projectile-kill-buffers             "Kill Buffers")
            ("q"   nil "Cancel" :color blue)))

(setq lisp-modes '(clojure-mode
                   clojurescript-mode
                   lisp-interaction-mode
                   cider-repl-mode
                   emacs-lisp-mode))

(setq lisp-mode-maps (mapcar (lambda (mode)
                               (intern (concat (symbol-name mode) "-map")))
                             lisp-modes))

(use-package general
  :after (evil hydra)
  :config
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  (general-override-mode)
  ;;(general-evil-setup)
  ;; bind a key globally in normal state; keymaps must be quoted
  (setq general-default-keymaps 'evil-normal-state-map)

  ;; named prefix key
  (setq my-leader "SPC")
  (setq my-leader2 ",")
  (setq local-leader "\\")

  (general-define-key
   :keymaps 'normal
   "gf" 'find-file
   "gS" 'my-funcs/open-snippet-dir
   "zw" 'widen
   "s" 'save-buffer
   "S" 'projectile-find-file
   ;; to jump to next enxty in ivy occur
   "g s" 'magit-status
   "g G" (lambda ()
           (interactive)
           (evil-ex (concat "g/" (evil-get-register ?/) "/")))
   "`" 'evil-goto-mark-line
   "'" 'evil-goto-mark
   "g ." 'my-funcs/open-dotfile
   "g p" 'consult-yank-pop
   "Q" (lambda ()
         (interactive)
         (org-capture))
   "g i" (lambda ()
           (interactive)
           (find-file (concat org-directory "/inbox.org")))
   "g o" (lambda ()
           (interactive)
           (find-file org-directory)))

  (general-define-key
   :states 'normal
   :keymaps 'override
   :prefix my-leader
   ;;"r" 'restart-emacs
   "t" 'tab-switcher
   "a" 'org-agenda
   "A" 'notdeft
   "p" 'hydra-projectile/body
   "q" 'evil-window-delete
   "k" 'kill-buffer
   "X" 'evil-delete-buffer
   "d" 'docker
   "r" (lambda ()
         (interactive)
         (evil-ex (concat "%s/" (evil-get-register ?/) "/")))

   "SPC" 'ace-select-window
   "s" 'dumb-jump-go
   "S" 'dumb-jump-go-prompt
   ;;"h" (general-simulate-keys "C-h")
   "h k" 'helpful-key
   "h SPC" 'which-key-show-top-level
   "h v" 'helpful-variable
   "h f" 'helpful-function
   "h m" 'describe-mode
   "<return>" 'projectile-run-vterm
   "S-<return>" 'vterm
   ;;  Avoiding CTRL
   "w" (general-simulate-key "C-w")
   "x" (general-simulate-key "C-x")
   "c" (general-simulate-key "C-c")
   "i" 'ibuffer
   "j" 'projectile-find-file
   "/" 'consult-ripgrep
   "e" 'projectile-switch-to-buffer
   "g s" 'git-gutter:stage-hunk
   "g t" 'git-timemachine
   "g n" 'git-gutter:next-hunk
   "g p" 'git-gutter:previous-hunk
   "g r" 'git-gutter:revert-hunk
   "g p" 'git-gutter:popup-hunk
   "l" 'evil-avy-goto-line
   "u" 'undo-tree-visualize
   "f" 'find-file
   "b" 'consult-buffer
   "n" 'next-error
   "N" 'previous-error
   "z" 'hydra-zoom/body
   "o" 'dired-jump
   "O" 'dired)

  (general-define-key
   :states '(operator normal visual)
   :keymaps 'override
   :prefix my-leader2
   "," 'evil-repeat-find-char-reverse)

  (general-define-key
   :states '(operator normal visual)
   :keymaps 'override
   "gf" 'evil-avy-goto-char
   "gl" 'evil-avy-goto-line
   "gW" 'evil-avy-goto-word-1)
  )

(use-package move-text
  :after (general)
:config 
(general-define-key
   :states 'normal
     "] e" 'move-text-down
     "[ e" 'move-text-up)
  )

(use-package evil-surround
  :after (evil)
  :init
  (global-evil-surround-mode))

(use-package aggressive-indent
  :config)

(use-package evil-expat
  ;; optional, defer loading until 1 second of inactivity,
  ;; hence not affecting emacs startup time
  :defer 1)

(use-package evil-args
  :after (evil)
  :config
  ;; bind evil-args text objects
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
  )

(use-package evil-lion
  :after (evil)
  :init
  (evil-lion-mode))

(use-package evil-indent-plus
  :after (evil)
  :init
  ;; bind evil-indent-plus text objects
  (evil-indent-plus-default-bindings)
  )

(use-package evil-numbers
  :after (evil)
  :commands (evil-numbers/inc-at-pt evil-numbers/dec-at-pt)
  :init
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt))

(use-package evil-matchit
  :after (evil)
  :init
  (global-evil-matchit-mode 1))

(use-package evil-quickscope
  :init
  (global-evil-quickscope-mode 1))

;;cx to mark exchange second time to do it
 ;;cxc to cancel
(use-package evil-exchange
  :commands (evil-exchange)
  :init
  (evil-exchange-cx-install))

(use-package evil-nerd-commenter
  :after general
  :demand t
  :init
  (general-define-key
   :states 'normal
   :keymaps 'override
   "gc" 'evilnc-comment-operator))

(use-package evil-anzu
    :after (evil)
    :init
    (require 'evil-anzu))

(use-package evil-owl
  :config
  (setq evil-owl-extra-posframe-args '(:width 50 :height 20)
        evil-owl-register-char-limit 50)
  :init
  (evil-owl-mode))

(with-eval-after-load 'evil
(with-eval-after-load 'general
  (evil-define-operator evil-search-textobject (beg end)
    "Evil operator for evaluating code."
    :move-point nil
    (let ((textobj-str (buffer-substring beg end)))
      (setq evil-ex-search-pattern (evil-ex-make-pattern textobj-str t t))
      (evil-ex-search-activate-highlight evil-ex-search-pattern)
      ;; update search history unless this pattern equals the
      ;; previous pattern
      (unless (equal (car-safe evil-ex-search-history) textobj-str)
        (push textobj-str evil-ex-search-history))
      (evil-push-search-history textobj-str t)
      (goto-char beg)))


      (general-def 'normal 'override
        "g/" 'evil-search-textobject)
      ))

(use-package ibuffer-project
  :init
  (add-hook 'ibuffer-hook
            (lambda ()
              (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups)))))

(with-eval-after-load 'general
   (general-define-key :keymaps '(help-mode-map)
                       :states '(normal)
                       "C-o" 'help-go-back
                       "C-i" 'help-go-forward
                       "r" 'help-follow
                       "q" 'quit-window)
)

(use-package evil-replace-with-register
  :after (evil evil-collection)
  :init
  (setq evil-replace-with-register-key (kbd "gR"))
  (evil-replace-with-register-install))

(add-hook 'artist-mode-hook #'(lambda () (evil-emacs-state)))

(setq-default
 abbrev-mode t)

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
;; TAB cycle if there are only few candidates
(setq completion-cycle-threshold 3)

;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
;; Corfu commands are hidden, since they are not supposed to be used via M-x.
;; (setq read-extended-command-predicate
;;       #'command-completion-default-include-p)

;; Enable indentation+completion using the TAB key.
;; `completion-at-point' is often bound to M-TAB.
(setq tab-always-indent 'complete)

(put 'narrow-to-defun  'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-region 'disabled nil)

(defun narrow-to-region-indirect (start end)
  "Restrict editing in this buffer to the current region, indirectly."
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
      (switch-to-buffer buf)))



(with-eval-after-load 'general
(general-define-key
 :states '(normal operator visual)
 :keymaps 'override
 "zn" 'evil-narrow-indirect))

(use-package cape
      :after '(corfu)
      :init
      ;; Add `completion-at-point-functions', used by `completion-at-point'.
      ;; NOTE: The order matters!
      (add-to-list 'completion-at-point-functions #'cape-dabbrev)
      (add-to-list 'completion-at-point-functions #'cape-file)
      (add-to-list 'completion-at-point-functions #'cape-elisp-block)
      ;(add-to-list 'completion-at-point-functions #'cape-history)
      (add-to-list 'completion-at-point-functions #'cape-keyword)
      ;;(add-to-list 'completion-at-point-functions #'cape-tex)
      ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
      ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
      ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
      ;;(add-to-list 'completion-at-point-functions #'cape-dict)
      (add-to-list 'completion-at-point-functions #'cape-symbol)
      (add-to-list 'completion-at-point-functions #'cape-line)
)

(use-package flycheck
  :after (fringe-helper general)
  :init
  (global-flycheck-mode)
  :config
  (general-define-key
   :states 'normal
   "]q" 'flycheck-next-error
   "[q" 'flycheck-previous-error)

  (setq flycheck-indication-mode 'right-fringe)
  ;; A non-descript, left-pointing arrow
  (fringe-helper-define 'flycheck-fringe-bitmap-double-arrow 'center
    "...X...."
    "..XX...."
    ".XXX...."
    "XXXX...."
    ".XXX...."
    "..XX...."
    "...X....")
  )

(use-package exec-path-from-shell
    :config
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-copy-env "PGUSER")
      (exec-path-from-shell-copy-env "PGPASSWORD")
      (exec-path-from-shell-initialize)))

(defun json->edn ()
  (interactive)
  (shell-command-on-region (region-beginning)
                           (region-end)
                           "jet --pretty --keywordize keyword --from json --to edn"
                           (current-buffer)
                           t))


(defun my-funcs/eval-overlay (value point)
  (cider--make-result-overlay (format "%S" value)
    :where point
    :duration 'command)
  ;; Preserve the return value.
  value)
(advice-add 'eval-last-sexp :filter-return
            (lambda (r)
              (my-funcs/eval-overlay r (point))))
(advice-add 'eval-defun :filter-return
            (lambda (r)
              (my-funcs/eval-overlay
               r
               (save-excursion
                 (end-of-defun)
                 (point)))))

(use-package clojure-mode
  :after '(cider)
  :config
  (setq clojure-align-forms-automatically t)
  (put-clojure-indent 'defui '(2 nil nil (1))))

(use-package flycheck-clj-kondo
  :after clojure-mode
  :init
  (require 'flycheck-clj-kondo))

;; (use-package flycheck-joker
;;   :init
;;   (require 'flycheck-joker)
;;   :config
;;   (add-to-list 'flycheck-checkers 'clojure-joker t)
;;   (add-to-list 'flycheck-checkers 'clojurescript-joker t))

(use-package inflections
  ;; elpaca is setting the wrong version so i have to this for clj-refactor to work
  :ensure (inflections :version (lambda (_) "2.6"))
  )

(use-package clj-refactor
  :after (cider)
  :init
  (defun my-clj-refactor-mode-hook ()
    (clj-refactor-mode 1))
  (add-hook 'clojure-mode-hook #'my-clj-refactor-mode-hook))

(use-package cider
  :init
  (add-hook 'clojure-mode-hook 'cider-mode)
  :after (evil general)
  :commands (cider--make-result-overlay)
  :config
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  (setq cider-repl-display-in-current-window nil)
  (setq cider-repl-use-pretty-printing t)
  (autoload 'cider--make-result-overlay "cider-overlays")
  (evil-define-operator evil-eval-clojure-text-object (beg end)
    "Evil operator for evaluating code."
    :move-point nil
    (save-excursion
      (my-funcs/flash-region beg end)
      (cider-eval-region beg end)))
  (defun my/goto-or-switch-back-from-repl ()
    (interactive)
    (if (eq major-mode 'cider-repl-mode)
        (cider-switch-to-last-clojure-buffer)
      (cider-switch-to-repl-buffer)))
  (general-define-key
   :states 'normal
   :keymaps '(cider-inspector-mode-map)
   "n" 'cider-inspector-next-page
   "q" 'quit-window
   "N" 'cider-inspector-prev-page
   "RET" 'cider-inspector-operate-on-point
   "d" 'cider-inspector-pop
   "r" 'cider-inspector-refresh)
  (general-def 'normal '(cider-popup-buffer-mode-map cider-stacktrace-mode-map)
    "q" 'cider-popup-buffer-quit)
  (general-def 'normal '(clojure-mode-map cider-repl-mode-map cider-clojure-interaction-mode-map)
    :prefix local-leader
    "r" 'cider-hydra-repl/body
    "j" 'cider-jack-in
    "s" 'cider-jack-in-clojurescript
    "i" 'cider-inspect-last-result
    "g" 'my/goto-or-switch-back-from-repl
    "\\" 'clj-dev-go
    "c" 'cider-jack-in
    "t" 'cider-hydra-test/body
    "d" 'cider-hydra-doc/body
    "e" 'cider-hydra-eval/body
    "a" 'eglot-code-actions
    "q" 'hydra-cljr-help-menu/body)
  (general-def 'normal '(clojure-mode-map cider-repl-mode-map cider-clojure-interaction-mode-map)
    "c" (general-key-dispatch 'evil-change
          "p" (general-key-dispatch 'evil-eval-clojure-text-object
                :name general-dispatch-eval-clojure-text-object
                "p" (lambda ()
                      (interactive)
                      (let* ((range (evil-a-sexp))
                             (beg (elt range 0))
                             (end (elt range 1)))
                        (evil-eval-clojure-text-object beg end))))
          ;; could be used for other operators where there
          ;; isn't an existing command for the linewise version:
          ;; "c" (general-simulate-keys ('evil-change "c"))
          ))
  ;; for some reason the above also overrides visual state
  (general-define-key :states 'visual
                      :keymaps '(clojure-mode-map cider-repl-mode-map cider-clojure-interaction-mode-map)
                      "c" 'evil-change)
  )
(use-package cider-hydra
  :after (evil clojure-mode)
  :init
  (add-hook 'cider-mode-hook #'cider-hydra-mode))
:config

(defun clj-dev-go ()
  (interactive)
  (cider-interactive-eval "(go)" nil nil `(("ns" "user"))))

(with-eval-after-load 'general
    (general-define-key :states 'normal
                        :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
                        "c" (general-key-dispatch 'evil-change
                              :name list-evil-change-dispatch
                              "p" (general-key-dispatch 'evil-eval-elisp-text-object
                                    :name general-dispatch-eval-elisp-text-object
                                    "p" (lambda ()
                                          (interactive)
                                          (let* ((range (evil-a-sexp))
                                                 (beg (elt range 0))
                                                 (end (elt range 1)))
                                            (evil-eval-elisp-text-object beg end))))))

    ;; for some reason the above also overrides visual state keybindings
    (general-define-key :states 'visual
                        :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
                        "c" 'evil-change)
    )

(use-package which-key
  :init
  (which-key-mode))
;; (use-package which-key-posframe
;;  :init
;;  (which-key-posframe-mode))

(use-package fringe-helper
:demand t)

(use-package git-gutter-fringe
  :after (fringe-helper)
  :demand t
  :init
  (advice-add 'evil-force-normal-state :after 'git-gutter)
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)
  :config
  (fringe-mode 3)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "XXX.....")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "XXX.....")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "X......."
    "XX......"
    "XXX....."
    "XXXX....")
  )

(use-package transient)
(use-package magit-section
  :after magit)
(use-package magit
  :after transient
  :config
  (setq magit-diff-refine-hunk (quote all)))

(use-package git-timemachine
  :after general
  :config
  (general-define-key :keymaps '(git-timemachine-mode-map)
                      :states '(normal)
                      :prefix my-leader2
                      "n" 'git-timemachine-show-next-revision
                      "p" 'git-timemachine-show-previous-revision
                      "r" 'git-timemachine-show-current-revision
                      "q" 'git-timemachine-quit))

(use-package imenu-list
  :after general
  :config
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-position 'left)
  (general-define-key :keymaps 'imenu-list-major-mode-map
                      :states '(normal)
                      "|" 'imenu-list-minor-mode
                      "RET" 'imenu-list-goto-entry
                      (kbd "S-<return>") (lambda ()
                                           (interactive)
                                           (imenu-list-goto-entry)
                                           (org-narrow-to-subtree))
                      "i" 'imenu-list-goto-entry
                      "q" 'imenu-list-quit-window))

;; soft-wrap lines
(add-hook 'text-mode-hook #'visual-line-mode)
;; show right-curly arrow on right of wrapped lines
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(use-package org-auto-tangle
:ensure (org-auto-tangle
         :host github
         :repo "yilkalargaw/org-auto-tangle"
         :main "org-auto-tangle.el")
:defer t
:hook (org-mode . org-auto-tangle-mode))

(setq org-highlight-latex-and-related '(latex script entities))

(setq org-log-done t)

(setq org-log-into-drawer t)

(setq org-adapt-indentation nil)

(setq org-image-actual-width 250)

(setq org-image-actual-width 250)
(setq org-startup-with-inline-images t)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org/")
      org-directory "~/org/"
      org-archive-location "~/org/archive/%s::")

(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 2)

(setq org-latex-caption-above nil)
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
             '("book-noparts"
                "\\documentclass{book}"
                ("\\chapter{%s}" . "\\chapter*{%s}")
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-hook 'org-capture-mode-hook 'evil-insert-state)
(use-package org-id
  :after (org)
  :ensure org-contrib
  :config

  (defun my/add-org-id (properties)
    (let ((id  (concat ":ID: " (org-id-uuid) ":CREATED: %U")))
      (cons id properties)))

  (defun my/properties-list->string (properties)
    (let ((head  "\n:PROPERTIES:"))
      (concat (string-join (cons head properties) "\n")
              "\n:END:")))

  (defun my/new-note-file ()
    (find-file (concat org-directory "notes/" (org-id-uuid) ".org")))

  (setq org-capture-templates
        `(
          ("n"
           "NOTE"
           plain
           (function my/new-note-file)
           "#+TITLE:  %^{TITLE}\n#+FILETAGS: %^{TAGS}\n#+CREATED: %T\n\n%?"
           :kill-buffer t
           :unnarrowed t
           )
          ("i"
           "INBOX"
           entry
           (file "inbox.org")
           ,(concat "* %?" (my/properties-list->string (my/add-org-id nil)))
           :prepend t)
          ("t"
           "INBOX TODO"
           entry
           (file "inbox.org")
           "* TODO %? SCHEDULED: %t"))))

(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

;; use a depth level of 6 max
(setq org-refile-targets
      '((org-agenda-files . (:maxlevel . 4))))

(defvar my-org-capture-before-config nil
  "Window configuration before `org-capture'.")

(defun my-org-capture-advice-before (&optional GOTO KEYS)
  "Save the window configuration before `org-capture'."
  (setq my-org-capture-before-config (current-window-configuration))
  (delete-other-windows)
  )

(advice-add 'org-capture :before #'my-org-capture-advice-before)
(advice-add 'org-capture :after #'delete-other-windows)


;;(add-hook 'org-capture-mode-hook 'delete-other-windows)

(defun my-org-capture-cleanup ()
  "Clean up the frame created while capturing via org-protocol."
  ;; In case we run capture from emacs itself and not an external app,
  ;; we want to restore the old window config
  (when my-org-capture-before-config
    (set-window-configuration my-org-capture-before-config))
  (-when-let ((&alist 'name name) (frame-parameters))
    (when (equal name "org-protocol-capture")
      (delete-frame))))

(add-hook 'org-capture-after-finalize-hook 'my-org-capture-cleanup)

(defcustom org-inline-image-background nil
  "The color used as the default background for inline images.
  When nil, use the default face background."
  :group 'org
  :type '(choice color (const nil)))

  (defun org-display-inline-images--with-color-theme-background-color (args)
    "Specify background color of Org-mode inline image through modify `ARGS'."
    (let* ((file (car args))
           (type (cadr args))
           (data-p (caddr args))
           (props (cdddr args)))
      ;; get this return result style from `create-image'
      (append (list file type data-p)
              ;;(list :background (face-background 'default))
              (list :background org-inline-image-background)
              props)))

  (advice-add 'create-image :filter-args
              #'org-display-inline-images--with-color-theme-background-color)

  (setq org-inline-image-background "#ffffff")

(setq-default org-catch-invisible-edits 'smart)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (gnuplot . t)
   (clojure . t)
   (python .t)
   (R . t)
   (sql . t)
   (dot . t)))

(use-package org-ref)

(use-package ox-reveal :if (not (my/is-android-p)))
;;(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;;(setq org-reveal-mathjax t)
(use-package org-re-reveal-ref :if (not (my/is-android-p)))
(use-package htmlize :if (not (my/is-android-p)))

(when (version<= "9.2.0" (org-version))
  (require 'org-tempo)
  (add-to-list 'org-modules 'org-tempo)
  (add-to-list 'org-structure-template-alist '("S" . "src emacs-lisp")))

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-show-habits-only-for-today nil)

(setq-default org-fontify-whole-heading-line t)

(use-package worf
  :after (evil org hydra general)
  :ensure (:build (:not elpaca--byte-compile))
   ;;https://github.com/leotaku/worf/commit/38e901d3888e3a245a5cba14a061bffa1c5fd20b
  :init
  (add-hook #'org-mode-hook (lambda () (worf-mode 1)))
  ;; set the worf-mode keymap to an empty keymap to remove all worf bindings
  (add-hook #'worf-mode-hook
            (lambda ()
              (push `(worf-mode . ,(make-sparse-keymap)) minor-mode-overriding-map-alist)))
  :config
  (defhydra myorg-hydra-change (:hint nil)
    "
^ ^ _k_ ^ ^    _t_ags    _p_rop | _x_:archive
_h_ ^+^ _l_    _n_ame    _e_ol  |
^ ^ _j_ ^ ^    ^ ^       ^ ^    |
"
    ;; arrows
    ("j" org-metadown)
    ("k" org-metaup)
    ("h" org-metaleft)
    ("l" org-metaright)

    ("e" move-end-of-line :exit t)
    ;; misc
    ("p" org-set-property :exit t)
    ("t" org-set-tags :exit t)
    ("n" worf-change-name :exit t)
    ("x" org-archive-subtree-default-with-confirmation :exit t)
    ("q" nil)
    ("c" nil))


  (defun my-org-before-or-after (before)
    (if before
        (evil-insert-line nil)
      (evil-append-line nil)))

  (defun my-org-new-item (before)
    (if (org-at-heading-p)
        (progn
          (my-org-before-or-after before)
          (if before
              (org-insert-heading)
            (org-insert-heading-respect-content)))
      (if (org-at-item-checkbox-p)
          (progn
            (my-org-before-or-after before)
            (org-insert-todo-heading 1))
        (if (org-at-item-p)
            (progn
              (my-org-before-or-after before)
              (org-insert-item))
          (progn
            (worf-back-to-heading)
            (my-org-new-item before))))))

  (defun my-org-new-item-before ()
    (interactive)
    (my-org-new-item t))

  (defun my-org-new-item-after ()
    (interactive)
    (my-org-new-item nil))

  (defun my-org-export-widen ()
    (interactive)
    (save-restriction
      (widen)
      (org-export-dispatch)))
  (general-define-key :keymaps 'org-mode-map
                      :states '(normal)
                      ;;"TAB" 'org-cycle
                      "<" 'org-metaleft
                      ">" 'org-metaright
                      "|" 'org-sidebar-tree
                      "RET" (lambda ()
                              (interactive)
                              (if (org-in-src-block-p)
                                  (org-edit-special)
                                (if (org-at-item-checkbox-p)
                                    (org-toggle-checkbox)
                                  (org-open-at-point)))
                              (evil-normal-state))
                      (kbd "S-<return>") 'org-narrow-to-subtree)
  (general-define-key :prefix my-leader2
                      :keymaps 'org-mode-map
                      :states '(normal)
                      ;;"o" (lambda ()
                      ;;(interactive)
                      ;;(org-insert-heading-respect-content)
                      ;;(evil-insert-state))
                      "e" 'my-org-export-widen
                      "o" 'my-org-new-item-after
                      "O" 'my-org-new-item-before
                      "a" (lambda ()
                            (interactive)
                            (org-insert-heading-respect-content)
                            (org-demote-subtree)
                            (evil-insert-state))
                      "X" 'org-archive-subtree-default-with-confirmation
                      "s" 'org-schedule
                      "S" 'org-deadline
                      "r" 'org-refile
                      "n" 'org-narrow-to-subtree
                      "t" 'org-todo
                      ;;"T" 'counsel-org-tag
                      "p" 'org-insert-link
                      "y" 'org-store-link
                      "x" 'org-archive-subtree
                      "c" 'myorg-hydra-change/body
                      "l" 'worf-right
                      "g" 'consult-org-heading
                      "j" 'worf-down
                      "k" 'worf-up
                      "h" 'worf-left
                      "J" 'org-metadown
                      "K" 'org-metaup
                      "H" 'org-metaleft
                      "L" 'org-metaright
                      "/" 'org-toggle-comment
                      "RET" (lambda ()
                              (interactive)
                              (org-tree-to-indirect-buffer)
                              (other-window 1))
                      "SPC" 'worf-back-to-heading
                      "H" (lambda ()
                            (interactive)
                            (worf-left)
                            (org-cycle)))
  ;; key for exiting src edit mode
  (general-define-key :keymaps 'org-src-mode-map
                      :states '(normal)
                      "RET" 'org-edit-src-exit)
  )

(setq org-src-window-setup 'current-window)

(use-package org-sidebar)

(use-package evil-org
  :after org
  :init
  (setf evil-org-key-theme '(operators textobjects table))
  (add-hook 'org-mode-hook 'evil-org-mode)
  :config
  ;; diable o/O special handling for items
  (setq evil-org-special-o/O nil)
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-download
  :after org
  :init
  (setq-default org-download-screenshot-method "flameshot gui -r -d 3000 | magick png:- %s")
  (setq-default org-download-image-dir "~/org/images"
                org-download-heading-lvl nil)
  (add-hook 'dired-mode-hook 'org-download-enable)
  (require 'org-download))

(use-package org-treeusage
   :ensure (:host github
              :repo "mtekman/org-treeusage.el")
  :after org)

(use-package smartparens
  :init
  (add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'cide-clojure-interaction-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
  (smartparens-global-mode 1)
  :config
  (setq sp-navigate-interactive-always-progress-point t)

  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'clojure-mode "'" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
  (sp-local-pair 'clojure-interaction-mode "'" nil :actions nil)
  (sp-local-pair 'cider-repl-mode "'" nil :actions nil))

(use-package evil-smartparens
  ;;:init (require 'evil-smartparens)
  :after (evil general smartparens evil-surround symex)
  :config
  (add-to-list 'evil-surround-operator-alist
  '(evil-sp-change . change))
  (add-to-list 'evil-surround-operator-alist
  '(evil-sp-change . change))
  (add-to-list 'evil-surround-operator-alist
  '(evil-sp-delete . delete))
  (add-to-list 'evil-surround-operator-alist
  '(evil-sp-delete . delete))

  (defun maybe-join-lisp-line ()
    (save-excursion
      (when (string-match-p "^\s*[\])}]+\s*$" (thing-at-point 'line t))
        (evil-previous-line-first-non-blank)
        (join-line 1))))

  (defun in-sexp ()
    (> (nth 0 (syntax-ppss)) 0))

  (defun next-paren (&optional closing)
    "Go to the next/previous closing/opening parenthesis/bracket/brace."
    (if closing
        (let ((curr (point)))
          (forward-char)
          (unless (eq curr (search-forward-regexp "[])}]"))
            (backward-char)))
      (search-backward-regexp "[[({]")))

  (defun open-paren-around (paren element beginning)
    (when (and element (in-sexp))
      (next-paren))
    (sp-wrap-with-pair paren)
    (if beginning
        (progn
          (insert " ")
          (evil-backward-char 1))
      (progn
        (evilmi-jump-items)
        (evil-forward-char 1)
        (insert " ")))
    (evil-insert nil))

  (evil-define-command lisp-next-symbol (count)
    (interactive "<c>")
    (call-interactively 'sp-forward-symbol)
    (if count
        (dotimes (number count)
          (call-interactively 'sp-forward-symbol))
      (call-interactively 'sp-forward-symbol))
    (sp-backward-symbol))

  (evil-define-command lisp-previous-symbol (count)
      (interactive "<c>")
      (if count
          (dotimes (number count)
            (call-interactively 'sp-backward-symbol))
        (call-interactively 'sp-backward-symbol)))

  (evil-define-command lisp-next-paren (count)
    (interactive "<c>")
    (if count
        (dotimes (number count)
          (call-interactively 'sp-next-sexp))
      (call-interactively 'sp-next-sexp)))

  (evil-define-command lisp-previous-paren (count)
    (interactive "<c>")
    (if count
        (sp-next-sexp (* count -1))
      (sp-next-sexp -1)))

  (general-define-key
   :states '(normal operator visual)
   :keymaps lisp-mode-maps
   [remap evil-delete] 'evil-sp-delete
   [remap evil-change] 'evil-sp-change)

  (general-define-key
   :states 'normal
   :keymaps lisp-mode-maps
   :prefix my-leader2
   "W" (lambda ()
         (interactive)
         (open-paren-around "(" t nil))
   "w" (lambda ()
         (interactive)
         (open-paren-around "(" t t))
   "e)" (lambda ()
          (interactive)
          (open-paren-around "(" t nil))
   "e(" (lambda ()
          (interactive)
          (open-paren-around "(" t t))
   "e}" (lambda ()
          (interactive)
          (open-paren-around "{" t nil))
   "e{" (lambda ()
          (interactive)
          (open-paren-around "{" t t))
   "e]" (lambda ()
          (interactive)
          (open-paren-around "[" t nil))
   "e[" (lambda ()
          (interactive)
          (open-paren-around "[" t t))
   "e}" (lambda ()
          (interactive)
          (open-paren-around "{" t nil))
   "e{" (lambda ()
          (interactive)
          (open-paren-around "{" t t))
   "i" (lambda ()
         (interactive)
         (open-paren-around "(" nil t))
   "I" (lambda ()
         (interactive)
         (open-paren-around "(" nil nil))
   "(" (lambda ()
         (interactive)
         (open-paren-around "(" nil t))
   ")" (lambda ()
         (interactive)
         (open-paren-around "(" nil nil))
   "[" (lambda ()
         (interactive)
         (open-paren-around "[" nil t))
   "]" (lambda ()
         (interactive)
         (open-paren-around "[" nil nil))
   "{" (lambda ()
         (interactive)
         (open-paren-around "{" nil t))
   "}" (lambda ()
         (interactive)
         (open-paren-aroundn "{" nil nil))
   "@" 'sp-splice-sexp
   "o" (lambda ()
         (interactive)
         (when (string-match-p "^[^\[({]" (thing-at-point 'sexp t))
           (sp-backward-up-sexp))
         (sp-raise-sexp))
   "O" 'sp-raise-sexp)

  (general-define-key
   :states 'normal
   :keymaps lisp-mode-maps
   ;;c is defined in vim-exchange
   "W" 'symex-traverse-forward-skip
   "w" 'symex-traverse-forward
   "B" 'symex-traverse-backward-skip
   "b" 'symex-traverse-backward

   "(" 'sp-backward-up-sexp
   ")" (lambda ()
         (interactive)
         (sp-backward-up-sexp)
         (evilmi-jump-items))
   ">" (general-key-dispatch 'evil-shift-right
         "I" (lambda ()
               (interactive)
               (sp-end-of-sexp)
               (when (not (char-equal (preceding-char)  ?  ))
                 (insert " "))
               (evil-insert nil))
         ")" 'sp-forward-slurp-sexp
         "(" 'sp-backward-barf-sexp)
   "<" (general-key-dispatch 'evil-shift-left
         "I" (lambda ()
               (interactive)
               (sp-beginning-of-sexp)
               (when (not (char-equal (following-char)  ?  ))
                 (insert " ")
                 (evil-backward-char))
               (evil-insert nil))
         ")" 'sp-forward-barf-sexp
         "(" 'sp-backward-slurp-sexp)

   [remap evil-change-line] 'evil-sp-change-line
   [remap evil-delete-line] 'evil-sp-delete-line)


  (general-def 'normal
    ">" (general-key-dispatch 'evil-shift-right
          ")" 'sp-forward-slurp-sexp
          "(" 'sp-backward-barf-sexp)
    "<" (general-key-dispatch 'evil-shift-left
          ")" 'sp-forward-barf-sexp
          "(" 'sp-backward-slurp-sexp)))

(use-package tex
  :if (not (my/is-android-p))
  :ensure (auctex :pre-build (("./autogen.sh")
                              ("./configure" "--without-texmf-dir" "--with-lispdir=.")
                              ("make")
                              ("install-info" "doc/auctex.info" "doc/dir")
                              ("install-info" "doc/preview-latex.info" "doc/dir")))
  :init
  (add-hook 'latex-mode-local-vars-hook '(lambda () (setq TeX-command-default "latexmk")))
  (add-hook 'latex-mode-local-vars-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (push
               '("latexmk" "latexmk -pdf -pvc %s" TeX-run-TeX nil t
                 :help "Run latexmk on file")
               TeX-command-list)))
  ;;:defer t
  :config
  (setq-default TeX-quote-after-quote t)
  ;;(auctex-latexmk-setup)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t))

(use-package projectile
    :config
    ;; test fn in hashtabe has to be equal because we will use strings as keys
    (setq my-projects-loaded (make-hash-table :test 'equal))
    (setq projectile-completion-system 'default)
    (projectile-global-mode))

(use-package popup)

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode #'rainbow-delimiters-mode)
  )

(use-package undo-tree
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t
        ;; 10X bump of the undo limits to avoid issues with premature
        ;; Emacs GC which truncages the undo history very aggresively
        undo-limit 800000
        undo-strong-limit 12000000
        undo-outer-limit 120000000)
  :config
  (progn

  (global-undo-tree-mode 1)
    (setq undo-tree-enable-undo-in-region nil
          undo-tree-visualizer-diff t
          undo-tree-visualizer-timestamps t
          undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))))

(use-package recentf
  :ensure nil
  :config
  (recentf-mode 1)
  )

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :ensure nil
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Enable consult
(use-package consult)

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; The :init configuration is always executed (Not lazy!)
  :init
  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package embark
    :ensure t
    :after (evil general)
    :bind
    (("C-." . embark-act)         ;; pick some comfortable binding
     ("C-;" . embark-dwim)        ;; good alternative: M-.
     ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

    :init

    ;; Optionally replace the key help with a completing-read interface
    (setq prefix-help-command #'embark-prefix-help-command)

    ;;(setq embark-prompter 'embark-keymap-prompter)


    :config
    (general-define-key
     :states 'normal
     :keymaps 'override
     "C-." 'embark-act)


    ;; Hide the mode line of the Embark live/completions buffers

    (add-to-list 'display-buffer-alist
                 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                   nil
                   (window-parameters (mode-line-format . none))))

)

  ;; Consult users will also want the embark-consult package.
  (use-package embark-consult
    :ensure t
    :after (embark consult)
    :demand t ; only necessary if you have the hook below
    ;; if you want to have consult previews as you move around an
    ;; auto-updating embark collect buffer
    :hook
    (embark-collect-mode . consult-preview-at-point-mode))

(use-package rainbow-mode
  :config)

(use-package command-log-mode
  :config)

;;(tab-bar-mode 1)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)
(setq tab-bar-position nil)

(use-package modern-tab-bar
:ensure (modern-tab-bar :host github :repo "aaronjensen/emacs-modern-tab-bar" :protocol ssh)
:init
(setq tab-bar-show t
      tab-bar-new-button nil
      tab-bar-close-button-show nil)

(modern-tab-bar-mode))

(use-package highlight-symbol
  :init
  (highlight-symbol-mode t)
  :config
  ;; Overwrite functions for performance imporments.
  ;; See  https://github.com/nschum/highlight-symbol.el/issues/26   
  (defun highlight-symbol-add-symbol-with-face (symbol face)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward symbol nil t)
        (let ((ov (make-overlay (match-beginning 0)
                                (match-end 0))))
          (overlay-put ov 'highlight-symbol t)
          (overlay-put ov 'face face)))))
  (defun highlight-symbol-remove-symbol (_symbol)
    (dolist (ov (overlays-in (point-min) (point-max)))
      (when (overlay-get ov 'highlight-symbol)
        (delete-overlay ov))))

  ;; Configuration
  (setq highlight-symbol-idle-delay 1.5))

(load "dired-x")

(setq dired-dwim-target t)

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))

(setq delete-by-moving-to-trash t)

(setq dired-listing-switches "-alh")

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-recursive-copies 'always
      dired-recursive-deletes 'always)

(use-package diredfl
  :init
  (diredfl-global-mode 1))

(use-package dired-git-info)

(use-package dired-subtree
  :after (dired)
  :config)

(use-package ranger
  :after (dired))

(use-package peep-dired)

(use-package dired-sidebar
      :after (dired)
      :commands (dired-sidebar-toggle-sidebar)
      :init
      (general-define-key :prefix my-leader "TAB" 'dired-sidebar-toggle-sidebar)
      ;; (setq dired-sidebar-use-custom-modeline t)
      ;; (setq dired-sidebar-mode-line-format nil)
      (add-hook 'dired-sidebar-mode-hook (lambda ()
                                           (linum-mode -1)
                                           (fringe-mode 0)
                                           (hl-line-mode)
                                           (set-face-background hl-line-face "#1b182c")
                                           (setq buffer-face-mode-face `(:background "#100e23"))
                                           (buffer-face-mode 1)))


      :config
      ;; (setq dired-sidebar-theme 'nerd)
      ;; (setq dired-sidebar-use-term-integration t)
      ;; (setq dired-sidebar-use-custom-font t)
      )

(use-package all-the-icons-dired
    :after (all-the-icons)
    :hook  ('dired-mode . 'all-the-icons-dired-mode)
    ;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
)

(defun my/dired-open-file ()
      "In dired, open the file named on this line."
      (interactive)
      (let* ((file (dired-get-filename nil t)))
        (call-process "xdg-open" nil 0 nil file)))

  (defun my/dired-up-directory ()
    "Take dired up one directory, but behave like dired-find-alternative-file (leave no orphan buffer)"
    (interactive)
    (let ((old (current-buffer)))
      (dired-up-directory)
      (kill-buffer old)))

  (defun my/dired-create-file (file)
    (interactive
     (list
      (read-file-name "Create file: " (dired-current-directory))))
    (write-region "" nil (expand-file-name file) t)
    (dired-add-file file)
    (revert-buffer)
    (dired-goto-file (expand-file-name file)))

(with-eval-after-load 'general
  (general-define-key :keymaps '(dired-mode-map)
                      :states '(normal)
                      "h" 'my/dired-up-directory
                      "DEL" 'my/dired-up-directory
                      (kbd "S-<return>") 'my/dired-open-file
                      "RET" 'dired-find-alternate-file
                      "TAB" 'dired-subtree-toggle
                      "i" 'peep-dired
                      "l" 'dired-find-alternate-file
                      "c" 'dired-do-rename
                      "C" 'dired-do-copy
                      "y" 'dired-ranger-copy
                      "p" 'dired-ranger-paste
                      "v" 'dired-ranger-move
                      "R" 'dired-do-redisplay
                      "r" 'wdired-change-to-wdired-mode
                      "o" 'my/dired-create-file
                      "O" 'dired-create-directory
                      "n" 'evil-ex-search-next
                      "N" 'evil-ex-search-previous
                      "q" 'kill-this-buffer
                      "!" 'dired-do-shell-command))

(use-package restclient)

(defun my-sql-login-hook ()
  "Custom SQL log-in behaviours. See `sql-login-hook'."
  ;; n.b. If you are looking for a response and need to parse the
  ;; response, use `sql-redirect-value' instead of `comint-send-string'.
  (when (eq sql-product 'postgres)
    (let ((proc (get-buffer-process (current-buffer))))
      ;; Output each query before executing it. (n.b. this also avoids
      ;; the psql prompt breaking the alignment of query results.)
      (comint-send-string proc "\\set ECHO queries\n"))))

(use-package sqlup-mode
  :config
  (add-hook 'sql-mode-hook (lambda () (sqlup-mode 1))))

(use-package web-mode
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq css-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  )

(use-package js2-mode
  :init
  ;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
  (setq
   js2-skip-preprocessor-directives nil   ; allow shebangs in js-files (for node)
   ;; default values for indentation (possibly overwritten by editorconfig)
   js2-basic-offset 2
   js-indent-level 2
   js-expr-indent-offset -2)
  :config
  ;; do not show errors (use flycheck for that)
  (js2-mode-hide-warnings-and-errors))

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package add-node-modules-path
  :init
  (add-hook 'js2-mode-hook #'add-node-modules-path))

(use-package rjsx-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

(use-package docker :if (not (my/is-android-p)))

(use-package dockerfile-mode)

(use-package yaml-mode
    :config)

(use-package wgrep
  :config
  (setq wgrep-enable-key "w")
  (setq wgrep-auto-save-buffer t)
  )

(use-package rg
  :config
  (rg-enable-menu))

(setq ag-highlight-search t)
  ;;(setq ag-reuse-window 't)

(use-package whitespace
  :ensure nil
  :after (general)
  :init
  (global-whitespace-mode 1)
  :config
  (setq-default
   whitespace-style '(face trailing space-before-tab::tab tab-mark)
   whitespace-line-column nil) ;; use fill-column by default
  (set-face-attribute 'whitespace-line nil :underline "#ff0000" :inherit 'normal)
  (general-add-hook 'prog-mode-hook (lambda ()
                                      (setq-local whitespace-style
                                                (cons 'lines-tail whitespace-style))))
  (setq whitespace-global-modes '(not
                                  dired-mode
                                  alchemist-test-mode
                                  alchemist-iex-mode
                                  vterm-mode
                                  cider-repl-mode)))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package pdf-tools
  :mode (("\\.pdf\\'" . pdf-view-mode))
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook (lambda ()
                                  (setq display-line-numbers nil)))
                                  (setq pdf-view-midnight-colors '("#cbe3e7" . "#1b182c" )))

(use-package evil-goggles
  :config
  (setq evil-goggles-duration 0.150)
  :init
  (evil-goggles-mode))

(use-package evil-traces
  :config
  (evil-traces-use-diff-faces)
  (evil-traces-mode))

(use-package editorconfig
  :init
  (editorconfig-mode 1))

(when (and (not (my/is-android-p))
           (fboundp 'global-display-fill-column-indicator-mode))
  (global-display-fill-column-indicator-mode))

(use-package ace-window
  :after (hydra general)
  :init
  (general-define-key :prefix my-leader "W" 'ace-window)
  (ace-window-display-mode 1)
  :config
  (set-face-attribute 'aw-leading-char-face nil :background nil :foreground (face-attribute 'error :foreground))
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        ;;aw-background nil
        aw-dispatch-always t
        aw-dispatch-alist
        '((?x aw-delete-window     "Ace - Delete Window")
          (?c aw-swap-window       "Ace - Swap Window")
          (?w aw-flip-window)
          (?o delete-other-windows)
          (?b balance-windows)
          ))

  (defhydra hydra-window-size (:color red)
    "Windows size"
    ("h" shrink-window-horizontally "shrink horizontal")
    ("j" shrink-window "shrink vertical")
    ("k" enlarge-window "enlarge vertical")
    ("l" enlarge-window-horizontally "enlarge horizontal"))
  (add-to-list 'aw-dispatch-alist '(?r hydra-window-size/body) t)

  )

(use-package mood-line
  :ensure t
  :config
  ;; Enable mood-line
  (mood-line-mode))

(use-package spacious-padding
  :ensure t
  :hook (server-after-make-frame . spacious-padding-mode)
  :init
  (setq spacious-padding-subtle-mode-line t))

(use-package dumb-jump
  :config
  ;; integrate with evil-jump (C-i, C-o)
  (advice-add 'dumb-jump-go :before (lambda (&rest r) (evil-set-jump))))

(use-package vlf
  :init
  (require 'vlf-setup))

(use-package jsonrpc)
(use-package eglot
  :after (eldoc jsonrpc)
  :init
  (add-hook 'clojure-mode-hook 'eglot-ensure)
  ;;(remove-hook 'clojure-mode-hook 'eglot-ensue)
  :config
  (setq eglot-connect-timeout 120))

(use-package langtool
  :after (general)
  :init
  (general-define-key
   :states '(normal visual)
   :keymaps 'override
   :prefix my-leader
   "L" 'langtool-check)
  (general-define-key
   :states '(normal)
   :keymaps 'override
   "]L" 'langtool-goto-next-error
   "[L" 'langtool-goto-previous-error)
  :config
  ;; (setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")
  ;;(setq langtool-language-tool-jar "~/Downloads/LanguageTool-4.4/languagetool-commandline.jar")
  (setq langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"
        langtool-mother-tongue "de-AT")
  (set-face-attribute 'langtool-errline nil :foreground nil :background (face-attribute 'trailing-whitespace :background))

 (face-attribute 'warning :foreground)
  (require 'langtool))

(use-package reformatter
  :config
  (reformatter-define
   clojure-format
   :program "zprint"))

(use-package format-all)

(setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")

(use-package scratch)

(use-package highlight-escape-sequences
  :init (hes-mode))

(use-package elisp-demos
  :init
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update)
 (advice-add 'describe-function-1 :after #'elisp-demos-advice-describe-function-1))

(use-package helpful)

(use-package restart-emacs)

(use-package suggest)

(use-package ob-async
  :init
  (require 'ob-async))

(use-package ob-graphql
  :init
  (require 'ob-graphql))

(use-package vterm)

(use-package notdeft
  :ensure (:host github
             :repo "hasu/notdeft"
             :files ("*.el" "xapian"))
  :init
  (autoload 'notdeft-xapian-make-program-when-uncurrent "notdeft-xapian-make")
  (add-hook 'notdeft-load-hook 'notdeft-xapian-make-program-when-uncurrent)
  (add-hook 'org-mode-hook 'notdeft-note-mode)
  :config
  (autoload 'notdeft-mode-hydra/body "notdeft-mode-hydra")
  (setq notdeft-directories '("~/org/notes"))
  (setq notdeft-extension "org")
  ;;(setq notdeft-xapian-programm "~/.emacs.d/straight/build/notdeft/xapian/notdeft-xapian")
  (setq notdeft-secondary-extensions '("md" "txt"))
  )

(use-package envrc
 :ensure t
 :config
 (envrc-global-mode))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 3)
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-items '((projects  . 5)
                          (bookmarks . 5)
                          (recents . 5)))
(add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
(add-hook 'elpaca-after-init-hook #'dashboard-initialize)
(dashboard-setup-startup-hook)
)

(use-package ansible
  :init (add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt))

(use-package gcmh
  :ensure t
  :init (gcmh-mode 1))

(use-package ledger-mode)

(use-package journalctl-mode)

(use-package ob-mermaid
  :config
  (setq ob-mermaid-cli-path "/home/max/.config/yarn/global/node_modules/.bin/mmdc"))

(use-package bufler)

(use-package no-littering)

(use-package symex
        :after (general evil)
        :custom
        (symex-modal-backend 'evil)
        :config
        (symex-initialize)
        (general-define-key
         :states '(normal)
         :keymaps lisp-mode-maps
         :prefix my-leader2
         "s" 'symex-mode-interface)
         ;; (general-define-key
         ;;  :states '(normal)
         ;;  :keymaps lisp-mode-maps
         ;;  "<escape>" 'symex-mode-interface)
        ;; (general-define-key
        ;;  :states '(insert)
        ;;  :keymaps lisp-mode-maps
        ;;  "<escape>" 'symex-mode-interface)
)

(use-package zenity-color-picker)

(use-package org-modern
    :hook (org-mode . org-modern-mode))

(use-package ligature
  :ensure (:host github :repo "mickeynp/ligature.el")
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package osm
    :ensure t
    :custom
    ;; Take a look at the customization group `osm' for more options.
    (osm-server 'default) ;; Configure the tile server
    ;;(osm-home '())
    ;;(osm-copyright t)     ;; Display the copyright information
)

(use-package literate-calc-mode
:ensure t)

(use-package casual-lib
:ensure (:repo "kickingvegas/casual-lib"
         :host github))
(use-package casual-dired
:ensure (:repo "kickingvegas/casual-dired"
         :host github))
(use-package casual-calc
:ensure (:repo "kickingvegas/casual-calc"
         :host github))

;; open minions minior mode menu with: minions-minor-modes-menu
  (use-package minions
    :config (minions-mode 1))

(use-package solaire-mode
  :defer t
  :custom
  (solaire-global-mode +1))

(use-package treesit-auto
  :if (not (my/is-android-p))
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package atomic-chrome
  :demand t
  :ensure (:repo "KarimAziev/atomic-chrome"
           :host github)
  :commands (atomic-chrome-start-server)
  :config (atomic-chrome-start-server))

(use-package indent-bars
  :demand t
  :ensure (:repo "jdtsmith/indent-bars"
           :host github
           :hook ((python-mode yaml-mode emacs-lisp-mode clojure-mode make makefile-gmake-mode) . indent-bars-mode)))

(use-package calc
  :ensure nil
  :config
;; TODO Does not work (setting comma instead of dot)
  ;;(setq calc-point-char ",")
  ;;(setq calc-group-char ".")
  )
