;; =====================================================================
;; General emacs  
;; =====================================================================

;; Don't open the start up message
(setq inhibit-startup-message t)

;; Wrap lines for viewing but not for save:
(global-visual-line-mode 1)

;; Save the desktop on exit:
(desktop-save-mode 1)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))

;; Theme
(load-theme 'misterioso t)
(set-cursor-color "#dcdcdc")
(setq-default cursor-type 'box)

;; Keyboard shortcuts:
(define-key global-map (kbd "C-c C-f") 'find-name-dired)
(define-key global-map (kbd "s-s") 'rgrep)
(define-key global-map (kbd "C-c C-a") 'find-grep-dired)
(define-key global-map (kbd "C-x t")   'ansi-term)

;; Change C offset (for SU2):
(setq c-basic-offset 2)

;; Default line width
(setq-default fill-column 90)

;; Scrolling settings - smoother scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keybooard scroll one line at a time

;; Dired
(setq dired-listing-switches "-alh")

;; Tramp
(setq tramp-default-method "ssh")

;; Text mode set up:
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; Ibuffer
;; Redirect BufferMenu shortcut to ibuffer:
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Set up filter groups:
(setq ibuffer-saved-filter-groups
      '(("default"
	 ("AMROC Inputs"(or (filename . "solver.in")
			    (filename . "display_file.in")))
	 ("Fortran"         (mode . fortran-mode))
	 ("C/C++"       (or (mode . c-mode)
			    (mode . c++-mode)))
	 ("Make/config" (or (mode . makefile-mode)
			    (mode . autoconf-mode)
			    (filename . "Makefile.am")))
	 ("Python"          (mode . python-mode))
	 ("LaTeX"           (mode . latex-mode))
	 ("Terminals"       (mode . term-mode))
	 ("Dired"           (mode . dired-mode))
	 ("Org"             (mode . org-mode))
	 ("Temporary"       (name . "\*.*\*"))
	 )))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))
