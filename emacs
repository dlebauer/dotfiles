(set 'temporary-file-directory "/tmp")

;; install Monaco http://askubuntu.com/a/333410
;; curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash
(set-default-font "Monaco-14")
(add-to-list 'default-frame-alist '(font . "Monaco-14"))
(setq inhibit-splash-screen t) ;; no splash screen

(display-time) ;;display time on modeline

;; the following should give fullscreen mode
(defun fullscreen ()
 (interactive)
 (set-frame-parameter nil 'fullscreen
		      (if (frame-parameter nil 'fullscreen) nil 'fullboth))
(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  ;; no toolbar
  (menu-bar-mode -1) ;;no menubar
  (scroll-bar-mode -1) ;; no scroll bar
  )
)



(global-set-key [f11] 'fullscreen)

;; to enable color-theme-select
;;(add-to-list 'load-path "/usr/share/emacs-snapshot/site-lisp/emacs-goodies-el/color-theme.el")
;;(require 'color-theme)
;;(load-file "~/.emacs.d/zenburn.el")
;;(color-theme-zenburn)
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(font-latex-fontify-sectioning (quote color))
 '(package-selected-packages
   (quote
    (zenburn-theme ess-R-object-popup ess auctex-latexmk auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq comint-scroll-to-bottom-on-input t)
;;(require 'essd-bugs)
;;(require 'essd-jags)
(require 'ess-site)
;; To open Transparent Remote file Access
(require 'tramp)
(setq tramp-default-method "ssh")

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; MELPA repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; polymode https://github.com/vitoshka/polymode
;;
;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
