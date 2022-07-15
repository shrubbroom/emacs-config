;;; early-init.el --- Emacs early init -*- lexical-binding: t; -*-
(setq gc-cons-threshold 100000000)
(setq-default
  default-frame-alist
  `((horizontal-scroll-bars . nil)
    (left-fringe . 8)
    (right-fringe . 8)
    (tool-bar-lines . 0)
    (vertical-scroll-bars . nil)))
;; set up library for native-comp in macos
(when (eq system-type 'darwin)
  (setenv "LIBRARY_PATH"
          "/opt/homebrew/opt/gcc/lib/gcc/11:/opt/homebrew/opt/libgccjit/lib/gcc/11:/opt/homebrew/opt/gcc/lib/gcc/11/gcc/aarch64-apple-darwin21/11"))
(defvar init/idle-gc-timer
  (run-with-idle-timer 20
                       t
                       'garbage-collect))
(setq package-enable-at-startup nil)
;; (setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
;;                          ("melpa" . "http://elpa.zilongshanren.com/melpa/")))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(let ((custom (expand-file-name "custom.el" user-emacs-directory)))
 (unless (file-exists-p custom)
   (warn "creating custom.el since it doesn't exist")
   (with-current-buffer (find-file custom)
     (save-buffer)
     (kill-buffer))))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
