

;; TODO
;; 1) python mode
;; 2) magit
;; 3) consider Spacemacs-like leader key.
;;I could use general.el for this, but it requires some reading
;;https://github.com/noctuid/general.el
;; 4) Reconsider how this is organized, in particular the package/use-package references



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(which-key-mode)

(with-eval-after-load 'org (global-org-modern-mode))

(tool-bar-mode -1)

(load-theme 'gruvbox-dark-hard t)



(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))


(evil-escape-mode)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)


;;
;;Notes
;; 1) to install packages I am using M-x package-install
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7"
     default))
 '(package-selected-packages
   '(color-theme-sanityinc-tomorrow ess
				    gruvbox-theme
				    which-key-posframe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


