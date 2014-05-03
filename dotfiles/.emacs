;; Amith's .emacs configuration

;; Emacs home definition
( defvar emacs-root "d:/Amith/emacs-home/")

;; Set default working directory
( setq default-directory "d:/Amith/" )

;; Add my lisp files to the LOADPATH including sub-directories
(let ((default-directory "d:/Amith/emacs-home/my-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Repo setup
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Load all packages during .emacs. Solves issue with theme load as well.
(setq package-enable-at-startup nil)
(package-initialize)

;; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)


;; Manual proxy configuration
;;(setq url-proxy-services '(("no_proxy" . "hostname\\.com")
                           ("http" . "proxy.hostname.com:80")))

;; Automagically set proxy based on IE proxy settings.
;;(eval-after-load "url"
;;  '(progn
;;     (require 'w32-registry)
;;     (defadvice url-retrieve (before
;;                              w32-set-proxy-dynamically
;;                              activate)
;;       "Before retrieving a URL, query the IE Proxy settings, and use them."
;;       (let ((proxy (w32reg-get-ie-proxy-config)))
;;         (setq url-using-proxy proxy
;;               url-proxy-services proxy)))))


;; Don't show the splash screen. Start directly in the scratch buffer instead. Don't show the scratch buffer message either.
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("9370aeac615012366188359cb05011aea721c73e1cb194798bc18576025cabeb" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(fci-rule-color "#383838")
 '(speedbar-show-unknown-files t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark t)

;; Turn off scroll bar, tool bar and menu bar.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Show the active buffer name in window title
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; Show empty line markers after file end.
(setq-default indicate-empty-lines t)
;; Commented out below as we may not require it.
;;(when (not indicate-empty-lines)
;;  (toggle-indicate-empty-lines))

;; Set tab width and indent using spaces.
(setq tab-width 4
   indent-tabs-mode nil)

;; Turn off file backups.
(setq make-backup-files nil)

;; Set to immediately echo keystrokes
(setq echo-keystrokes 0.1)

;; Don't use dialog boxes. Use the echo area instead.
(setq use-dialog-box nil)

;; No beeping.
(setq visible-bell t)

;; Highlight parantheses
(show-paren-mode t)

;; Display column numbers
(setq column-number-mode t)

;; Ido - easy filesystem navigation
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Enable sr-speedbar
(require 'sr-speedbar )
;; sr-speedbar-open sr-speedbar-close sr-speedbar-toggle sr-speedbar-select-window sr-speedbar-refresh-turn-on
;; sr-speedbar-refresh-turn-off
;; The following can be customized by M-x customize-group RET sr-speedbar RET
;; sr-speedbar-width-x sr-speedbar-max-width sr-speedbar-auto-refresh 

;; Enable display of unknown files in sr-speedbar


;; setup files ending in ".spb" and ".sps" to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.spb\\'" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.sps\\'" . sql-mode))

;; Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; Mouse scroll one line at a time.
(setq mouse-wheel-progressive-speed nil) ;; Don't accelerate scrolling.
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse.
(setq scroll-step 1) ;; Keyboard scroll one line at a time.
(setq scroll-conservatively 10000) ;; slows down scrolling so that buffer window does not jump down or up.
(setq auto-window-vscroll nil) ;; hack to avoid buffer window jump while scrolling.

;; Bind F11 to fullscreen mode.
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)

;; Require powerline
(require 'powerline)
(powerline-default-theme)

;; Increase undo retention
(setq undo-limit 3600)

;; Weatherline Mode
;; To be put in later, once I want it.

;; ediff split window vertically
(setq ediff-split-window-function 'split-window-vertically)
