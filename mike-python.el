;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;; Michael J. Cox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq debug-on-error t)

(add-to-list 'load-path "~/.emacs.d/lisp/python-mode.el-6.1.0")
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;Set up the python interpreter so that it can see other modules in the current
;program directory. For more information, see the following answer: 
;http://stackoverflow.com/questions/2658475/python-mode-import-problem
(defun python-reinstate-current-dir ()
  "For security reasons in the emacs python interpreter, '' as the head of sys.path gets removed. As a result, the interpreter cannot find files imported from the script's current directory"
  (python-send-string "sys.path[0:0] = ['']"))

(add-hook 'inferior-python-mode-hook 'python-reinstate-current-dir)

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	    interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
		    (set-variable 'py-indent-offset 2)
		    (set-variable 'py-smart-indentation nil)
		    (set-variable 'indent-tabs-mode nil) 
		    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
		    ;(pabbrev-mode)
		    ;(abbrev-mode)
	 )
      )
)

(defun python-auto-fill-comments-only ()
  (auto-fill-mode 1)
  (set (make-local-variable 'fill-nobreak-predicate)
       (lambda ()
	 (not (python-in-string/comment)))))

(add-hook 'python-mode-hook
	  (lambda ()
	    (python-auto-fill-comments-only)))

;load pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)