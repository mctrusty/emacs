(setq default-directory "C:/Users/mjcox/")

;(load "C:\\Users\\mjcox\\Documents\\nxhtml-2.08-100425\\nxhtml\\autostart.el")

(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/vendors")
(progn (cd "~/.emacs.d/vendors")
       (normal-top-level-add-subdirs-to-load-path))

(load-library "mike-python")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
