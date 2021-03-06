;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(set 'temporary-file-directory "/tmp")


;; auctex not finding packages https://tex.stackexchange.com/a/24543/1783
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/local/bin/latex" ":"

 (getenv "PATH")))

;; MELPA repository http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
'("melpa-stable" . "http://melpa.org/packages/") t)
(package-initialize) 

;;;; Themes / Settings
;; install Monaco http://askubuntu.com/a/333410
;; curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash
(set-default-font "Monaco-16")
;;(add-to-list 'default-frame-alist '(font . "Monaco-14"))
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

(require 'tex)
(require 'tex-site)
(TeX-global-PDF-mode t)

(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(TeX-PDF-mode t)
'(font-latex-fontify-sectioning (quote color))
'(package-selected-packages
(quote
(zenburn-theme ess-R-object-popup ess))))
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
(add-to-list 'auto-mode-alist '("\\.Rscript" . r-mode))

;;; YAML Mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;;;;;;;;;;;;;;
;;Writing Modes
;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook (lambda ()
(progn
;; Spelling
(flyspell-mode t)
;; Grammar
(require 'langtool)
(setq langtool-language-tool-jar "~/.emacs.d/LanguageTool-2.9/languagetool.jar")
(setq langtool-mother-tongue "en")
)))

;;;;;;;;;;
;;Remap keys on mac
;;;;;;;;;

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
