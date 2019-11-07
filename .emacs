;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    magit
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(global-linum-mode t) ;; enable line numbers globally
(load-theme 'monokai t)
(split-window-right)
(toggle-frame-maximized)
(set-default-font "Consolas 14")
;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;;(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; init.el ends here
