;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-
(add-to-list
 'default-frame-alist
 `(menu-bar-lines
   . ,(if (and window-system (eq system-type 'darwin)) 1 0)))

(let ((default-directory user-emacs-directory)
      (file-name-handler-alist nil)
      (read-process-output-max (* 1024 1024)))

  ;; ;; Disable that pesky echo message
  ;; (setq inhibit-startup-echo-area-message user-login-name)

  ;; Mark safe variables early so that tangling won't break
  (put 'after-save-hook 'safe-local-variable
       (lambda (value) (equal value '(org-babel-tangle t))))
  (put 'display-line-numbers-width 'safe-local-variable 'integerp)

  ;; Load local variables
  (let ((local-variables (expand-file-name "local-variables.el" user-emacs-directory)))
    (if (file-exists-p local-variables)
        (load-file local-variables)))

  ;; Set proxies
  (setq url-proxy-services init/local-proxies)
  ;; Tangle and compile if necessary only, then load the configuration
  (let* ((.org "conf.org")
         (.el (concat (file-name-sans-extension .org) ".el"))
         (.var "local-variables.el")
         (modification-time
          (file-attribute-modification-time (file-attributes .org)))
         (var-modification-time
          (file-attribute-modification-time (file-attributes .var))))
    (require 'org-macs)
    (unless (and (org-file-newer-than-p .el modification-time)
                 (org-file-newer-than-p .el var-modification-time))
      (require 'ob-tangle)
      (org-babel-tangle-file .org .el "emacs-lisp"))
    (load-file .el))

  ;; Collect garbage when all else is done
  (garbage-collect))
(put 'list-timers 'disabled nil)
(put 'magit-edit-line-commit 'disabled nil)
(defun retangle-org-file ()
  "tangle org file manually"
  (interactive)
  (let* ((default-directory user-emacs-directory)
         (.org "conf.org")
         (.el (concat (file-name-sans-extension .org) ".el"))
         (modification-time
          (file-attribute-modification-time (file-attributes .org))))
    (require 'org-macs)
    (require 'ob-tangle)
    (org-babel-tangle-file .org .el "emacs-lisp")))
