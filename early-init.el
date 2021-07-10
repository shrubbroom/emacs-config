;;; early-init.el --- Emacs early init -*- lexical-binding: t; -*-
(setq gc-cons-threshold 100000000)
(setq-default
 default-frame-alist
 '((horizontal-scroll-bars . nil)       ;; No horizontal scroll-bars
   (left-fringe . 8)                    ;; Thin left fringe
   (right-fringe . 8)                   ;; Thin right fringe
   (menu-bar-lines . 0)                 ;; No menu bar
   (tool-bar-lines . 0)                 ;; No tool bar
   (vertical-scroll-bars . nil)))       ;; No vertical scroll-bars
(defvar init/idle-gc-timer
  (run-with-idle-timer 20
                       t
                       'garbage-collect))
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
                         ("melpa-stable" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa-stable/")
                         ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
