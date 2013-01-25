(setq default-directory "C:/Users/mjcox/")

;(load "C:\\Users\\mjcox\\Documents\\nxhtml-2.08-100425\\nxhtml\\autostart.el")

(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/vendors")
(progn (cd "~/.emacs.d/vendors")
       (normal-top-level-add-subdirs-to-load-path))

(load-library "mike-python")