;;; local-variables.el --- Emacs local variables (this is just a template) -*- lexical-bindings:t; -*-
(setq init/local-proxies '(("http" . "localhost:xxxx")
                           ("https" . "localhost:xxxx")
                           ("no_proxy" . "0.0.0.0")))
(defun init/define-path ()
  (add-to-list 'exec-path "/opt/somethine/bin")
  (setenv "SOMETHING_PREFIX" "/opt/something")
  (setenv "PATH" (mapconcat 'identity exec-path ":")))
(setq init/system-dark-modep (string= (shell-command-to-string "defaults read -g AppleInterfaceStyle") "Dark\n"))
(setq init/theme-dark 'badwolf)
(setq init/theme-light 'moe-light)
(provide 'local-variables)
