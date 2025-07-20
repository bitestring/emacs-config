;;; init.el --- Initialization file for emacs

;;; Commentary:
;; Emacs Startup File - Configures plugins

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(context-menu-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages nil)
 '(size-indication-mode t)
 '(tab-bar-mode t)
 '(global-tab-line-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:slant normal :weight regular :height 143 :width normal)))))

;; Org mode customization
(setq org-replace-disputed-keys t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(require 'use-package)

;; essentials
(use-package unicode-fonts
   :ensure t
   :config
    (unicode-fonts-setup))

;; auto dark mode based on system theme
;; https://github.com/LionyxML/auto-dark-emacs
(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((modus-vivendi) (modus-operandi)))
  :config 
  (auto-dark-mode t)
  :init (auto-dark-mode))

;; source control
;; https://magit.vc/
(use-package magit)

;; configure magit to use full buffer instead of a popup
(use-package fullframe
  :init (fullframe magit-status magit-mode-quit-window nil))

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; automatically update packages
;; https://github.com/rranelli/auto-package-update.el
;; https://weavermarquez.github.io/emacs-from-scratch/keeping-your-packages-up-to-date/
(use-package auto-package-update
  :config
  (auto-package-update-maybe))

(provide 'init)

;;; init.el ends here
