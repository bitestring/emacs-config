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
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tango))
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

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

;; source control
(use-package magit)

;; configure magit to use full buffer instead of a popup
(use-package fullframe
  :init (fullframe magit-status magit-mode-quit-window nil))

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(provide 'init)

;;; init.el ends here
