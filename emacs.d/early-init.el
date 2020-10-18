;;; early-init.el -*- lexical-binding: t; -*-

;; Emacs HEAD (27+) introduces early-init.el, which is run before init.el,
;; before package and UI initialization happens.

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold 268435456)

;;Emacs resizes the (GUI) frame when your newly set font is larger (or smaller)
;;than the system default. This seems to add 0.4-1s to startup.
(setq frame-inhibit-implied-resize t)

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

;;We want the =org-plus-contrib= version of Org mode.
;;Removing the Emacs bundled version from the load-path *should* prevent loading mixed Org versions.
;;e.g. After updating Org mode.
(when-let (orglib (locate-library "org" nil load-path))
  (setq-default load-path (delete (substring (file-name-directory orglib) 0 -1)
                                  load-path)))

(setq menu-bar-mode nil)
(setq tool-bar-mode nil)
(setq scroll-bar-mode nil)
