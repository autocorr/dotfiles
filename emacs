;; Settings from emacs GUI
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;; Load emacs.d directory
(add-to-list 'load-path "~/.emacs.d/")


;;; General settings
;; Color shell text
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; Line highlighting
(global-hl-line-mode t)
(set-face-background 'hl-line "LemonChiffon1")


;;; Package manager settings
(setq package-list '(evil ido auto-complete fill-column-indicator
		     nlinum))
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;; NLinum
(require 'nlinum)
(global-nlinum-mode)


;;; Evil settings
(require 'evil)
(evil-mode t)


;;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)


;;; Ido
;; -- buffer management
(require 'ido)
(ido-mode t)


;;; Org-mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(setq org-log-done t)


;;; Auto-complete
;(add-to-list 'load-path "~/.emacs.d./auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;;; Fill-column-indicator
;; -- make line at 80 char
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)


;;; Python related settings
;; Emacs-for-python
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;(epy-setup-checker "pyflakes %f")
(epy-setup-ipython)
;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
;; Indentation highlighting
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)



