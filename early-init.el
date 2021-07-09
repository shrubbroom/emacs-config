(setq gc-cons-threshold 100000000)
(defvar init/idle-gc-timer
  (run-with-idle-timer 20
                       t
                       'garbage-collect))
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
                         ("melpa-stable" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa-stable/")
                         ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")))
(defun init/ensure-package (pkg)
  "ensure that package is installed"
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
