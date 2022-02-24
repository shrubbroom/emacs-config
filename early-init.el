;;; early-init.el --- Emacs early init -*- lexical-binding: t; -*-
(setq gc-cons-threshold 100000000)
(if (eq system-type 'darwin)
 (setq-default
  default-frame-alist
  '((horizontal-scroll-bars . nil) ;; No horizontal scroll-bars
    (left-fringe . 8)              ;; Thin left fringe
    (right-fringe . 8)             ;; Thin right fringe
    ;; (menu-bar-lines . 0)              ;; No menu bar, this would make emacs unable to maximaze in mac port
    (tool-bar-lines . 0)           ;; No tool bar
    (vertical-scroll-bars . nil))) ;; No vertical scroll-bars
 (setq-default
  default-frame-alist
  '((horizontal-scroll-bars . nil)
    (left-fringe . 8)
    (right-fringe . 8)
    (menu-bar-lines . 0)
    (tool-bar-lines . 0)
    (vertical-scroll-bars . nil))))       

(defvar init/idle-gc-timer
  (run-with-idle-timer 20
                       t
                       'garbage-collect))
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")))

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))
(let ((custom (expand-file-name "custom.el" user-emacs-directory)))
 (unless (file-exists-p custom)
   (warn "creating custom.el since it doesn't exist")
   (with-current-buffer (find-file custom)
     (save-buffer)
     (kill-buffer))))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
