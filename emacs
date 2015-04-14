(set 'temporary-file-directory "/tmp")

;; MELPA repository http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa.org/packages/") t)
(package-initialize) 

;;;; Themes / Settings
;; install Monaco http://askubuntu.com/a/333410
;; curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash
(set-default-font "Monaco-14")
(add-to-list 'default-frame-alist '(font . "Monaco-14"))
(load-theme 'zenburn t)
(setq inhibit-splash-screen t) ;; no splash screen
(display-time) ;;display time on modeline

;; resolves 'Error saving to X clipboard manager.'
(setq x-select-enable-clipboard t)

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


;; ESS 
;; http://stackoverflow.com/a/2710510/199217
(setq comint-scroll-to-bottom-on-input t)
;;(require 'essd-bugs)
;;(require 'essd-jags)
(require 'ess-site)

;; SSH / Tramp
;; To open Transparent Remote file Access
(require 'tramp)
(setq tramp-default-method "ssh")

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; polymode https://github.com/vitoshka/polymode
;;
;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
