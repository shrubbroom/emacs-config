;;; early-init.el --- Emacs early init -*- lexical-binding: t; -*-
(setq gc-cons-threshold 100000000)
(setq-default
 default-frame-alist
 '((horizontal-scroll-bars . nil)       ;; No horizontal scroll-bars
   (left-fringe . 8)                    ;; Thin left fringe
   (right-fringe . 8)                   ;; Thin right fringe
   ;; (menu-bar-lines . 0)              ;; No menu bar, this would make emacs unable to maximaze in mac port
   (tool-bar-lines . 0)                 ;; No tool bar
   (vertical-scroll-bars . nil)))       ;; No vertical scroll-bars
(defvar init/idle-gc-timer
  (run-with-idle-timer 20
                       t
                       'garbage-collect))
(setq package-enable-at-startup nil)
(setq url-proxy-services
      '(("http" . "localhost:7890")
        ("https" . "localhost:7890")
        ("no_proxy" . "0.0.0.0")))
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;; (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;                          ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
;;                          ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")))
(let ((custom (expand-file-name "custom.el" user-emacs-directory)))
 (unless (file-exists-p custom)
   (warn "creating custom.el since it doesn't exist")
   (with-current-buffer (find-file custom)
     (save-buffer)
     (kill-buffer))))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
