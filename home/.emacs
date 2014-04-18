(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(column-number-mode)

;;-------------------------------------------------------------------------
;; Disable various backup mechanisms as no need, everything is in git
;;
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving
(setq global-auto-revert-mode   t)   ; Auto revert, trust filesystem

;;-------------------------------------------------------------------------
;; Formatting..
;;
(setq-default show-trailing-whitespace t) ; See the hidden!
(show-paren-mode 1)
(setq show-paren-delay 0)

;;-------------------------------------------------------------------------
;; Colorize various macros
;;

(make-face 'z-log-error-face)
(set-face-foreground 'z-log-error-face "orange red")
(set-face-attribute 'z-log-error-face nil
                    :weight 'bold)

(make-face 'z-log-warning-face)
(set-face-foreground 'z-log-warning-face "orange")
(set-face-attribute 'z-log-warning-face nil
                    :weight 'bold)

(make-face 'z-log-message-face)
(set-face-foreground 'z-log-message-face "spring green")
(set-face-attribute 'z-log-message-face nil
                    :weight 'bold)

(make-face 'z-log-info-face)
(set-face-foreground 'z-log-info-face "deep sky blue")
(set-face-attribute 'z-log-info-face nil
                    :weight 'bold)

(make-face 'z-log-trace-face)
(set-face-foreground 'z-log-trace-face "dim gray")
(set-face-attribute 'z-log-trace-face nil
                    :weight 'bold)

(font-lock-add-keywords 'c++-mode
                        '(("\\<\\(BOOST_ASSERT(\\([^;]*;\\)\\)" 0 'z-log-trace-face prepend)))
(font-lock-add-keywords 'c++-mode
                        '(("\\<\\(DEBUG(\\([^;]*;\\)\\)" 0 'z-log-trace-face prepend)))
(font-lock-add-keywords 'c++-mode
                        '(("\\<\\(RDEBUG(\\([^;]*;\\)\\)" 0 'z-log-trace-face prepend)))

(load-file "~/.emacs.d/google-c-style.el")

(add-to-list 'load-path "~/.emacs.d" t)
(require 'go-mode-load)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

